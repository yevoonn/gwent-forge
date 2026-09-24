import { useEffect, useRef, useState } from "react";
import { useSearchParams } from "react-router";
import { useTranslation } from "react-i18next";
import { useAuth } from "../hooks/useAuth";
import { motion } from "motion/react";
import { BadgeCheck, ShieldAlert, LoaderCircle } from "lucide-react";
import { verifyEmail } from "../api/auth";
import { getApiErrorMessage } from "../utils/apiErrorMessageHelper";

export default function VerifyEmailPage() {
  const { t } = useTranslation("common");
  const { requestLogin } = useAuth();

  const [searchParams] = useSearchParams();

  const token = searchParams.get("token");

  const [status, setStatus] = useState(token ? "loading" : "invalid");
  const [errorMessage, setErrorMessage] = useState("");

  const verificationStarted = useRef(false);

  useEffect(() => {
    if (!token || verificationStarted.current) {
      return;
    }

    verificationStarted.current = true;

    async function verify() {
      try {
        await verifyEmail(token);
        setStatus("success");
      } catch (error) {
        setErrorMessage(getApiErrorMessage(error, t));
        setStatus("error");
      }
    }

    verify();
  }, [token, t]);

  if (status === "loading") {
    return (
      <div className="flex flex-1 items-center justify-center px-6 py-12">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
          className="w-full max-w-xl rounded-3xl border border-slate-700 bg-slate-900/60 p-8 text-center backdrop-blur-sm sm:p-10"
        >
          <div className="mx-auto flex w-fit rounded-xl bg-amber-400/10 p-4 text-amber-400">
            <LoaderCircle size={32} className="animate-spin" />
          </div>

          <h1 className="mt-6 font-cinzel text-2xl font-semibold text-white sm:text-3xl">
            {t("auth.verifyEmail.verifyingTitle")}
          </h1>

          <p className="mx-auto mt-4 max-w-md text-slate-400 leading-relaxed">
            {t("auth.verifyEmail.verifying")}
          </p>
        </motion.div>
      </div>
    );
  }

  if (status === "success") {
    return (
      <div className="flex flex-1 items-center justify-center px-6 py-12">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
          className="w-full max-w-xl rounded-3xl border border-emerald-500/30 bg-slate-900/60 p-8 text-center backdrop-blur-sm sm:p-10"
        >
          <div className="mx-auto flex w-fit rounded-xl bg-emerald-500/10 p-4 text-emerald-400">
            <BadgeCheck size={32} />
          </div>

          <h1 className="mt-6 font-cinzel text-2xl font-semibold text-emerald-300 sm:text-3xl">
            {t("auth.verifyEmail.successTitle")}
          </h1>

          <p className="mx-auto mt-4 max-w-md text-slate-300 leading-relaxed">
            {t("auth.verifyEmail.successMessage")}
          </p>

          <button
            type="button"
            onClick={() =>
              requestLogin(t("auth.verifyEmail.loginSuccessMessage"))
            }
            className="
              mt-6
              w-full
              rounded-lg
              bg-amber-400
              px-4
              py-2.5
              font-semibold
              text-slate-950
              transition
              hover:bg-amber-300
              cursor-pointer
              sm:w-auto
              sm:min-w-32
            "
          >
            {t("auth.verifyEmail.loginButton")}
          </button>
        </motion.div>
      </div>
    );
  }

  return (
    <div className="flex flex-1 items-center justify-center px-6 py-12">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
        className="w-full max-w-xl rounded-3xl border border-red-500/30 bg-red-950/20 p-8 text-center backdrop-blur-sm sm:p-10"
      >
        <div className="mx-auto flex w-fit rounded-xl bg-red-500/10 p-4 text-red-400">
          <ShieldAlert size={32} />
        </div>

        <h1 className="mt-6 font-cinzel text-2xl font-semibold text-red-300 sm:text-3xl">
          {t("auth.verifyEmail.errorTitle")}
        </h1>

        <p className="mx-auto mt-4 max-w-md text-slate-300 leading-relaxed">
          {errorMessage || t("auth.verifyEmail.errorMessage")}
        </p>
      </motion.div>
    </div>
  );
}
