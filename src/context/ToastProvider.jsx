import { useCallback, useEffect, useState } from "react";
import { CheckCircle2, X } from "lucide-react";
import { useTranslation } from "react-i18next";
import { useLocation, useNavigate } from "react-router";
import { ToastContext } from "./ToastContext";

export function ToastProvider({ children }) {
  const { t } = useTranslation();
  const location = useLocation();
  const navigate = useNavigate();

  // Restore the Google login success notification after the OAuth redirect.
  const [toast, setToast] = useState(() => {
    const searchParams = new URLSearchParams(location.search);

    if (searchParams.get("googleAuthSuccess") === "1") {
      return {
        type: "success",
        messageKey: "auth.login_success",
      };
    }

    return null;
  });

  const showToast = useCallback((message, type = "success") => {
    setToast({
      message,
      type,
    });
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

  // Automatically dismiss the notification after four seconds.
  useEffect(() => {
    if (!toast) {
      return;
    }

    const timeoutId = setTimeout(() => {
      setToast(null);
    }, 4000);

    return () => clearTimeout(timeoutId);
  }, [toast]);

  const value = {
    showToast,
    dismissToast,
  };

  return (
    <ToastContext.Provider value={value}>
      {children}

      {toast && (
        <div
          role="status"
          aria-live="polite"
          className="
            fixed
            left-1/2
            top-4
            z-[200]
            -translate-x-1/2
            flex
            w-[calc(100%-2rem)]
            max-w-sm
            items-start
            gap-3
            rounded-xl
            border
            border-emerald-500/30
            bg-slate-950/95
            p-4
            text-white
            shadow-xl
            backdrop-blur-sm
          "
        >
          <CheckCircle2
            size={22}
            className="mt-0.5 shrink-0 text-emerald-400"
          />

          <p className="flex-1 text-sm leading-relaxed">
            {toast.messageKey ? t(toast.messageKey) : toast.message}
          </p>

          <button
            type="button"
            onClick={dismissToast}
            aria-label="Dismiss notification"
            className="
              shrink-0
              text-slate-400
              transition-colors
              hover:text-white
              cursor-pointer
            "
          >
            <X size={18} />
          </button>
        </div>
      )}
    </ToastContext.Provider>
  );
}
