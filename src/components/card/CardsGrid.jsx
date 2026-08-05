import { useState } from "react";
import { motion } from "motion/react";
import { deckStatusConfig } from "../../data/deckStatusConfig";
import useDeckStats from "../../hooks/useDeckStats";
import GwentCard from "./GwentCard";
import CardFilters from "../filter/CardFilters";
import ScrollToTopButton from "../ui/ScrollToTopButton";
import DeckStatusPanel from "../ui/DeckStatusPanel";
import CardDetailsSheet from "../ui/CardDetailsSheet";
import CardDetailsContent from "./CardDetailsContent";
import CardsList from "./CardsList";

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
  const [isFiltersOpen, setIsFiltersOpen] = useState(false);
  const [selectedCards, setSelectedCards] = useState([]);
  const [selectedLeader, setSelectedLeader] = useState(null);
  const [detailsCard, setDetailsCard] = useState(null);

  const deckStats = useDeckStats(selectedCards, selectedLeader);

  const statuses = deckStatusConfig.map((status) => ({
    ...status,
    value: deckStats[status.source],
  }));

  const handleLeaderClick = (leader) => {
    if (selectedLeader?.code === leader.code) {
      setSelectedLeader(null);
      return;
    }

    setSelectedLeader(leader);
  };

  const handleCardClick = (card) => {
    setSelectedCards((current) => {
      const alreadySelected = current.some(
        (selected) => selected.code === card.code,
      );

      if (alreadySelected) {
        return current.filter((selected) => selected.code !== card.code);
      }

      return [...current, card];
    });
  };

  const handleShowDetails = (card) => {
    setDetailsCard(card);
  };

  const handleCloseDetails = () => {
    setDetailsCard(null);
  };

  const isCardSelected = (card) =>
    selectedCards.some((selected) => selected.code === card.code);

  const isLeaderSelected = (leader) => selectedLeader?.code === leader.code;

  const showStatusBars = !isFiltersOpen;

  return (
    <>
      {/* LEADERS */}
      <section className="mx-auto max-w-screen-2xl px-6 pt-0 md:pt-8">
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
      <section className="mx-auto max-w-screen-2xl px-6 pt-8">
        <CardFilters
          filters={filters}
          search={search}
          setSearch={setSearch}
          sortField={sortField}
          setSortField={setSortField}
          sortDirection={sortDirection}
          cardType={cardType}
          setCardType={setCardType}
          cardRange={cardRange}
          setCardRange={setCardRange}
          setSortDirection={setSortDirection}
          isFiltersOpen={isFiltersOpen}
          setIsFiltersOpen={setIsFiltersOpen}
        />
        <CardsList
          cards={cards}
          deckCode={deckCode}
          isCardSelected={isCardSelected}
          handleCardClick={handleCardClick}
          handleShowDetails={handleShowDetails}
        />

        {showStatusBars && <DeckStatusPanel statuses={statuses} />}

        <ScrollToTopButton visible={cards.length > 0 && !isFiltersOpen} />
      </section>

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
          />
        )}
      </CardDetailsSheet>
    </>
  );
}
