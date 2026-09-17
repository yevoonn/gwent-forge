import { AnimatePresence, motion } from "motion/react";
import { useTranslation } from "react-i18next";
import { ChevronUp, X } from "lucide-react";
import DeckStatusBar from "./DeckStatusBar";

const sheetTransition = {
  type: "spring",
  damping: 30,
  stiffness: 320,
  mass: 0.9,
};

export default function DeckStatusDrawer({
  statuses,
  expanded,
  onToggle,
  onClose,
  hasWarnings,
}) {
  const { t } = useTranslation();

  return (
    <>
      {/* TRIGGER */}
      <button
        type="button"
        onClick={onToggle}
        aria-label="Toggle deck status panel"
        aria-expanded={expanded}
        className={`
          fixed
          bottom-6
          left-6
          z-30
          flex
          h-12
          w-12
          cursor-pointer
          items-center
          justify-center
          rounded-xl
          border
          shadow-lg
          transition-transform
          duration-150
          active:scale-90
          ${
            hasWarnings
              ? "border-red-500/60 bg-red-950/50 text-red-400 shadow-red-500/15"
              : "border-slate-700 bg-slate-900/70 text-amber-400 shadow-amber-500/10"
          }
        `}
      >
        <ChevronUp size={22} />

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
      </button>

      <AnimatePresence>
        {expanded && (
          <>
            {/* BACKDROP */}
            <motion.div
              className="fixed inset-0 z-40 bg-black/70"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              onClick={onClose}
              transition={{ duration: 0.18 }}
            />

            {/* DRAWER */}
            <motion.div
              className="
                fixed
                bottom-0
                left-0
                right-0
                z-50
                flex
                max-h-[75dvh]
                flex-col
                overflow-hidden
                rounded-t-3xl
                border-t
                border-slate-700/80
                bg-gradient-to-b
                from-slate-900
                to-slate-950
                shadow-[0_-12px_40px_-12px_rgba(0,0,0,0.65)]
                ring-1
                ring-white/5
              "
              style={{
                willChange: "transform",
                contain: "layout paint style",
              }}
              drag="y"
              dragConstraints={{ top: 0, bottom: 0 }}
              dragElastic={{ top: 0, bottom: 0.45 }}
              onDragEnd={(_, info) => {
                if (info.offset.y > 120 || info.velocity.y > 650) {
                  onClose();
                }
              }}
              initial={{ y: "100%" }}
              animate={{ y: 0 }}
              exit={{ y: "100%" }}
              transition={sheetTransition}
            >
              {/* Subtle top accent line */}
              <div className="pointer-events-none absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-amber-400/50 to-transparent" />

              <div className="relative flex h-11 shrink-0 items-center justify-center">
                {/* Handle */}
                <div className="h-1.5 w-12 rounded-full bg-slate-600/80" />

                {/* Close button */}
                <button
                  type="button"
                  onClick={onClose}
                  className="
                    absolute
                    right-4
                    top-1/2
                    -translate-y-1/2
                    rounded-xl
                    p-2
                    text-slate-400
                    transition-colors
                    duration-200
                    hover:bg-slate-800
                    hover:text-white
                    active:scale-95
                  "
                  aria-label="Close"
                >
                  <X size={22} />
                </button>
              </div>

              <motion.div
                className="overflow-y-auto px-6 pt-2 pb-[calc(env(safe-area-inset-bottom)+2rem)] [scrollbar-width:thin] [scrollbar-color:theme(colors.slate.700)_transparent]"
                initial={{ opacity: 0, y: 8 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.16, delay: 0.08, ease: "easeOut" }}
              >
                <h2 className="mb-4 text-center font-cinzel text-2xl font-bold text-amber-400">
                  {t("deck_status.title")}
                </h2>

                <div className="flex flex-col gap-3">
                  {statuses.map((status) => (
                    <DeckStatusBar
                      key={status.id}
                      {...status}
                      showLabel
                      fullWidth
                      lightweight
                    />
                  ))}
                </div>
              </motion.div>
            </motion.div>
          </>
        )}
      </AnimatePresence>
    </>
  );
}
