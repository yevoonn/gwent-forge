import { useState } from "react";
import { motion } from "motion/react";
import { ChevronUp, ChevronDown } from "lucide-react";
import { isWarning } from "../../utils/deckStatusHelper";
import DeckStatusBar from "./DeckStatusBar";

export default function DeckStatusPanel({ statuses = [] }) {
  const [expanded, setExpanded] = useState(
    () => window.matchMedia("(min-width: 640px)").matches,
  );

  const hasWarnings = statuses.some(isWarning);

  return (
    <div className="fixed bottom-6 left-6 z-50 flex flex-col gap-3">
      <motion.button
        onClick={() => setExpanded((prev) => !prev)}
        whileHover={{
          scale: 1.12,
          y: -3,
        }}
        whileTap={{
          scale: 0.92,
        }}
        className={`
          flex
          h-12
          w-12
          cursor-pointer
          items-center
          justify-center
          rounded-xl
          border
          backdrop-blur-sm
          shadow-lg
          hover:bg-slate-800
          ${
            hasWarnings
              ? "border-red-500/60 bg-red-950/50 text-red-400 shadow-red-500/15 hover:border-red-400 hover:shadow-red-500/20"
              : "border-slate-700 bg-slate-900/70 text-amber-400 shadow-amber-500/10 hover:border-amber-400 hover:text-amber-300 hover:shadow-amber-500/20"
          }
        `}
      >
        {expanded ? <ChevronDown size={22} /> : <ChevronUp size={22} />}

        {hasWarnings && (
          <motion.span
            animate={{
              scale: [1, 1.25, 1],
              opacity: [1, 0.65, 1],
            }}
            transition={{
              duration: 1.6,
              repeat: Infinity,
              ease: "easeInOut",
            }}
            className="absolute top-1 right-1 h-3 w-3 rounded-full bg-red-500"
          />
        )}
      </motion.button>

      <motion.div
        initial={false}
        animate={{
          opacity: expanded ? 1 : 0,
          y: expanded ? 0 : 16,
          scale: expanded ? 1 : 0.96,
        }}
        transition={{
          duration: 0.22,
          ease: [0.22, 1, 0.36, 1],
        }}
        style={{
          pointerEvents: expanded ? "auto" : "none",
          position: expanded ? "relative" : "absolute",
          visibility: expanded ? "visible" : "hidden",
          transformOrigin: "bottom left",
          willChange: "transform, opacity",
          contain: "layout paint",
        }}
      >
        <div
          className="
            flex
            flex-col
            gap-3
            max-h-[calc(100dvh-10rem)]
            overflow-y-auto
            no-scrollbar
            pr-1
          "
        >
          {statuses.map((status) => (
            <DeckStatusBar key={status.id} {...status} />
          ))}
        </div>
      </motion.div>
    </div>
  );
}
