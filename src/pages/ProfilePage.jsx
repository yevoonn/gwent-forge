import { motion } from "motion/react";
import { useEffect, useState } from "react";
import { useTranslation } from "react-i18next";
import { Mail, Save, Shield, User } from "lucide-react";

import { useAuth } from "../hooks/useAuth";

import { getApiErrorMessage } from "../utils/apiErrorMessageHelper";

export default function ProfilePage() {
  const { t: tCommon } = useTranslation("common");
  const { t: tProfile } = useTranslation("profile");
  const { user, loadProfile, updateProfile } = useAuth();

  const [isLoading, setIsLoading] = useState(true);
  const [isSavingUsername, setIsSavingUsername] = useState(false);
  const [isEditingUsername, setIsEditingUsername] = useState(false);

  const [error, setError] = useState(null);

  const [username, setUsername] = useState("");
  const [usernameError, setUsernameError] = useState(null);
  const [usernameApiError, setUsernameApiError] = useState(null);
  const [usernameUpdated, setUsernameUpdated] = useState(false);

  useEffect(() => {
    const fetchProfile = async () => {
      try {
        setError(null);
        await loadProfile();
      } catch (error) {
        console.error("Profile error:", error);
        setError(error);
      } finally {
        setIsLoading(false);
      }
    };

    fetchProfile();
  }, [loadProfile]);

  const handleUsernameEdit = () => {
    setUsername(user.username);
    setUsernameError(null);
    setUsernameUpdated(false);
    setIsEditingUsername(true);
  };

  const handleCancelUsernameEdit = () => {
    setUsername(user.username);
    setUsernameError(null);
    setIsEditingUsername(false);
  };

  const handleUsernameSave = async () => {
    setUsernameError(null);
    setUsernameApiError(null);
    setUsernameUpdated(false);

    const validationError = validateUsername(username);

    if (validationError) {
      setUsernameError(validationError);
      return;
    }

    try {
      setIsSavingUsername(true);

      await updateProfile({
        username: username.trim(),
      });

      setIsEditingUsername(false);
      setUsernameUpdated(true);
    } catch (error) {
      console.error("Username update error:", error);
      setUsernameApiError(error);
    } finally {
      setIsSavingUsername(false);
    }
  };

  const validateUsername = (value) => {
    const trimmedUsername = value.trim();

    if (!trimmedUsername) {
      return tProfile("username_required");
    }

    if (trimmedUsername.length < 3) {
      return tProfile("username_too_short");
    }

    if (trimmedUsername.length > 12) {
      return tProfile("username_too_long");
    }

    return null;
  };

  if (isLoading) {
    return (
      <main className="mx-auto max-w-screen-xl px-6 py-12">
        <p className="text-slate-400">{tCommon("spinner.text")}</p>
      </main>
    );
  }

  if (error || !user) {
    return (
      <main className="mx-auto max-w-screen-xl px-6 py-12">
        <p className="text-red-400">{tCommon("errors.generic")}</p>
      </main>
    );
  }

  return (
    <div className="mx-auto max-w-screen-2xl px-6 py-12 text-white">
      {/* HERO */}
      <motion.section
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
        className="text-center"
      >
        <h1 className="font-cinzel text-4xl font-bold tracking-tight text-white md:text-6xl">
          {tProfile("title")}
        </h1>
      </motion.section>

      {/* PROFILE CARD */}
      <motion.section
        initial={{ opacity: 0, y: 24 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-80px" }}
        transition={{ duration: 0.5 }}
        className="mx-auto mt-16 max-w-2xl"
      >
        <div className="overflow-hidden rounded-3xl border border-slate-700 bg-slate-900/60 backdrop-blur-sm">
          <div className="flex items-center gap-4 border-b border-slate-700 p-6">
            <div className="flex h-14 w-14 items-center justify-center rounded-full bg-slate-800 text-amber-400">
              <User size={28} />
            </div>

            <div>
              <h2 className="text-xl font-semibold text-white">
                {user.username}
              </h2>

              <p className="text-sm text-slate-400">{user.email}</p>
            </div>
          </div>

          <div className="divide-y divide-slate-700">
            <div className="flex items-start gap-4 p-5">
              <User size={20} className="mt-1 text-slate-400" />

              <div className="min-w-0 flex-1">
                <p className="text-sm text-slate-400">{tProfile("username")}</p>

                {isEditingUsername ? (
                  <div className="mt-2">
                    <input
                      type="text"
                      value={username}
                      onChange={(event) => setUsername(event.target.value)}
                      disabled={isSavingUsername}
                      className="
                        w-full
                        rounded-lg
                        border
                        border-slate-600
                        bg-slate-800
                        px-3
                        py-2
                        text-white
                        outline-none
                        transition-colors
                        focus:border-amber-400
                        disabled:cursor-not-allowed
                        disabled:opacity-50
                      "
                    />

                    <div className="mt-3 flex justify-end gap-2">
                      <button
                        type="button"
                        onClick={handleUsernameSave}
                        disabled={isSavingUsername}
                        className="
                          box-border
                          flex
                          h-10
                          flex-1
                          items-center
                          justify-center
                          gap-2
                          rounded-lg
                          bg-amber-400
                          px-4
                          text-sm
                          font-medium
                          text-slate-950
                          transition-colors
                          hover:bg-amber-300
                          disabled:cursor-not-allowed
                          disabled:opacity-50
                          cursor-pointer
                          sm:flex-none
                          sm:w-24
                        "
                      >
                        {isSavingUsername ? (
                          <div
                            className="
                              h-4
                              w-4
                              animate-spin
                              rounded-full
                              border-2
                              border-gray-400
                              border-t-transparent
                            "
                          />
                        ) : (
                          <>
                            <Save size={16} />
                            <span>{tProfile("save")}</span>
                          </>
                        )}
                      </button>

                      <button
                        type="button"
                        onClick={handleCancelUsernameEdit}
                        disabled={isSavingUsername}
                        className="
                          box-border
                          flex
                          h-10
                          flex-1
                          items-center
                          justify-center
                          rounded-lg
                          border
                          border-slate-600
                          px-4
                          text-sm
                          font-medium
                          text-slate-300
                          transition-colors
                          hover:border-slate-500
                          hover:text-white
                          disabled:cursor-not-allowed
                          disabled:opacity-50
                          cursor-pointer
                          sm:flex-none
                          sm:w-24
                        "
                      >
                        {tProfile("cancel")}
                      </button>
                    </div>

                    {usernameError && (
                      <p className="mt-2 text-left text-sm text-red-300 sm:text-right">
                        {usernameError}
                      </p>
                    )}

                    {usernameApiError && (
                      <p className="mt-2 text-left text-sm text-red-300 sm:text-right">
                        {getApiErrorMessage(usernameApiError, tCommon)}
                      </p>
                    )}
                  </div>
                ) : (
                  <div className="mt-1">
                    <div className="flex items-center justify-between gap-4">
                      <p className="truncate text-white">{user.username}</p>

                      <button
                        type="button"
                        onClick={handleUsernameEdit}
                        className="
                            shrink-0
                            text-sm
                            text-amber-400
                            transition-colors
                            hover:text-amber-300
                            cursor-pointer
                          "
                      >
                        {tProfile("edit")}
                      </button>
                    </div>

                    {usernameUpdated && (
                      <p className="mt-2 text-sm text-green-300">
                        {tProfile("username_updated")}
                      </p>
                    )}
                  </div>
                )}
              </div>
            </div>

            <div className="flex items-center gap-4 p-5">
              <Mail size={20} className="text-slate-400" />

              <div>
                <p className="text-sm text-slate-400">{tProfile("email")}</p>

                <p className="text-white">{user.email}</p>
              </div>
            </div>

            <div className="flex items-center gap-4 p-5">
              <Shield size={20} className="text-slate-400" />

              <div>
                <p className="text-sm text-slate-400">{tProfile("role")}</p>

                <p className="text-white">{tProfile(user.role)}</p>
              </div>
            </div>

            <div className="flex items-center gap-4 p-5">
              <Mail size={20} className="text-slate-400" />

              <div>
                <p className="text-sm text-slate-400">
                  {tProfile("email_verified")}
                </p>

                {user.isEmailVerified ? (
                  <p className="text-green-300">{tProfile("verified")}</p>
                ) : (
                  <p className="text-red-300">{tProfile("not_verified")}</p>
                )}
              </div>
            </div>
          </div>
        </div>
      </motion.section>
    </div>
  );
}
