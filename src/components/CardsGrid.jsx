import { useState } from "react";
import { motion } from "motion/react";
import GwentCard from "./GwentCard";
import CardFilters from "./CardFilters";
import ScrollToTopButton from "./ScrollToTopButton";

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
              />
            </motion.div>
          ))}
        </motion.div>
      </section>

      {/* CARDS GRID */}
      <section className="mx-auto max-w-screen-2xl px-6 pt-8">
        <CardFilters
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
                power={card.type !== "Special" ? card.power : null}
                deckCode={deckCode}
                image={card.image_url}
                type={card.type}
                ability={card.abilities.length ? card.abilities[0] : null}
                range={card.range}
              />
            </motion.div>
          ))}
        </motion.div>

        <ScrollToTopButton visible={cards.length > 0 && !isFiltersOpen} />
      </section>
    </>
  );
}
