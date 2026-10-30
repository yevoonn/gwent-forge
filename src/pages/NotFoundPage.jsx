import { Compass } from "lucide-react";
import { useTranslation } from "react-i18next";
import ErrorState from "../components/ui/ErrorState";

export default function NotFoundPage() {
  const { t } = useTranslation();

  return (
    <ErrorState
      icon={Compass}
      title={t("not_found_page.title")}
      description={t("not_found_page.description")}
    />
  );
}
