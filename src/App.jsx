import { useEffect, useState } from "react";
import ParticlesBackground from "./components/ParticlesBackground";
import { AnimatePresence, motion } from "motion/react";
import { fetchCards } from "./api/cards";
import GwentCard from "./components/GwentCard";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import LoadingSpinner from "./components/LoadingSpinner";

const factions = [
  { name: "Northern Realms", color: "text-sky-400" },
  { name: "Nilfgaard", color: "text-yellow-300" },
  { name: "Monsters", color: "text-red-600" },
  { name: "Scoia'tael", color: "text-emerald-400" },
  { name: "Skellige", color: "text-indigo-400" },
];

const featuredCards = [
  {
    name: "Foltest",
    deckCode: "northern_realms",
    power: null,
    faction: "Northern Realms",
    rarity: null,
    image: "/cards/foltest.webp",
  },
  {
    name: "Emhyr var Emreis",
    deckCode: "nilfgaard",
    power: null,
    faction: "Nilfgaard",
    rarity: null,
    image: "/cards/emhyr.webp",
  },
  {
    name: "Eredin",
    deckCode: "monsters",
    power: null,
    faction: "Monsters",
    rarity: null,
    image: "/cards/eredin.webp",
  },
  {
    name: "Francesca Findabair",
    deckCode: "scoiatael",
    power: null,
    faction: "Scoia'tael",
    rarity: null,
    image: "/cards/francesca.webp",
  },
  {
    name: "Crach an Craite",
    deckCode: "skellige",
    power: null,
    faction: "Skellige",
    rarity: null,
    image: "/cards/crach.webp",
  },
];

function App() {
  const [index, setIndex] = useState(0);
  const [cards, setCards] = useState([]);
  const [loading, setLoading] = useState(false);

  async function handleFactionClick(deckCode) {
    setLoading(true);
    try {
      const data = await fetchCards({
        deck: deckCode,
        lang: "en",
        sort: "name_asc",
      });

      setCards(data);

      console.log(data);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    const interval = setInterval(() => {
      setIndex((current) => (current + 1) % factions.length);
    }, 3000);

    return () => clearInterval(interval);
  }, []);

  const currentFaction = factions[index];

  return (
    <>
      <ParticlesBackground />

      {loading && <LoadingSpinner />}

      <div className="min-h-screen flex flex-col">
        <Navbar />

        <main className="flex-1">
          {/* HERO */}
          <section className="min-h-[20dvh] flex flex-col items-center justify-center text-center px-4">
            <h1 className="font-cinzel text-7xl font-bold text-white leading-none tracking-tight">
              Gwent <span className="text-amber-400">Forge</span>
            </h1>

            <p className="font-cinzel font-semibold mt-6 max-w-2xl text-xl text-slate-300">
              Craft the perfect deck for every faction
            </p>

            <div className="mt-6 h-20 flex items-center justify-center min-w-[320px]">
              <AnimatePresence mode="wait">
                <motion.div
                  key={currentFaction.name}
                  initial={{
                    opacity: 0,
                    y: 20,
                    scale: 0.95,
                    filter: "blur(8px)",
                  }}
                  animate={{
                    opacity: 1,
                    y: 0,
                    scale: 1,
                    filter: "blur(0px)",
                  }}
                  exit={{
                    opacity: 0,
                    y: -20,
                    scale: 1.05,
                    filter: "blur(8px)",
                  }}
                  transition={{
                    duration: 0.6,
                    ease: "easeInOut",
                  }}
                  className={`
            text-4xl md:text-6xl font-bold tracking-wide
            ${currentFaction.color}
          `}
                  style={{
                    textShadow: "0 0 20px currentColor",
                  }}
                >
                  {currentFaction.name}
                </motion.div>
              </AnimatePresence>
            </div>
          </section>

          {/* FEATURED CARDS */}
          <section className="mx-auto max-w-screen-2xl px-6 pt-8">
            <div className="flex flex-wrap justify-center gap-8">
              {featuredCards.map((card) => (
                <button
                  key={card.name}
                  onClick={() => handleFactionClick(card.deckCode)}
                >
                  <GwentCard {...card} />
                </button>
              ))}
            </div>
          </section>

          {/* CARDS GRID */}
          {cards.length > 0 && (
            <section className="mx-auto max-w-screen-2xl px-6 pt-8">
              <div className="flex flex-wrap justify-center gap-8">
                {cards.map((card) => (
                  <GwentCard
                    key={card.code}
                    name={card.name}
                    power={card.power > 0 ? card.power : null}
                    image="/cards/geralt.webp"
                  />
                ))}
              </div>
            </section>
          )}
        </main>

        <Footer />
      </div>
    </>
  );
}

export default App;
