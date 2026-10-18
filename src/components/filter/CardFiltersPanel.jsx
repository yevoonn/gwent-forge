import { useTranslation } from "react-i18next";
import useMediaQuery from "../../hooks/useMediaQuery";
import Sheet from "../ui/Sheet";
import CardFiltersContent from "./CardFiltersContent";

export default function CardFiltersPanel({
  filters,
  isOpen,
  onClose,
  sortField,
  setSortField,
  sortDirection,
  setSortDirection,
  cardType,
  setCardType,
  cardRange,
  setCardRange,
  showOnlySelected,
  setShowOnlySelected,
  hasSelectedCards,
}) {
  const { t } = useTranslation();
  const isDesktop = useMediaQuery("(min-width: 768px)");

  return (
    <Sheet
      open={isOpen}
      onClose={onClose}
      title={t("filters.title")}
      variant={isDesktop ? "modal" : "sheet"}
    >
      <CardFiltersContent
        filters={filters}
        sortField={sortField}
        setSortField={setSortField}
        sortDirection={sortDirection}
        setSortDirection={setSortDirection}
        cardType={cardType}
        setCardType={setCardType}
        cardRange={cardRange}
        setCardRange={setCardRange}
        showOnlySelected={showOnlySelected}
        setShowOnlySelected={setShowOnlySelected}
        hasSelectedCards={hasSelectedCards}
      />
    </Sheet>
  );
}
