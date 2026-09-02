import { useState } from "react";
import { Save, User } from "lucide-react";
import { useTranslation } from "react-i18next";

import { useAuth } from "../../hooks/useAuth";
import { getApiErrorMessage } from "../../utils/apiErrorMessageHelper";

export default function UsernameSection() {
  const { t: tCommon } = useTranslation("common");
  const { t: tProfile } = useTranslation("profile");
  const { user, updateProfile } = useAuth();

  const [isSavingUsername, setIsSavingUsername] = useState(false);
  const [isEditingUsername, setIsEditingUsername] = useState(false);

  const [username, setUsername] = useState("");
  const [usernameError, setUsernameError] = useState(null);
  const [usernameApiError, setUsernameApiError] = useState(null);
  const [usernameUpdated, setUsernameUpdated] = useState(false);

  const handleUsernameEdit = () => {
    setUsername(user.username);
    setUsernameError(null);
    setUsernameApiError(null);
    setUsernameUpdated(false);
    setIsEditingUsername(true);
  };

  const handleCancelUsernameEdit = () => {
    setUsername(user.username);
    setUsernameError(null);
    setUsernameApiError(null);
    setIsEditingUsername(false);
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

  const handleUsernameSave = async () => {
    setUsernameError(null);
    setUsernameApiError(null);
    setUsernameUpdated(false);

    const validationError = validateUsername(username);

    if (validationError) {
      setUsernameError(validationError);
      return;
    }

    const trimmedUsername = username.trim();

    if (trimmedUsername === user.username) {
      setIsEditingUsername(false);
      return;
    }

    try {
      setIsSavingUsername(true);

      await updateProfile({
        username: trimmedUsername,
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

  return (
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
                  cursor-pointer
                  text-sm
                  text-amber-400
                  transition-colors
                  hover:text-amber-300
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
  );
}
