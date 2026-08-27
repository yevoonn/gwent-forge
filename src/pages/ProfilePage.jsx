import { useEffect, useState } from "react";
import { useTranslation } from "react-i18next";
import { Mail, Shield, User } from "lucide-react";

import { useAuth } from "../hooks/useAuth";

export default function ProfilePage() {
  const { t: tCommon } = useTranslation("common");
  const { t: tProfile } = useTranslation("profile");
  const { user, loadProfile } = useAuth();

  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

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
    <main className="mx-auto max-w-screen-xl px-6 py-12">
      <div className="mx-auto max-w-2xl">
        <h1 className="font-cinzel text-3xl font-semibold text-amber-400">
          {tProfile("title")}
        </h1>

        <div className="mt-8 overflow-hidden rounded-xl border border-slate-700 bg-slate-900/70">
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
            <div className="flex items-center gap-4 p-5">
              <User size={20} className="text-slate-400" />

              <div>
                <p className="text-sm text-slate-400">{tProfile("username")}</p>

                <p className="text-white">{user.username}</p>
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

                <p className="text-white">
                  {user.isEmailVerified
                    ? tProfile("verified")
                    : tProfile("not_verified")}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  );
}
