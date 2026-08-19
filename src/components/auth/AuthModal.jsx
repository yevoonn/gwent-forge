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
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          transition={{ duration: 0.2 }}
          className="
            fixed
            inset-0
            z-[100]
            flex
            items-center
            justify-center
            bg-black/70
            p-4
            backdrop-blur-sm
          "
          onMouseDown={(event) => {
            if (event.target === event.currentTarget) {
              onClose();
            }
          }}
        >
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
              scale: 0.97,
            }}
            animate={{
              opacity: 1,
              y: 0,
              scale: 1,
            }}
            exit={{
              opacity: 0,
              y: 20,
              scale: 0.97,
            }}
            transition={{
              duration: 0.2,
              ease: "easeOut",
            }}
            className="
              relative
              w-full
              max-w-md
              overflow-hidden
              rounded-2xl
              border
              border-slate-700
              bg-slate-950/95
              shadow-2xl
            "
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
        </motion.div>
      )}
    </AnimatePresence>
  );
}
