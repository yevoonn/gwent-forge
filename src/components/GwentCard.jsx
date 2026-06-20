import { motion } from "motion/react";

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
      {power && (
        <div className="absolute left-0.5 top-0.5 sm:left-1 sm:top-1 z-20 h-20 w-20 scale-55 sm:scale-65 md:scale-75 lg:scale-100 origin-top-left flex items-center justify-center">
          {type === "Hero" ? (
            <>
              <svg className="h-20 w-20" viewBox="0 0 100 100">
                {[...Array(22)].map((_, i) => {
                  const angle = (i * 360 * Math.PI) / (180 * 22);
                  const spikeLength = 52;
                  const spikeWidth = 20;
                  const x1 = 50;
                  const y1 = 50;
                  const x2 = 50 + spikeLength * Math.cos(angle);
                  const y2 = 50 + spikeLength * Math.sin(angle);
                  const x3 = 50 + spikeWidth * Math.cos(angle + Math.PI / 2);
                  const y3 = 50 + spikeWidth * Math.sin(angle + Math.PI / 2);
                  const x4 = 50 + spikeWidth * Math.cos(angle - Math.PI / 2);
                  const y4 = 50 + spikeWidth * Math.sin(angle - Math.PI / 2);

                  return (
                    <polygon
                      key={i}
                      points={`${x1},${y1} ${x2},${y2} ${x3},${y3} ${x4},${y4}`}
                      fill="#fe9a00"
                    />
                  );
                })}
                <circle
                  cx="50"
                  cy="50"
                  r="35"
                  fill="#272525"
                  stroke="#fe9a00"
                  strokeWidth="5"
                />
              </svg>

              <div className="absolute inset-0 flex items-center justify-center">
                <h1 className="font-cinzel text-3xl lg:text-4xl font-bold text-gray-100">
                  {power}
                </h1>
              </div>
            </>
          ) : (
            <div className="h-14 w-14 rounded-full bg-gray-100 border-4 border-amber-500 shadow-lg flex items-center justify-center">
              <h1 className="font-cinzel text-3xl lg:text-4xl font-bold text-gray-800">
                {power}
              </h1>
            </div>
          )}
        </div>
      )}

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
        <h1 className="font-cinzel text-xs sm:text-sm md:text-base lg:text-lg font-bold text-white line-clamp-2">
          {name}
        </h1>

        <p className="hidden md:block mt-auto text-sm text-slate-400">
          {faction}
        </p>
      </div>
    </motion.div>
  );
}
