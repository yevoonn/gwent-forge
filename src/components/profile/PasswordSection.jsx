import { useState } from "react";
import { KeyRound, Save } from "lucide-react";
import { useTranslation } from "react-i18next";

import { useAuth } from "../../hooks/useAuth";
import { getApiErrorMessage } from "../../utils/apiErrorMessageHelper";

export default function PasswordSection() {
  const { t: tCommon } = useTranslation("common");
  const { t: tProfile } = useTranslation("profile");
  const { changePassword, logout } = useAuth();

  const [isSavingPassword, setIsSavingPassword] = useState(false);
  const [isEditingPassword, setIsEditingPassword] = useState(false);

  const [currentPassword, setCurrentPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");

  const [passwordError, setPasswordError] = useState(null);
  const [passwordApiError, setPasswordApiError] = useState(null);

  const handlePasswordEdit = () => {
    setCurrentPassword("");
    setNewPassword("");
    setConfirmPassword("");
    setPasswordError(null);
    setPasswordApiError(null);
    setIsEditingPassword(true);
  };

  const handleCancelPasswordEdit = () => {
    setCurrentPassword("");
    setNewPassword("");
    setConfirmPassword("");
    setPasswordError(null);
    setPasswordApiError(null);
    setIsEditingPassword(false);
  };

  const validatePassword = () => {
    if (!currentPassword) {
      return tProfile("current_password_required");
    }

    if (!newPassword) {
      return tProfile("new_password_required");
    }

    if (newPassword.length < 8) {
      return tProfile("new_password_too_short");
    }

    if (newPassword.length > 128) {
      return tProfile("new_password_too_long");
    }

    if (!confirmPassword) {
      return tProfile("confirm_password_required");
    }

    if (newPassword !== confirmPassword) {
      return tProfile("passwords_do_not_match");
    }

    return null;
  };

  const handlePasswordSave = async () => {
    setPasswordError(null);
    setPasswordApiError(null);

    const validationError = validatePassword();

    if (validationError) {
      setPasswordError(validationError);
      return;
    }

    setIsSavingPassword(true);

    try {
      await changePassword({
        currentPassword,
        newPassword,
      });

      await logout();
    } catch (error) {
      console.error("Password change error:", error);
      setPasswordApiError(error);
    } finally {
      setIsSavingPassword(false);
    }
  };

  return (
    <div className="flex items-start gap-4 p-5">
      <KeyRound size={20} className="mt-1 text-slate-400" />

      <div className="min-w-0 flex-1">
        <p className="text-sm text-slate-400">{tProfile("password")}</p>

        {isEditingPassword ? (
          <div className="mt-2 space-y-3">
            <input
              type="password"
              value={currentPassword}
              onChange={(event) => setCurrentPassword(event.target.value)}
              disabled={isSavingPassword}
              placeholder={tProfile("current_password")}
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

            <input
              type="password"
              value={newPassword}
              onChange={(event) => setNewPassword(event.target.value)}
              disabled={isSavingPassword}
              placeholder={tProfile("new_password")}
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

            <input
              type="password"
              value={confirmPassword}
              onChange={(event) => setConfirmPassword(event.target.value)}
              disabled={isSavingPassword}
              placeholder={tProfile("confirm_password")}
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

            <div className="flex justify-end gap-2">
              <button
                type="button"
                onClick={handlePasswordSave}
                disabled={isSavingPassword}
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
                {isSavingPassword ? (
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
                onClick={handleCancelPasswordEdit}
                disabled={isSavingPassword}
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

            {passwordError && (
              <p className="text-left text-sm text-red-300 sm:text-right">
                {passwordError}
              </p>
            )}

            {passwordApiError && (
              <p className="text-left text-sm text-red-300 sm:text-right">
                {getApiErrorMessage(passwordApiError, tCommon)}
              </p>
            )}
          </div>
        ) : (
          <div className="mt-1">
            <div className="flex items-center justify-between gap-4">
              <p className="text-white">••••••••</p>

              <button
                type="button"
                onClick={handlePasswordEdit}
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
          </div>
        )}
      </div>
    </div>
  );
}
