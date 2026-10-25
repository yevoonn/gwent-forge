import { Link } from "react-router";
import { Home } from "lucide-react";
import { useTranslation } from "react-i18next";

export default function ErrorState({ icon: Icon, title, description }) {
  const { t } = useTranslation();

  return (
    <div className="flex flex-1 flex-col items-center justify-center px-6 py-16 text-center">
      <div className="flex max-w-sm flex-col items-center">
        <span className="mb-6 flex h-20 w-20 items-center justify-center rounded-2xl border border-slate-700 bg-slate-900/70 text-amber-400 shadow-lg shadow-amber-500/10">
          <Icon size={36} />
        </span>

        <h1 className="font-cinzel text-2xl font-bold text-amber-400">
          {title}
        </h1>

        {description && (
          <p className="mt-3 text-sm text-slate-400">{description}</p>
        )}

        <Link
          to="/"
          className="
            mt-8
            flex
            h-12
            items-center
            justify-center
            gap-2
            rounded-xl
            bg-amber-400
            px-6
            font-bold
            text-black
            transition-all
            duration-200
            hover:bg-amber-300
            active:scale-[0.98]
          "
        >
          <Home size={18} />
          {t("user_deck.home")}
        </Link>
      </div>
    </div>
  );
}
