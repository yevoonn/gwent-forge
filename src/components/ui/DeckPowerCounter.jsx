import { AnimatePresence, motion } from "motion/react";
import { Swords } from "lucide-react";

export default function DeckPowerCounter({
  visible,
  totalPower,
  selectedCount,
  maxPower,
}) {
  return (
    <AnimatePresence>
      {visible && selectedCount > 0 && (
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
            {/* ICON */}{" "}
            <div className="flex items-center justify-center text-amber-400">
              {" "}
              <Swords size={20} />{" "}
            </div>
            {/* VALUE */}
            <div className="flex items-baseline gap-2">
              <motion.span
                key={totalPower}
                initial={{ scale: 0.8, opacity: 0.5 }}
                animate={{ scale: 1, opacity: 1 }}
                transition={{ duration: 0.2 }}
                className="font-cinzel text-xl font-bold text-amber-400"
              >
                {totalPower}
              </motion.span>

              <span className="text-xs text-slate-400">/{maxPower}</span>
            </div>
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
