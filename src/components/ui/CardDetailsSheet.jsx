import { AnimatePresence, motion } from "motion/react";
import { X } from "lucide-react";

const sheetTransition = {
  type: "spring",
  damping: 30,
  stiffness: 320,
  mass: 0.9,
};

export default function CardDetailsSheet({ open, onClose, children }) {
  return (
    <AnimatePresence>
      {open && (
        <>
          {/* Backdrop */}
          <motion.div
            className="fixed inset-0 z-[90] bg-black/70 backdrop-blur-sm"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
            transition={{ duration: 0.18 }}
          />

          {/* Bottom sheet */}
          <motion.div
            className={`
              fixed
              bottom-0
              left-0
              right-0
              z-[91]
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
            `}
            style={{ willChange: "transform", contain: "layout paint style" }}
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
                className={`
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
                `}
                aria-label="Close details"
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
              {children}
            </motion.div>
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
