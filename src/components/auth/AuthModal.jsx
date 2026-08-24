import { useState } from "react";
import { AnimatePresence, motion } from "motion/react";
import { X } from "lucide-react";
import { useTranslation } from "react-i18next";

import LoginForm from "./LoginForm";
import RegisterForm from "./RegisterForm";

export default function AuthModal({
  isOpen,
  mode = "login",
  onClose,
  onModeChange,
}) {
  const { t } = useTranslation();
  const [successMessage, setSuccessMessage] = useState("");

  const handleModeChange = (nextMode) => {
    setSuccessMessage("");
    onModeChange(nextMode);
  };

  const handleRegisterSuccess = () => {
    setSuccessMessage(t("auth.register_form.message.register_success"));
    onModeChange("login");
  };

  return (
    <AnimatePresence>
      {isOpen && (
        <>
          {/* BACKDROP */}
          <motion.div
            className="fixed inset-0 z-[100] bg-black/70"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 0.15 }}
            onClick={onClose}
          />

          {/* DRAWER FOR MOBILE */}
          <motion.div
            className="
              fixed
              bottom-0
              left-0
              right-0
              z-[101]
              rounded-t-3xl
              border-t
              border-slate-700
              bg-slate-950/95
              p-6
              md:hidden
            "
            style={{ willChange: "transform" }}
            initial={{ y: "100%" }}
            animate={{ y: 0 }}
            exit={{ y: "100%" }}
            transition={{ duration: 0.15 }}
          >
            <button
              type="button"
              onClick={onClose}
              className="
                absolute
                right-4
                top-4
                z-10
                rounded-lg
                p-1.5
                text-slate-400
                transition-colors
                duration-200
                hover:text-amber-400
                cursor-pointer
              "
              aria-label="Close"
            >
              <X size={22} />
            </button>

            {mode === "login" ? (
              <LoginForm
                onClose={onClose}
                onModeChange={() => handleModeChange("register")}
                successMessage={successMessage}
                onSuccessMessageClear={() => setSuccessMessage("")}
              />
            ) : (
              <RegisterForm
                onModeChange={() => handleModeChange("login")}
                onSuccess={handleRegisterSuccess}
              />
            )}
          </motion.div>

          {/* MODAL FOR DESKTOP */}
          <motion.div
            className="
              fixed
              left-1/2
              top-1/2
              z-[101]
              hidden
              w-full
              max-w-md
              -translate-x-1/2
              -translate-y-1/2
              overflow-hidden
              rounded-2xl
              border
              border-slate-700
              bg-slate-950/95
              md:block
            "
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 0.15 }}
          >
            <button
              type="button"
              onClick={onClose}
              className="
                absolute
                right-4
                top-4
                z-10
                rounded-lg
                p-1.5
                text-slate-400
                transition-colors
                duration-200
                hover:text-amber-400
                cursor-pointer
              "
              aria-label="Close"
            >
              <X size={22} />
            </button>

            <div className="px-6 pb-6 pt-8 sm:px-8">
              {mode === "login" ? (
                <LoginForm
                  onClose={onClose}
                  onModeChange={() => handleModeChange("register")}
                  successMessage={successMessage}
                  onSuccessMessageClear={() => setSuccessMessage("")}
                />
              ) : (
                <RegisterForm
                  onModeChange={() => handleModeChange("login")}
                  onSuccess={handleRegisterSuccess}
                />
              )}
            </div>
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
