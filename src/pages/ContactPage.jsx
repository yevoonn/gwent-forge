import { useTranslation } from "react-i18next";

export default function ContactPage() {
  const { t } = useTranslation();

  return (
    <div className="mx-auto max-w-screen-2xl px-6 py-12 text-white">
      <h1 className="font-cinzel text-4xl text-amber-400">
        {t("contact.title")}
      </h1>{" "}
      <p className="mt-4 text-lg text-slate-300">{t("contact.description")}</p>
    </div>
  );
}
