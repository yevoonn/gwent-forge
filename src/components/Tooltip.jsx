import { AnimatePresence, motion } from "motion/react";

export default function Tooltip({
  visible,
  title,
  description,
  width = "w-40",
  descriptionSize = "text-xs",
  className = "",
}) {
  return (
    <AnimatePresence>
      {visible && (
        <motion.div
          initial={{
            opacity: 0,
            x: -10,
            scale: 0.95,
          }}
          animate={{
            opacity: 1,
            x: 0,
            scale: 1,
          }}
          exit={{
            opacity: 0,
            x: -10,
            scale: 0.95,
          }}
          transition={{
            duration: 0.18,
            ease: "easeOut",
          }}
          className={`
            hidden
            md:block
            pointer-events-none
            absolute
            ${width}
            rounded-xl
            border
            border-slate-700
            bg-slate-900/90
            backdrop-blur-sm
            p-3
            shadow-xl
            shadow-black/40
            text-center
            z-50
            ${className}
          `}
        >
          <h4 className="font-cinzel font-bold text-amber-300">{title}</h4>

          {description && (
            <p
              className={`mt-1 leading-relaxed text-slate-300 ${descriptionSize}`}
            >
              {description}
            </p>
          )}
        </motion.div>
      )}
    </AnimatePresence>
  );
}
