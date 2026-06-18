import { AnimatePresence, motion } from "motion/react";

export default function HeroSection({ currentFaction }) {
  return (
    <section className="min-h-[8rem] md:min-h-[20dvh] flex flex-col items-center justify-center text-center px-4">
      <h1 className="font-cinzel text-4xl sm:text-5xl md:text-7xl font-bold text-white leading-none tracking-tight">
        Gwent <span className="text-amber-400">Forge</span>
      </h1>
      <p className="hidden md:block font-cinzel font-semibold mt-4 max-w-2xl text-xl text-slate-300">
        Craft the perfect deck for every faction
      </p>
      <div className="mt-2 md:mt-6 h-16 md:h-20 flex items-center justify-center w-full">
        {" "}
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
            text-2xl sm:text-3xl md:text-6xl font-bold tracking-wide
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
  );
}
