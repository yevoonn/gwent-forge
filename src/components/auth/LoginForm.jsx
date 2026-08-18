import { useState } from "react";
import { useTranslation } from "react-i18next";
import { useAuth } from "../../hooks/useAuth";

export default function LoginForm({
  onClose,
  onModeChange,
  successMessage,
  onSuccessMessageClear,
}) {
  const { t } = useTranslation();
  const { login, isLoading } = useAuth();

  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });

  const [error, setError] = useState("");

  const handleChange = (event) => {
    const { name, value } = event.target;

    setFormData((prev) => ({
      ...prev,
      [name]: value,
    }));

    setError("");
    onSuccessMessageClear();
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    setError("");

    try {
      await login(formData);
      onClose();
    } catch (error) {
      setError(error.message);
    }
  };

  return (
    <>
      <div className="mb-6 text-center">
        <h2 className="font-cinzel text-2xl font-bold text-amber-400">
          {t("auth.login.title", "Login")}
        </h2>

        <p className="mt-2 text-sm text-slate-400">
          {t("auth.login.subtitle", "Sign in to your Gwent Forge account")}
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

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label
            htmlFor="login-email"
            className="mb-1.5 block text-sm text-slate-300"
          >
            {t("auth.email", "Email")}
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
            {t("auth.password", "Password")}
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

        {error && (
          <p className="text-sm text-red-400" role="alert">
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
          {isLoading ? "Logging in..." : "Login"}
        </button>
      </form>

      <p className="mt-6 text-center text-sm text-slate-400">
        Don't have an account?{" "}
        <button
          type="button"
          onClick={onModeChange}
          className="text-amber-400 transition-colors hover:text-amber-300 cursor-pointer"
        >
          Register
        </button>
      </p>
    </>
  );
}
