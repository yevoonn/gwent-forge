import { useState } from "react";
import { useTranslation } from "react-i18next";
import { useAuth } from "../../hooks/useAuth";

export default function RegisterForm({ onModeChange, onSuccess }) {
  const { t } = useTranslation();
  const { register, isLoading } = useAuth();

  const [formData, setFormData] = useState({
    email: "",
    username: "",
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
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    setError("");

    try {
      await register(formData);

      // Registration does not automatically authenticate the user yet.
      // Return to login after successful registration.
      onSuccess();
    } catch (error) {
      setError(error.message);
    }
  };

  return (
    <>
      <div className="mb-6 text-center">
        <h2 className="font-cinzel text-2xl font-bold text-amber-400">
          {t("auth.register.title", "Create account")}
        </h2>

        <p className="mt-2 text-sm text-slate-400">
          {t("auth.register.subtitle", "Create your Gwent Forge account")}
        </p>
      </div>

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label
            htmlFor="register-email"
            className="mb-1.5 block text-sm text-slate-300"
          >
            {t("auth.email", "Email")}
          </label>

          <input
            id="register-email"
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
            htmlFor="register-username"
            className="mb-1.5 block text-sm text-slate-300"
          >
            {t("auth.username", "Username")}
          </label>

          <input
            id="register-username"
            name="username"
            type="text"
            value={formData.username}
            onChange={handleChange}
            autoComplete="username"
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
            htmlFor="register-password"
            className="mb-1.5 block text-sm text-slate-300"
          >
            {t("auth.password", "Password")}
          </label>

          <input
            id="register-password"
            name="password"
            type="password"
            value={formData.password}
            onChange={handleChange}
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
          <p className="text-sm text-red-400" role="alert">
            {error}
          </p>
        )}

        <button
          type="submit"
          disabled={isLoading}
          className={`
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
            ${isLoading ? "cursor-wait" : "cursor-pointer"}
          `}
        >
          {isLoading ? "Creating account..." : "Register"}
        </button>
      </form>

      <p className="mt-6 text-center text-sm text-slate-400">
        Already have an account?{" "}
        <button
          type="button"
          onClick={onModeChange}
          className="text-amber-400 transition-colors hover:text-amber-300 cursor-pointer"
        >
          Login
        </button>
      </p>
    </>
  );
}
