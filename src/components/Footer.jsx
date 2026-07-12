import { useTranslation } from "react-i18next";

export default function Footer() {
  const { t } = useTranslation();

  return (
    <footer className="px-6 md:px-16 lg:px-24 xl:px-32 w-full text-sm text-slate-400 pt-12 text-center">
      <p className="py-4 text-center border-t mt-6 border-slate-600">
        {t("footer.description_1")}
      </p>
      <p className="pb-4">{t("footer.description_2")}</p>
    </footer>
  );
}
