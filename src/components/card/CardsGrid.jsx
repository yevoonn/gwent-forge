import { useMemo, useState } from "react";
import { motion } from "motion/react";
import GwentCard from "./GwentCard";
import CardFilters from "../filter/CardFilters";
import ScrollToTopButton from "../ui/ScrollToTopButton";
import DeckPowerCounter from "../ui/DeckPowerCounter";

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

const maxPower = 130;

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

  const totalPower = useMemo(() => {
    return selectedCards.reduce((sum, card) => {
      return sum + (card.power ?? 0);
    }, 0);
  }, [selectedCards]);

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

  const isCardSelected = (card) =>
    selectedCards.some((selected) => selected.code === card.code);

  const isLeaderSelected = (leader) => selectedLeader?.code === leader.code;

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
        <motion.div
          key={deckCode}
          className="flex flex-wrap justify-center gap-8 pt-8"
          initial="hidden"
          animate="show"
          exit={{
            opacity: 0,
          }}
        >
          {cards.map((card) => (
            <motion.div key={card.code} variants={cardVariants}>
              <GwentCard
                name={card.name}
                power={card.type.code !== "SPECIAL" ? card.power : null}
                deckCode={deckCode}
                image={card.image_url}
                type={card.type.code}
                ability={card.abilities.length ? card.abilities[0] : null}
                range={card.range}
                isSelected={isCardSelected(card)}
                onClick={() => handleCardClick(card)}
              />
            </motion.div>
          ))}
        </motion.div>

        <DeckPowerCounter
          visible={!isFiltersOpen}
          totalPower={totalPower}
          selectedCount={selectedCards.length}
          maxPower={maxPower}
        />

        <ScrollToTopButton visible={cards.length > 0 && !isFiltersOpen} />
      </section>
    </>
  );
}
