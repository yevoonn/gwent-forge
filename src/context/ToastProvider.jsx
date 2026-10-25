import { useCallback, useEffect, useState } from "react";
import { AnimatePresence, motion } from "motion/react";
import { AlertCircle, CheckCircle2, X } from "lucide-react";
import { useTranslation } from "react-i18next";
import { useLocation, useNavigate } from "react-router";
import { ToastContext } from "./ToastContext";

const TOAST_DURATION = 3000; // ms

// Use full class names, because Tailwind does not detect classes
// that are constructed dynamically.
const variants = {
  success: {
    icon: CheckCircle2,
    border: "border-emerald-400/60",
    glow: "shadow-[0_10px_40px_-8px_rgba(52,211,153,0.45)]",
    tile: "bg-emerald-400/15 text-emerald-400",
    bar: "bg-emerald-400",
  },
  error: {
    icon: AlertCircle,
    border: "border-red-400/60",
    glow: "shadow-[0_10px_40px_-8px_rgba(248,113,113,0.45)]",
    tile: "bg-red-400/15 text-red-400",
    bar: "bg-red-400",
  },
};

export function ToastProvider({ children }) {
  const { t } = useTranslation();
  const location = useLocation();
  const navigate = useNavigate();

  // Restore the Google login success notification after the OAuth redirect.
  const [toast, setToast] = useState(() => {
    const searchParams = new URLSearchParams(location.search);

    if (searchParams.get("googleAuthSuccess") === "1") {
      return {
        id: "oauth",
        type: "success",
        messageKey: "auth.login_success",
      };
    }

    return null;
  });

  const showToast = useCallback((message, type = "success") => {
    // id triggers a re-animation when a toast appears twice in a row
    setToast({ id: Date.now(), message, type });
  }, []);

  const dismissToast = useCallback(() => {
    setToast(null);
  }, []);

  // Remove the Google OAuth success parameter after reading it.
  useEffect(() => {
    const searchParams = new URLSearchParams(location.search);

    if (searchParams.get("googleAuthSuccess") !== "1") {
      return;
    }

    searchParams.delete("googleAuthSuccess");

    navigate(
      {
        pathname: location.pathname,
        search: searchParams.toString() ? `?${searchParams.toString()}` : "",
        hash: location.hash,
      },
      { replace: true },
    );
  }, [location.hash, location.pathname, location.search, navigate]);

  // Automatically dismiss the notification.
  useEffect(() => {
    if (!toast) {
      return;
    }

    const timeoutId = setTimeout(() => {
      setToast(null);
    }, TOAST_DURATION);

    return () => clearTimeout(timeoutId);
  }, [toast]);

  const value = {
    showToast,
    dismissToast,
  };

  const variant = variants[toast?.type] ?? variants.success;
  const Icon = variant.icon;

  return (
    <ToastContext.Provider value={value}>
      {children}

      <div className="pointer-events-none fixed inset-x-0 top-4 z-[200] flex justify-center px-4">
        <AnimatePresence mode="popLayout">
          {toast && (
            <motion.div
              key={toast.id}
              role={toast.type === "error" ? "alert" : "status"}
              aria-live={toast.type === "error" ? "assertive" : "polite"}
              initial={{ opacity: 0, y: -32, scale: 0.95 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              exit={{ opacity: 0, y: -16, scale: 0.97 }}
              transition={{ type: "spring", damping: 24, stiffness: 320 }}
              className={`
                pointer-events-auto
                relative
                flex
                w-full
                max-w-sm
                items-center
                gap-3
                overflow-hidden
                rounded-2xl
                border
                bg-slate-900
                p-3
                pr-4
                text-white
                ring-1
                ring-white/5
                ${variant.border}
                ${variant.glow}
              `}
            >
              <span
                className={`flex h-10 w-10 shrink-0 items-center justify-center rounded-xl ${variant.tile}`}
              >
                <Icon size={22} />
              </span>

              <p className="flex-1 text-sm font-medium leading-snug">
                {toast.messageKey ? t(toast.messageKey) : toast.message}
              </p>

              <button
                type="button"
                onClick={dismissToast}
                aria-label="Dismiss notification"
                className="
                  shrink-0
                  cursor-pointer
                  rounded-lg
                  p-1
                  text-slate-400
                  transition-colors
                  hover:text-white
                "
              >
                <X size={18} />
              </button>

              {/* PROGRESS */}
              <motion.div
                className={`absolute bottom-0 left-0 h-0.5 w-full origin-left ${variant.bar}`}
                initial={{ scaleX: 1 }}
                animate={{ scaleX: 0 }}
                transition={{ duration: TOAST_DURATION / 1000, ease: "linear" }}
              />
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </ToastContext.Provider>
  );
}
