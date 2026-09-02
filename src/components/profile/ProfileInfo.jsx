import { Mail, Shield } from "lucide-react";
import { useTranslation } from "react-i18next";

export default function ProfileInfo({ user }) {
  const { t: tProfile } = useTranslation("profile");

  return (
    <>
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
          <p className="text-sm text-slate-400">{tProfile("email_verified")}</p>

          {user.isEmailVerified ? (
            <p className="text-green-300">{tProfile("verified")}</p>
          ) : (
            <p className="text-red-300">{tProfile("not_verified")}</p>
          )}
        </div>
      </div>
    </>
  );
}
