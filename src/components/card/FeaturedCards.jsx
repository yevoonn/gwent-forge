import { motion } from "motion/react";
import { useTranslation } from "react-i18next";

import GwentCard from "./GwentCard";

import { featuredCards } from "../../data/factions";

const featuredContainerVariants = {
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

export default function FeaturedCards({ onFactionClick, currentFactionCode }) {
  const { t } = useTranslation();

  return (
    <>
      <section className="mx-auto max-w-screen-2xl px-6 pt-0 md:pt-8">
        <motion.div
          key="featured-cards"
          className="flex flex-wrap justify-center gap-8"
          variants={featuredContainerVariants}
          initial="hidden"
          animate="show"
        >
          {featuredCards.map((card) => (
            <motion.div key={card.name} variants={cardVariants}>
              <button onClick={() => onFactionClick(card.deckCode)}>
                <GwentCard
                  {...card}
                  currentFactionCode={currentFactionCode}
                  faction={t(`factions.${card.deckCode}`)}
                />
              </button>
            </motion.div>
          ))}
        </motion.div>
      </section>

      <section className="mx-auto max-w-screen-2xl px-6 pt-8">
        <motion.p
          key="empty-state"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="text-center text-slate-300 text-lg font-cinzel"
        >
          {t("featured.description")}
        </motion.p>
      </section>
    </>
  );
}
