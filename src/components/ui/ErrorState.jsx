import { Link } from "react-router";
import { Home } from "lucide-react";
import { useTranslation } from "react-i18next";

export default function ErrorState({ icon: Icon, title, description }) {
  const { t } = useTranslation();

  return (
    <div className="flex flex-1 items-center justify-center px-6 py-12">
      <div className="w-full max-w-md rounded-3xl border border-slate-700 bg-slate-900/60 p-8 text-center backdrop-blur-sm">
        {Icon && (
          <div className="mx-auto mb-5 flex h-14 w-14 items-center justify-center rounded-xl bg-amber-400/10 text-amber-400">
            <Icon size={28} />
          </div>
        )}

        <h1 className="font-cinzel text-2xl font-semibold text-white">
          {title}
        </h1>

        {description && (
          <p className="mt-3 leading-relaxed text-slate-400">{description}</p>
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
          {t("navigation.home")}
        </Link>
      </div>
    </div>
  );
}
