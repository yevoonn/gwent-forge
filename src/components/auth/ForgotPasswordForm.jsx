import { useState } from "react";
import { useTranslation } from "react-i18next";
import { useAuth } from "../../hooks/useAuth";
import { getApiErrorMessage } from "../../utils/apiErrorMessageHelper";

export default function ForgotPasswordForm() {
  const { t, i18n } = useTranslation();
  const { forgotPassword, isLoading } = useAuth();

  const [email, setEmail] = useState("");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const handleChange = (event) => {
    setEmail(event.target.value);
    setError("");
    setSuccess("");
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    setError("");
    setSuccess("");

    try {
      await forgotPassword(email, i18n.resolvedLanguage ?? "en");

      // The same message is shown whether or not the email exists.
      setSuccess(t("auth.forgot_password_form.success"));
    } catch (error) {
      setError(getApiErrorMessage(error, t));
    }
  };

  return (
    <>
      <div className="mb-6 text-center">
        <h1 className="font-cinzel text-2xl font-bold text-amber-400 sm:text-3xl">
          {t("auth.forgot_password_form.title")}
        </h1>

        <p className="mx-auto mt-2 max-w-md text-sm leading-6 text-slate-400">
          {t("auth.forgot_password_form.subtitle")}
        </p>
      </div>

      {success && (
        <p
          className="
            mb-4
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
      )}

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label
            htmlFor="forgot-password-email"
            className="mb-1.5 block text-sm text-slate-300"
          >
            {t("auth.forgot_password_form.email.label")}
          </label>

          <input
            id="forgot-password-email"
            name="email"
            type="email"
            value={email}
            onChange={handleChange}
            autoComplete="email"
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
            ? t("auth.forgot_password_form.button.loading")
            : t("auth.forgot_password_form.button.static")}
        </button>
      </form>
    </>
  );
}
