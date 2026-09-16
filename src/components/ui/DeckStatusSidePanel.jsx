import { motion } from "motion/react";
import { ChevronLeft, ChevronRight } from "lucide-react";
import DeckStatusBar from "./DeckStatusBar";

const PANEL_WIDTH = 256; // px

export default function DeckStatusSidePanel({
  statuses,
  expanded,
  onToggle,
  hasWarnings,
}) {
  return (
    <div className="sticky top-4 z-40 flex shrink-0 items-center">
      {/* PANEL */}
      <motion.div
        initial={false}
        animate={{ width: expanded ? PANEL_WIDTH : 0 }}
        transition={{
          duration: 0.28,
          ease: [0.22, 1, 0.36, 1],
        }}
        className="overflow-hidden"
      >
        <div
          style={{ width: PANEL_WIDTH }}
          className="
            flex
            max-h-[calc(100dvh-2rem)]
            flex-col
            gap-3
            overflow-y-auto
            no-scrollbar
            rounded-2xl
            border
            border-slate-700
            bg-slate-950/90
            p-4
            shadow-2xl
            shadow-black/40
          "
        >
          {statuses.map((status) => (
            <DeckStatusBar key={status.id} {...status} fullWidth />
          ))}
        </div>
      </motion.div>

      {/* HANDLE */}
      <motion.button
        type="button"
        onClick={onToggle}
        aria-label="Toggle deck status panel"
        aria-expanded={expanded}
        whileHover={{ scale: 1.06 }}
        whileTap={{ scale: 0.94 }}
        className={`
          relative
          ml-2
          flex
          h-14
          w-7
          shrink-0
          cursor-pointer
          items-center
          justify-center
          rounded-xl
          border
          shadow-lg
          transition-colors
          ${
            hasWarnings
              ? "border-red-500/60 bg-red-950/60 text-red-400 shadow-red-500/15 hover:border-red-400"
              : "border-slate-700 bg-slate-900/80 text-amber-400 shadow-amber-500/10 hover:border-amber-400 hover:text-amber-300"
          }
        `}
      >
        {expanded ? <ChevronLeft size={18} /> : <ChevronRight size={18} />}

        {hasWarnings && !expanded && (
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
            className="absolute -top-1 -right-1 h-3 w-3 rounded-full bg-red-500"
          />
        )}
      </motion.button>
    </div>
  );
}
