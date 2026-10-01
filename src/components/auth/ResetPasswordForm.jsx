import { useState } from "react";
import { useSearchParams } from "react-router";
import { useTranslation } from "react-i18next";

import { useAuth } from "../../hooks/useAuth";
import { getApiErrorMessage } from "../../utils/apiErrorMessageHelper";

export default function ResetPasswordForm() {
  const { t } = useTranslation();
  const { resetPassword, requestLogin, isLoading } = useAuth();
  const [searchParams] = useSearchParams();

  const token = searchParams.get("token");

  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();

    setError("");
    setSuccess("");

    if (!token) {
      setError(t("auth.reset_password_form.errors.missing_token"));
      return;
    }

    if (newPassword !== confirmPassword) {
      setError(t("auth.reset_password_form.errors.passwords_do_not_match"));
      return;
    }

    try {
      await resetPassword(token, newPassword);

      setSuccess(t("auth.reset_password_form.success"));
    } catch (error) {
      setError(getApiErrorMessage(error, t));
    }
  };

  const handlePasswordChange = (event) => {
    setNewPassword(event.target.value);
    setError("");
    setSuccess("");
  };

  const handleConfirmPasswordChange = (event) => {
    setConfirmPassword(event.target.value);
    setError("");
    setSuccess("");
  };

  return (
    <>
      <div className="mb-6 text-center">
        <h1 className="font-cinzel text-2xl font-bold text-amber-400 sm:text-3xl">
          {t("auth.reset_password_form.title")}
        </h1>

        <p className="mx-auto mt-2 max-w-md text-sm leading-6 text-slate-400">
          {t("auth.reset_password_form.subtitle")}
        </p>
      </div>

      {success && (
        <div className="mb-4">
          <p
            className="
              rounded-lg
              border
              border-emerald-500/30
              bg-emerald-500/10
              px-3
              py-3
              text-center
              text-sm
              leading-6
              text-emerald-400
            "
            role="status"
          >
            {success}
          </p>

          <button
            type="button"
            onClick={() => requestLogin()}
            className="
              mt-4
              w-full
              rounded-lg
              border
              border-amber-400
              px-4
              py-2.5
              font-semibold
              text-amber-400
              transition
              hover:bg-amber-400
              hover:text-slate-950
              cursor-pointer
            "
          >
            {t("auth.reset_password_form.back_to_login")}
          </button>
        </div>
      )}

      {!success && (
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label
              htmlFor="reset-password-new"
              className="mb-1.5 block text-sm text-slate-300"
            >
              {t("auth.reset_password_form.new_password.label")}
            </label>

            <input
              id="reset-password-new"
              name="newPassword"
              type="password"
              value={newPassword}
              onChange={handlePasswordChange}
              autoComplete="new-password"
              required
              className="
                w-full
                rounded-lg
                border
                border-slate-700
                bg-slate-900
                px-3
                py-2.5
                text-white
                outline-none
                transition
                focus:border-amber-400
              "
            />
          </div>

          <div>
            <label
              htmlFor="reset-password-confirm"
              className="mb-1.5 block text-sm text-slate-300"
            >
              {t("auth.reset_password_form.confirm_password.label")}
            </label>

            <input
              id="reset-password-confirm"
              name="confirmPassword"
              type="password"
              value={confirmPassword}
              onChange={handleConfirmPasswordChange}
              autoComplete="new-password"
              required
              className="
                w-full
                rounded-lg
                border
                border-slate-700
                bg-slate-900
                px-3
                py-2.5
                text-white
                outline-none
                transition
                focus:border-amber-400
              "
            />
          </div>

          {error && (
            <p className="text-center text-sm text-red-400" role="alert">
              {error}
            </p>
          )}

          <button
            type="submit"
            disabled={isLoading}
            className="
              w-full
              rounded-lg
              bg-amber-400
              px-4
              py-2.5
              font-semibold
              text-slate-950
              transition
              hover:bg-amber-300
              disabled:cursor-not-allowed
              disabled:opacity-60
              cursor-pointer
            "
          >
            {isLoading
              ? t("auth.reset_password_form.button.loading")
              : t("auth.reset_password_form.button.static")}
          </button>
        </form>
      )}
    </>
  );
}
