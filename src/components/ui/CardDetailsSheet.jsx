import { AnimatePresence, motion } from "motion/react";
import { X } from "lucide-react";

export default function CardDetailsSheet({ open, onClose, children }) {
  return (
    <AnimatePresence mode="wait">
      {open && (
        <>
          {/* Backdrop */}
          <motion.div
            className="fixed inset-0 z-[90] bg-black/60"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
            transition={{
              duration: 0.16,
            }}
          />

          {/* Bottom sheet */}
          <motion.div
            className={`
              fixed
              bottom-0
              left-0
              right-0
              z-[91]
              max-h-[75dvh]
              flex
              flex-col
              rounded-t-3xl
              border-t
              border-slate-700
              bg-slate-950/95
            `}
            style={{
              willChange: "transform",
              transform: "translateZ(0)",
              contain: "layout paint style",
              contentVisibility: "auto",
            }}
            initial={{ y: "100%" }}
            animate={{ y: 0 }}
            exit={{ y: "100%" }}
            transition={{
              duration: 0.24,
              ease: [0.22, 1, 0.36, 1],
            }}
          >
            <div className="relative mb-5 flex h-10 items-center justify-center">
              {/* Handle */}
              <div className="h-1.5 w-14 rounded-full bg-slate-600" />

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
              className="overflow-y-auto px-6 pb-8"
              initial={{
                opacity: 0,
                y: 8,
              }}
              animate={{
                opacity: 1,
                y: 0,
              }}
              transition={{
                duration: 0.16,
                delay: 0.14,
                ease: "easeOut",
              }}
            >
              {children}
            </motion.div>
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
