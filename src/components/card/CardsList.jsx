import { motion } from "motion/react";
import GwentCard from "./GwentCard";

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

export default function CardsList({
  cards,
  deckCode,
  isCardSelected,
  handleCardClick,
  handleShowDetails,
}) {
  return (
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
            onShowDetails={handleShowDetails}
          />
        </motion.div>
      ))}
    </motion.div>
  );
}
