import { motion } from "motion/react";
import PowerBadge from "./PowerBadge";
import AbilityBadge from "./AbilityBadge";

const factionStyles = {
  northern_realms: "border-sky-400 cursor-pointer",
  nilfgaard: "border-yellow-300 cursor-pointer",
  monsters: "border-red-500 cursor-pointer",
  scoiatael: "border-emerald-400 cursor-pointer",
  skellige: "border-indigo-400 cursor-pointer",
};

export default function GwentCard({
  name,
  power,
  deckCode,
  faction,
  image,
  type,
  ability,
  currentFactionCode,
}) {
  return (
    <motion.div
      whileHover={{
        y: -10,
        scale: 1.1,
      }}
      transition={{
        type: "spring",
        stiffness: 300,
        damping: 20,
      }}
      className={`group relative w-32 sm:w-40 md:w-48 lg:w-56 xl:w-64 overflow-hidden rounded-2xl border-2 bg-slate-900/80 backdrop-blur-sm shadow-xl ${factionStyles[deckCode]} ${currentFactionCode === deckCode ? "animate-pulse-delayed" : ""} `}
      style={{ transformStyle: "preserve-3d" }}
    >
      {/* Power */}
      {power && <PowerBadge power={power} type={type} />}

      {/* Ability */}
      {ability && <AbilityBadge type={type} ability={ability} />}

      {/* Image */}
      <div className="relative h-40 sm:h-52 md:h-64 lg:h-72 xl:h-80 overflow-hidden">
        <img
          src={image}
          alt={name}
          className="h-full w-full object-cover transition-transform duration-500"
        />

        <div className="absolute inset-0 bg-gradient-to-t from-slate-900 via-slate-900/20 to-transparent" />
      </div>

      {/* Content */}
      <div className="p-2 sm:p-3 md:p-4 h-16 sm:h-20 md:h-24 lg:h-28 xl:h-32 flex flex-col text-center">
        <div className="flex-1 flex items-center justify-center">
          <h1 className="font-cinzel text-xs sm:text-sm md:text-base lg:text-lg font-bold text-white line-clamp-2 leading-tight">
            {name}
          </h1>
        </div>

        <p className="hidden md:block text-sm text-slate-400">{faction}</p>
      </div>
    </motion.div>
  );
}
