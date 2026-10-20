import { useTranslation } from "react-i18next";
import Sheet from "../ui/Sheet";
import CardFiltersContent from "./CardFiltersContent";

export default function CardFiltersPanel({ isOpen, onClose, ...contentProps }) {
  const { t } = useTranslation();

  return (
    <Sheet open={isOpen} onClose={onClose} title={t("filters.title")}>
      <CardFiltersContent {...contentProps} />
    </Sheet>
  );
}
