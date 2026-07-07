import { useState } from "react";
import { AnimatePresence, motion } from "motion/react";

export default function RangeBadge({ type, range }) {
  const [hovered, setHovered] = useState(false);

  let imageURL = `/icons/${range?.code?.toLowerCase()}_icon_transparent.webp`;

  if ((type !== "Unit" && type !== "Hero") || !range) {
    return null;
  }

  return (
    <div
      className={`
        absolute
        left-0.5
        top-12
        sm:left-1
        sm:top-24
        z-30
        h-22
        w-22
        scale-55
        sm:scale-65
        md:scale-75
        lg:scale-100
        origin-top-left
        flex
        items-center
        justify-center
      `}
    >
      <div
        className="relative"
        onMouseEnter={() => setHovered(true)}
        onMouseLeave={() => setHovered(false)}
      >
        <div
          className={`
            h-14
            w-14
            rounded-full
            border-4
            border-orange-300
            bg-amber-500
            shadow-lg
            flex
            items-center
            justify-center
            scale-90
          `}
        >
          <img src={imageURL} alt={range.name} className="scale-75" />
        </div>

        <AnimatePresence>
          {hovered && (
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
                left-full
                top-1/2
                ml-3
                -translate-y-1/2
                w-40
                rounded-xl
                border
                border-slate-700
                bg-slate-900/90
                backdrop-blur-sm
                p-3
                shadow-xl
                shadow-black/40
              `}
            >
              <h4 className="font-cinzel text-sm font-bold text-amber-300">
                {range.name}
              </h4>

              {range.description && (
                <p className="mt-1 text-xs leading-relaxed text-slate-300">
                  {range.description}
                </p>
              )}
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </div>
  );
}
