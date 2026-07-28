import { useRef, useState } from "react";
import { motion } from "motion/react";
import { Check } from "lucide-react";
import PowerBadge from "../badge/PowerBadge";
import AbilityBadge from "../badge/AbilityBadge";
import RangeBadge from "../badge/RangeBadge";
import PortalTooltip from "../ui/PortalTooltip";

const factionStyles = {
  northern_realms: "border-sky-400 cursor-pointer",
  nilfgaard: "border-yellow-300 cursor-pointer",
  monsters: "border-red-500 cursor-pointer",
  scoiatael: "border-emerald-400 cursor-pointer",
  skellige: "border-indigo-400 cursor-pointer",
};

const factionGlow = {
  northern_realms: "#38bdf8",
  nilfgaard: "#fde047",
  monsters: "#ef4444",
  scoiatael: "#4ade80",
  skellige: "#818cf8",
};

export default function GwentCard({
  name,
  power,
  deckCode,
  faction,
  image,
  type,
  ability,
  range,
  currentFactionCode,
  showTooltip = false,
  isSelected = false,
  onClick,
}) {
  const [hovered, setHovered] = useState(false);

  const cardRef = useRef(null);

  const isActive = currentFactionCode === deckCode;

  return (
    <div
      ref={cardRef}
      className="relative overflow-visible"
      onMouseEnter={() => setHovered(true)}
      onMouseLeave={() => setHovered(false)}
    >
      <motion.div
        whileHover={{
          y: -10,
          scale: 1.1,
        }}
        animate={
          isActive
            ? {
                scale: 1.08,
              }
            : {
                scale: 1,
              }
        }
        transition={{
          type: "spring",
          stiffness: 300,
          damping: isActive ? 75 : 20,
          delay: isActive ? 0.75 : 0,
        }}
        className={`
          group
          relative
          w-32
          sm:w-40
          md:w-48
          lg:w-56
          xl:w-64
          overflow-hidden
          rounded-2xl
          border-2
          bg-slate-900/95
          backdrop-blur-sm
          shadow-xl
          ${factionStyles[deckCode]}
          ${isActive ? "animate-faction-glow" : ""}
          ${onClick ? "cursor-pointer" : ""}
        `}
        style={{
          transformStyle: "preserve-3d",
          ...(isActive && {
            "--glow": factionGlow[deckCode],
          }),
        }}
        onClick={onClick}
        role={onClick ? "button" : undefined}
        tabIndex={onClick ? 0 : undefined}
        onKeyDown={
          onClick
            ? (event) => {
                if (event.key === "Enter" || event.key === " ") {
                  onClick();
                }
              }
            : undefined
        }
      >
        {isSelected && (
          <>
            <div
              className="pointer-events-none absolute inset-0 rounded-2xl"
              style={{
                zIndex: 15,
                background: `linear-gradient(180deg, ${factionGlow[deckCode] ?? "#ef4444"}EE, ${factionGlow[deckCode] ?? "#ef4444"}CC 20%, ${factionGlow[deckCode] ?? "#ef4444"}99 45%, transparent 80%)`,
                boxShadow: `inset 0 0 40px 10px ${factionGlow[deckCode] ?? "#ef4444"}55, 0 0 50px 24px ${factionGlow[deckCode] ?? "#ef4444"}25`,
                mixBlendMode: "screen",
                opacity: 1,
              }}
            />
            <div
              className={`
                pointer-events-none
                absolute
                right-2
                top-2
                z-20
                h-8
                w-8
                sm:right-3
                sm:top-3
                sm:h-10
                sm:w-10
                md:h-11
                md:w-11
              `}
            >
              <div className="absolute inset-0 rounded-full bg-slate-950/90 ring-1 ring-white/15 shadow-[0_18px_40px_rgba(0,0,0,0.25)]" />
              <div className="absolute inset-[2px] rounded-full bg-slate-900/90 border border-white/10 flex items-center justify-center shadow-[inset_0_0_0_1px_rgba(255,255,255,0.08)]">
                <Check
                  className="h-4 w-4 sm:h-5 sm:w-5 md:h-6 md:w-6"
                  strokeWidth={3}
                  style={{ color: factionGlow[deckCode] ?? "#ef4444" }}
                />
              </div>
            </div>
          </>
        )}
        {/* Power */}
        {(power !== null || type === "SPECIAL") && (
          <PowerBadge power={power} type={type} ability={ability} />
        )}

        {/* Range */}
        {range && <RangeBadge type={type} range={range} />}

        {/* Ability */}
        {ability && <AbilityBadge type={type} ability={ability} />}

        {/* Image */}
        <div
          className={`
            relative
            h-40
            sm:h-52
            md:h-64
            lg:h-72
            xl:h-80
            overflow-hidden
            bg-slate-900/90
          `}
        >
          <img
            src={image}
            alt={name}
            className={`
              h-full
              w-full
              object-cover
              transition-transform
              duration-500
              will-change-transform
              ${isSelected ? "brightness-95 contrast-[1.05]" : ""}
            `}
          />

          <div
            className={`
              absolute
              inset-0
              bg-gradient-to-t
              from-slate-900
              via-slate-900/20
              to-transparent
            `}
          />
        </div>

        {/* Content */}
        <div
          className={`
            relative
            z-10
            -mt-px
            p-2
            sm:p-3
            md:p-4
            h-16
            sm:h-20
            md:h-24
            lg:h-28
            xl:h-32
            flex
            flex-col
            text-center
            bg-slate-900/95
          `}
        >
          <div
            className={`
              flex-1
              flex
              items-center
              justify-center
            `}
          >
            <h1
              className={`
                font-cinzel
                text-xs
                sm:text-sm
                md:text-base
                lg:text-lg
                font-bold
                text-white
                line-clamp-2
                leading-tight
              `}
            >
              {name}
            </h1>
          </div>

          <p className="hidden md:block text-sm text-slate-400">{faction}</p>
        </div>
      </motion.div>
      {showTooltip && (
        <PortalTooltip
          targetRef={cardRef}
          visible={hovered}
          title={ability?.name ?? null}
          description={ability?.description ?? null}
          width="w-56"
          descriptionSize="text-sm"
          placement="center"
        />
      )}
    </div>
  );
}
