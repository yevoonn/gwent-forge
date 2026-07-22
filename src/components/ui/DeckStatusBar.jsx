import { AnimatePresence, motion } from "motion/react";
import { Swords } from "lucide-react";

export default function DeckStatusBar({
  visible,
  icon: Icon = Swords,
  value,
  maxValue,
}) {
  return (
    <AnimatePresence>
      {visible && (
        <motion.div
          initial={{
            opacity: 0,
            scale: 0.5,
            y: 120,
            filter: "blur(8px)",
          }}
          animate={{
            opacity: 1,
            scale: 1,
            y: 0,
            filter: "blur(0px)",
          }}
          exit={{
            opacity: 0,
            scale: 0.5,
            y: 120,
            filter: "blur(8px)",
          }}
          transition={{
            duration: 0.5,
            ease: [0.22, 1, 0.36, 1],
          }}
          className="fixed bottom-6 left-6 z-50"
        >
          <motion.div
            whileHover={{
              scale: 1.04,
              y: -2,
            }}
            className={`
              flex
              h-12
              items-center
              gap-3
              rounded-xl
              border
              border-slate-700
              bg-slate-900/70
              px-4
              text-white
              backdrop-blur-sm
              shadow-lg
              shadow-amber-500/10
              hover:border-amber-400
              hover:bg-slate-800
              hover:shadow-amber-500/20
            `}
          >
            {/* ICON */}
            <div className="flex items-center justify-center text-amber-400">
              {" "}
              <Icon size={20} />
            </div>
            {/* VALUE */}
            <div className="flex items-baseline gap-2">
              <motion.span
                key={value}
                initial={{
                  scale: 0.88,
                  y: 2,
                  opacity: 0.7,
                  filter: "drop-shadow(0 0 0px rgba(251,191,36,0))",
                }}
                animate={{
                  scale: [0.88, 1.18, 1],
                  y: [2, -2, 0],
                  opacity: 1,
                  filter: [
                    "drop-shadow(0 0 0px rgba(251,191,36,0))",
                    "drop-shadow(0 0 10px rgba(251,191,36,0.9))",
                    "drop-shadow(0 0 3px rgba(251,191,36,0.35))",
                  ],
                }}
                transition={{
                  duration: 0.38,
                  times: [0, 0.45, 1],
                  ease: [0.22, 1, 0.36, 1],
                }}
                className="font-cinzel text-xl font-bold text-amber-400"
              >
                {value}
              </motion.span>

              <span className="text-xs text-slate-400">/{maxValue}</span>
            </div>
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
