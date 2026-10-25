import { useState } from "react";
import { useTranslation } from "react-i18next";
import { useAuth } from "../../hooks/useAuth";
import { SlidersHorizontal, ListChecks, Save } from "lucide-react";
import { motion } from "motion/react";
import { deckStatusConfig } from "../../data/deckStatusConfig";
import useMediaQuery from "../../hooks/useMediaQuery";
import useDeckStats from "../../hooks/useDeckStats";
import GwentCard from "./GwentCard";
import CardFilters from "../filter/CardFilters";
import ScrollToTopButton from "../ui/ScrollToTopButton";
import CardsSidePanel from "./CardsSidePanel";
import DeckStatusDrawer from "../ui/DeckStatusDrawer";
import CardDetailsSheet from "../ui/CardDetailsSheet";
import CardDetailsContent from "./CardDetailsContent";
import SectionHeading from "../ui/SectionHeading";
import CardsHeader from "./CardsHeader";
import CardsList from "./CardsList";
import BottomNavBar from "../ui/BottomNavBar";
import SaveDeckModal from "./SaveDeckModal";
import { getIsWarning } from "../../utils/deckStatusHelper";

const leadersContainerVariants = {
  hidden: {},
  show: {
    transition: {
      staggerChildren: 0.08,
    },
  },
};

const cardVariants = {
  hidden: {
    opacity: 0,
    y: 30,
    scale: 0.95,
  },
  show: {
    opacity: 1,
    y: 0,
    scale: 1,
    transition: {
      duration: 0.4,
      ease: "easeOut",
    },
  },
};

export default function CardsGrid({
  userDeck,
  deckCode,
  leaders,
  cards,
  filters,
  search,
  setSearch,
  sortField,
  setSortField,
  sortDirection,
  setSortDirection,
  cardType,
  setCardType,
  cardRange,
  setCardRange,
}) {
  const { t } = useTranslation();
  const { isAuthenticated } = useAuth();
  const isDesktop = useMediaQuery("(min-width: 768px)");

  const [isSaveDeckOpen, setIsSaveDeckOpen] = useState(false);
  const [isFiltersOpen, setIsFiltersOpen] = useState(false);
  const [selectedCards, setSelectedCards] = useState([]);
  const [selectedLeader, setSelectedLeader] = useState(null);
  const [currentUserDeck, setCurrentUserDeck] = useState(userDeck);
  const [detailsCard, setDetailsCard] = useState(null);
  const [showOnlySelected, setShowOnlySelected] = useState(false);
  const [isStatusPanelExpandedDesktop, setIsStatusPanelExpandedDesktop] =
    useState(true);
  const [isStatusPanelExpandedMobile, setIsStatusPanelExpandedMobile] =
    useState(false);
  const [isSelectionInitialized, setIsSelectionInitialized] =
    useState(!userDeck);

  // Initialize the selection from the saved deck once card data is available.
  if (!isSelectionInitialized && leaders.length > 0 && cards.length > 0) {
    const savedCodes = new Set(userDeck.cardCodes);

    setIsSelectionInitialized(true);
    setSelectedLeader(
      leaders.find((leader) => savedCodes.has(leader.code)) ?? null,
    );
    setSelectedCards(cards.filter((card) => savedCodes.has(card.code)));
  }

  const effectiveShowOnlySelected =
    showOnlySelected && selectedCards.length > 0;

  const deckStats = useDeckStats(selectedCards, selectedLeader);

  const statuses = deckStatusConfig.map((status) => ({
    ...status,
    value: deckStats[status.source],
  }));

  const hasWarnings = statuses.some(getIsWarning);

  const handleLeaderClick = (leader) => {
    if (selectedLeader?.code === leader.code) {
      setSelectedLeader(null);
      return;
    }

    setSelectedLeader(leader);
  };

  const handleCardClick = (card) => {
    const alreadySelected = selectedCards.some(
      (selected) => selected.code === card.code,
    );

    if (alreadySelected) {
      const remaining = selectedCards.filter(
        (selected) => selected.code !== card.code,
      );

      setSelectedCards(remaining);

      if (remaining.length === 0) {
        setShowOnlySelected(false);
      }

      return;
    }

    setSelectedCards((current) => [...current, card]);
  };

  const handleShowDetails = (card) => {
    setDetailsCard(card);
  };

  const handleCloseDetails = () => {
    setDetailsCard(null);
  };

  const isCardSelected = (card) =>
    selectedCards.some((selected) => selected.code === card.code);

  const visibleCards = effectiveShowOnlySelected
    ? cards.filter(isCardSelected)
    : cards;

  const hasSelectedCards = selectedCards.length > 0;

  const isLeaderSelected = (leader) => selectedLeader?.code === leader.code;

  const deckId = leaders[0]?.deck?.id ?? cards[0]?.deck?.id;

  const deckCardCodes = [
    ...new Set([
      ...(selectedLeader ? [selectedLeader.code] : []),
      ...selectedCards.map((card) => card.code),
    ]),
  ];

  const hasActiveFilters = Boolean(
    cardType || cardRange || effectiveShowOnlySelected,
  );

  const filterProps = {
    filters,
    sortField,
    setSortField,
    sortDirection,
    setSortDirection,
    cardType,
    setCardType,
    cardRange,
    setCardRange,
    showOnlySelected: effectiveShowOnlySelected,
    setShowOnlySelected,
    hasSelectedCards,
  };

  const bottomBarActions = [
    {
      id: "filters",
      icon: SlidersHorizontal,
      label: t("filters.title"),
      onClick: () => setIsFiltersOpen(true),
      badge: hasActiveFilters,
    },
    {
      id: "deck-status",
      icon: ListChecks,
      label: t("deck_status.title"),
      onClick: () => setIsStatusPanelExpandedMobile(true),
      warning: hasWarnings,
    },
    ...(isAuthenticated
      ? [
          {
            id: "save-deck",
            icon: Save,
            label: t("save_deck.short"),
            onClick: () => setIsSaveDeckOpen(true),
          },
        ]
      : []),
  ];

  return (
    <>
      <div className="flex items-start gap-4 px-6">
        {isDesktop && (
          <CardsSidePanel
            expanded={isStatusPanelExpandedDesktop}
            onToggle={() => setIsStatusPanelExpandedDesktop((prev) => !prev)}
            statuses={statuses}
            hasWarnings={hasWarnings}
            search={search}
            setSearch={setSearch}
            filterProps={filterProps}
            canSaveDeck={isAuthenticated}
            onSaveDeck={() => setIsSaveDeckOpen(true)}
            saveLabel={t(userDeck ? "save_deck.open_edit" : "save_deck.open")}
          />
        )}

        <div className="mx-auto min-w-0 max-w-screen-2xl flex-1">
          <CardsHeader deckCode={deckCode} />
          {/* LEADERS */}
          <section className="pt-4 md:pt-8" aria-labelledby="leaders-heading">
            <SectionHeading
              id="leaders-heading"
              title={t("sections.leader_title")}
              subtitle={
                selectedLeader ? selectedLeader.name : t("sections.leader_hint")
              }
            />
            <motion.div
              key="leaders"
              className="flex flex-wrap justify-center gap-8"
              variants={leadersContainerVariants}
              initial="hidden"
              animate="show"
              exit={{
                opacity: 0,
              }}
            >
              {leaders.map((card) => (
                <motion.div key={card.code} variants={cardVariants}>
                  <GwentCard
                    code={card.code}
                    name={card.name}
                    power={null}
                    deckCode={deckCode}
                    image={card.image_url}
                    type={card.type.code}
                    ability={card.abilities.length ? card.abilities[0] : null}
                    showTooltip
                    isSelected={isLeaderSelected(card)}
                    onClick={() => handleLeaderClick(card)}
                    onShowDetails={handleShowDetails}
                  />
                </motion.div>
              ))}
            </motion.div>
          </section>

          {/* CARDS GRID */}
          <section className="pt-12 md:pt-16" aria-labelledby="cards-heading">
            <SectionHeading
              id="cards-heading"
              title={t("sections.cards_title")}
              subtitle={
                hasSelectedCards
                  ? t("sections.cards_selected", {
                      selected: selectedCards.length,
                    })
                  : t("sections.cards_hint")
              }
            />
            {!isDesktop && (
              <CardFilters
                search={search}
                setSearch={setSearch}
                isFiltersOpen={isFiltersOpen}
                setIsFiltersOpen={setIsFiltersOpen}
                {...filterProps}
              />
            )}
            <CardsList
              cards={visibleCards}
              deckCode={deckCode}
              isCardSelected={isCardSelected}
              handleCardClick={handleCardClick}
              handleShowDetails={handleShowDetails}
            />
          </section>
        </div>
      </div>

      <BottomNavBar actions={bottomBarActions} />

      {isAuthenticated && (
        <SaveDeckModal
          open={isSaveDeckOpen}
          onClose={() => setIsSaveDeckOpen(false)}
          deckId={deckId}
          cardCodes={deckCardCodes}
          userDeck={currentUserDeck}
          onSaved={setCurrentUserDeck}
        />
      )}

      {!isDesktop && (
        <DeckStatusDrawer
          statuses={statuses}
          expanded={isStatusPanelExpandedMobile}
          onClose={() => setIsStatusPanelExpandedMobile(false)}
        />
      )}

      <ScrollToTopButton visible={visibleCards.length > 0 && !isFiltersOpen} />

      <CardDetailsSheet
        open={detailsCard !== null}
        onClose={handleCloseDetails}
      >
        {detailsCard && (
          <CardDetailsContent
            name={detailsCard.name}
            power={
              detailsCard.type.code !== "SPECIAL" ? detailsCard.power : null
            }
            image={detailsCard.image_url}
            type={detailsCard.type.code}
            ability={
              detailsCard.abilities.length ? detailsCard.abilities[0] : null
            }
            range={detailsCard.range}
            code={detailsCard.code}
          />
        )}
      </CardDetailsSheet>
    </>
  );
}
