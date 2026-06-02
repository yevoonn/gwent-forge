import { useEffect, useState } from "react";
import ParticlesBackground from "./components/ParticlesBackground";
import { AnimatePresence, motion } from "motion/react";
import GwentCard from "./components/GwentCard";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";

const factions = [
  { name: "Northern Realms", color: "text-sky-400" },
  { name: "Nilfgaardian Empire", color: "text-yellow-300" },
  { name: "Monsters", color: "text-red-600" },
  { name: "Scoia'tael", color: "text-emerald-400" },
  { name: "Skellige", color: "text-indigo-400" },
];

const featuredCards = [
  {
    name: "Foltest",
    power: null,
    faction: "Northern Realms",
    rarity: null,
    image: "/cards/foltest.jpg",
  },
  {
    name: "Emhyr var Emreis",
    power: null,
    faction: "Nilfgaardian Empire",
    rarity: null,
    image: "/cards/emhyr.jpg",
  },
  {
    name: "Eredin",
    power: null,
    faction: "Monsters",
    rarity: null,
    image: "/cards/eredin.jpg",
  },
  {
    name: "Francesca Findabair",
    power: null,
    faction: "Scoia'tael",
    rarity: null,
    image: "/cards/francesca.jpg",
  },
  {
    name: "Crach an Craite",
    power: null,
    faction: "Skellige",
    rarity: null,
    image: "/cards/crach.jpg",
  },
];

function App() {
  const [index, setIndex] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      setIndex((current) => (current + 1) % factions.length);
    }, 4000);

    return () => clearInterval(interval);
  }, []);

  const currentFaction = factions[index];

  return (
    <>
      <ParticlesBackground />

      <div className="min-h-screen flex flex-col">
        <Navbar />

        <main className="flex-1">
          {/* HERO */}
          <section className="min-h-[20dvh] flex flex-col items-center justify-center text-center px-4">
            <h1 className="font-cinzel text-7xl font-bold text-white leading-none tracking-tight">
              Gwent <span className="text-amber-400">Forge</span>
            </h1>

            <p className="mt-6 max-w-2xl text-xl text-slate-300">
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
                <GwentCard key={card.name} {...card} />
              ))}
            </div>
          </section>
        </main>

        <Footer />
      </div>
    </>
  );
}

export default App;
