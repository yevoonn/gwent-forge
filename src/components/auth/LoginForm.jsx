import { useState } from "react";
import { useTranslation } from "react-i18next";
import { useAuth } from "../../hooks/useAuth";
import { useNavigate } from "react-router";

import { API_URL } from "../../config";
import { getApiErrorMessage } from "../../utils/apiErrorMessageHelper";

export default function LoginForm({
  onClose,
  onModeChange,
  successMessage,
  onSuccessMessageClear,
}) {
  const { t, i18n } = useTranslation();
  const { login, resendVerificationEmail, isLoading } = useAuth();
  const navigate = useNavigate();

  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });

  const [error, setError] = useState("");

  const [emailNotVerified, setEmailNotVerified] = useState(false);
  const [resendSuccess, setResendSuccess] = useState("");

  const handleChange = (event) => {
    const { name, value } = event.target;

    setFormData((prev) => ({
      ...prev,
      [name]: value,
    }));

    setError("");
    setEmailNotVerified(false);
    setResendSuccess("");
    onSuccessMessageClear();
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    setError("");
    setEmailNotVerified(false);
    setResendSuccess("");

    try {
      await login(formData);
      onClose();
      navigate("/");
    } catch (error) {
      setError(getApiErrorMessage(error, t));

      if (error.code === "EMAIL_NOT_VERIFIED") {
        setEmailNotVerified(true);
      }
    }
  };

  const handleResendVerification = async () => {
    setError("");
    setResendSuccess("");

    try {
      await resendVerificationEmail(
        formData.email,
        i18n.resolvedLanguage ?? "en",
      );

      setResendSuccess(t("auth.login_form.resend_verification.success"));
    } catch (error) {
      setError(getApiErrorMessage(error, t));
    }
  };

  const handleGoogleLogin = () => {
    window.location.href = `${API_URL}/api/auth/google`;
  };

  return (
    <>
      <div className="mb-6 text-center">
        <h2 className="font-cinzel text-2xl font-bold text-amber-400">
          {t("auth.login_form.title")}
        </h2>

        <p className="mt-2 text-sm text-slate-400">
          {t("auth.login_form.subtitle_1")}
        </p>
      </div>

      {successMessage && (
        <p
          className="
            mb-4
            rounded-lg
            border
            border-emerald-500/30
            bg-emerald-500/10
            px-3
            py-2
            text-sm
            text-emerald-400
            text-center
          "
          role="status"
        >
          {successMessage}
        </p>
      )}

      <button
        type="button"
        onClick={handleGoogleLogin}
        className="
          flex
          w-full
          items-center
          justify-center
          gap-2
          rounded-lg
          border
          border-slate-700
          bg-slate-900
          px-4
          py-2.5
          font-semibold
          text-white
          transition
          hover:border-slate-600
          hover:bg-slate-800
          cursor-pointer
        "
      >
        <span className="text-base font-medium">G</span>
        {t("auth.login_form.google.button")}
      </button>

      <div className="my-5 flex items-center gap-3">
        <div className="h-px flex-1 bg-slate-700" />

        <span className="text-xs text-slate-500">
          {t("auth.login_form.google.or")}
        </span>

        <div className="h-px flex-1 bg-slate-700" />
      </div>

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label
            htmlFor="login-email"
            className="mb-1.5 block text-sm text-slate-300"
          >
            {t("auth.login_form.email.label")}
          </label>

          <input
            id="login-email"
            name="email"
            type="email"
            value={formData.email}
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

        <div>
          <label
            htmlFor="login-password"
            className="mb-1.5 block text-sm text-slate-300"
          >
            {t("auth.login_form.password.label")}
          </label>

          <input
            id="login-password"
            name="password"
            type="password"
            value={formData.password}
            onChange={handleChange}
            autoComplete="current-password"
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

        <p className="text-left">
          <button
            type="button"
            onClick={() => {
              onClose();
              navigate("/forgot-password");
            }}
            className="
              text-sm
              text-amber-400
              transition-colors
              hover:text-amber-300
              cursor-pointer
            "
          >
            {t("auth.login_form.forgot_password.link")}
          </button>
        </p>

        {error && (
          <div className="text-center">
            <p className="text-sm text-red-400" role="alert">
              {error}
            </p>
          </div>
        )}

        {emailNotVerified && (
          <div className="text-center">
            <button
              type="button"
              onClick={handleResendVerification}
              disabled={isLoading}
              className="
                text-sm
                text-amber-400
                transition-colors
                hover:text-amber-300
                disabled:cursor-not-allowed
                disabled:opacity-60
                cursor-pointer
              "
            >
              {t("auth.login_form.resend_verification.button")}
            </button>

            {resendSuccess && (
              <p className="mt-2 text-sm text-emerald-400" role="status">
                {resendSuccess}
              </p>
            )}
          </div>
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
            ? t("auth.login_form.button.loading")
            : t("auth.login_form.button.static")}
        </button>
      </form>

      <p className="mt-6 text-center text-sm text-slate-400">
        {t("auth.login_form.subtitle_2.text") + " "}
        <button
          type="button"
          onClick={onModeChange}
          className="text-amber-400 transition-colors hover:text-amber-300 cursor-pointer"
        >
          {t("auth.login_form.subtitle_2.link")}
        </button>
      </p>
    </>
  );
}
