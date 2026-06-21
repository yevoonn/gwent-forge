import { AnimatePresence, motion } from "motion/react";
import { Search } from "lucide-react";
import GwentCard from "./GwentCard";

const featuredCards = [
  {
    name: "Foltest",
    deckCode: "northern_realms",
    power: null,
    faction: "Northern Realms",
    rarity: null,
    image: "/cards/foltest.webp",
    isButton: true,
  },
  {
    name: "Emhyr var Emreis",
    deckCode: "nilfgaard",
    power: null,
    faction: "Nilfgaard",
    rarity: null,
    image: "/cards/emhyr.webp",
    isButton: true,
  },
  {
    name: "Eredin",
    deckCode: "monsters",
    power: null,
    faction: "Monsters",
    rarity: null,
    image: "/cards/eredin.webp",
    isButton: true,
  },
  {
    name: "Francesca Findabair",
    deckCode: "scoiatael",
    power: null,
    faction: "Scoia'tael",
    rarity: null,
    image: "/cards/francesca.webp",
    isButton: true,
  },
  {
    name: "Crach an Craite",
    deckCode: "skellige",
    power: null,
    faction: "Skellige",
    rarity: null,
    image: "/cards/crach.webp",
    isButton: true,
  },
];

const containerVariants = {
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

export default function CardsPage({
  selectedFactionDeckCode,
  leaders,
  cards,
  loading,
  onFactionClick,
  search,
  setSearch,
  currentFactionCode,
}) {
  const showLeaders = leaders.length > 0;

  return (
    <>
      {/* LEADERS / FEATURED CARDS */}
      <section className="mx-auto max-w-screen-2xl px-6 pt-0 md:pt-8">
        <AnimatePresence mode="wait">
          {!showLeaders ? (
            <motion.div
              key="featured-cards"
              className="flex flex-wrap justify-center gap-8"
              variants={containerVariants}
              initial="hidden"
              animate="show"
            >
              {featuredCards.map((card) => (
                <motion.div key={card.name} variants={cardVariants}>
                  <button
                    key={card.name}
                    onClick={() => onFactionClick(card.deckCode)}
                    disabled={loading}
                  >
                    <GwentCard
                      currentFactionCode={currentFactionCode}
                      {...card}
                    />
                  </button>
                </motion.div>
              ))}
            </motion.div>
          ) : (
            <motion.div
              key="leaders"
              className="flex flex-wrap justify-center gap-8"
              variants={containerVariants}
              initial="hidden"
              animate="show"
              exit={{
                opacity: 0,
                filter: "blur(10px)",
              }}
            >
              {leaders.map((card) => (
                <motion.div key={card.code} variants={cardVariants}>
                  <GwentCard
                    name={card.name}
                    power={card.power > 0 ? card.power : null}
                    deckCode={selectedFactionDeckCode}
                    image="/logo.png"
                  />
                </motion.div>
              ))}
            </motion.div>
          )}
        </AnimatePresence>
      </section>

      {/* CARDS GRID */}
      <section className="mx-auto max-w-screen-2xl px-6 pt-8">
        <AnimatePresence mode="wait">
          {selectedFactionDeckCode ? (
            <>
              <form className="relative max-w-md mx-auto sticky top-4 z-10">
                <Search
                  size={18}
                  className="absolute left-4 top-1/2 -translate-y-1/2 text-amber-400 z-10"
                />

                <input
                  name="search"
                  type="text"
                  placeholder="Search cards..."
                  value={search}
                  onChange={(e) => setSearch(e.target.value)}
                  className="w-full rounded-xl border border-slate-700 bg-slate-900/80 py-3 pl-11 pr-4 text-white placeholder:text-slate-500 backdrop-blur-sm transition-all duration-300 shadow-lg shadow-black/30 focus:border-amber-400 focus:ring-2 focus:ring-amber-400/20 focus:outline-none focus:shadow-amber-500/20"
                />
              </form>
              <motion.div
                key={selectedFactionDeckCode}
                className="flex flex-wrap justify-center gap-8 pt-8"
                variants={containerVariants}
                initial="hidden"
                animate="show"
                exit={{
                  opacity: 0,
                  filter: "blur(10px)",
                }}
              >
                {cards.map((card) => (
                  <motion.div key={card.code} variants={cardVariants}>
                    <GwentCard
                      name={card.name}
                      power={card.power > 0 ? card.power : null}
                      deckCode={selectedFactionDeckCode}
                      image="/cards/geralt.webp"
                      type={card.type}
                    />
                  </motion.div>
                ))}
              </motion.div>
            </>
          ) : (
            <motion.p
              key="empty-state"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="text-center text-slate-400 text-lg"
            >
              Select faction to view cards
            </motion.p>
          )}
        </AnimatePresence>
      </section>
    </>
  );
}
