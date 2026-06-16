import { motion } from "motion/react";

const rarityStyles = {
  Common: "bg-slate-600",
  Rare: "bg-sky-500",
  Epic: "bg-violet-500",
  Legendary: "bg-amber-500 text-black",
};

const factionStyles = {
  northern_realms: "border-sky-400",
  nilfgaard: "border-yellow-300",
  monsters: "border-red-500",
  scoiatael: "border-emerald-400",
  skellige: "border-indigo-400",
};

export default function GwentCard({
  name,
  power,
  deckCode,
  faction,
  rarity,
  image,
  isButton = false,
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
      className={`
        group
        relative
        w-64
        overflow-hidden
        rounded-2xl
        border-2
        bg-slate-900/80
        backdrop-blur-sm
        shadow-xl
        ${factionStyles[deckCode]}
        ${isButton ? "cursor-pointer" : ""}
      `}
      style={{
        transformStyle: "preserve-3d",
      }}
    >
      {/* Power */}
      {power && (
        <div className="absolute left-3 top-3 z-20 flex h-12 w-12 items-center justify-center rounded-full bg-amber-400 text-lg font-bold text-black shadow-lg">
          {power}
        </div>
      )}

      {/* Rarity */}
      {rarity && (
        <div
          className={`
          absolute
          right-3
          top-3
          z-20
          rounded-full
          px-3
          py-1
          text-xs
          font-semibold
          ${rarityStyles[rarity]}
        `}
        >
          {rarity}
        </div>
      )}

      {/* Image */}
      <div className="relative h-80 overflow-hidden">
        <img
          src={image}
          alt={name}
          className="
            h-full
            w-full
            object-cover
            transition-transform
            duration-500
          "
        />

        <div className="absolute inset-0 bg-gradient-to-t from-slate-900 via-slate-900/20 to-transparent" />
      </div>

      {/* Content */}
      <div className="p-4">
        <h1 className="font-cinzel text-lg font-bold text-white">{name}</h1>

        <p className="mt-2 text-sm text-slate-400">{faction}</p>
      </div>

      {/* Glow */}
      <div
        className="
          pointer-events-none
          absolute
          inset-0
          opacity-0
          transition-opacity
          duration-300
          group-hover:opacity-100
        "
      >
        <div className="absolute inset-0 rounded-2xl shadow-[0_0_40px_rgba(251,191,36,0.15)]" />
      </div>
    </motion.div>
  );
}
