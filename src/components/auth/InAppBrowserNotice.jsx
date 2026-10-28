import { useState } from "react";
import { Check, Copy, ExternalLink } from "lucide-react";
import { useTranslation } from "react-i18next";
import { getChromeIntentUrl, isAndroid } from "../../utils/inAppBrowser";

export default function InAppBrowserNotice() {
  const { t } = useTranslation();
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(window.location.href);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <div
      role="note"
      className="rounded-xl border border-amber-400/30 bg-amber-400/10 p-4 text-sm leading-relaxed text-slate-200"
    >
      <p>{t("auth.in_app_browser.message")}</p>

      <div className="mt-3 flex flex-wrap gap-2">
        {isAndroid() && (
          <a
            href={getChromeIntentUrl()}
            className="inline-flex items-center gap-2 rounded-lg bg-amber-400 px-3 py-2 font-bold text-black"
          >
            <ExternalLink size={16} />
            {t("auth.in_app_browser.open")}
          </a>
        )}

        <button
          type="button"
          onClick={handleCopy}
          className="inline-flex cursor-pointer items-center gap-2 rounded-lg border border-slate-600 px-3 py-2 text-slate-200"
        >
          {copied ? <Check size={16} /> : <Copy size={16} />}
          {copied
            ? t("auth.in_app_browser.copied")
            : t("auth.in_app_browser.copy")}
        </button>
      </div>

      {!isAndroid() && (
        <p className="mt-3 text-xs text-slate-400">
          {t("auth.in_app_browser.ios_hint")}
        </p>
      )}
    </div>
  );
}
