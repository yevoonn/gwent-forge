import { motion } from "motion/react";

function SkeletonCard() {
  return (
    <div
      className="
        relative
        isolate
        w-32
        sm:w-40
        md:w-48
        lg:w-56
        xl:w-64
        overflow-hidden
        rounded-2xl
        border-2
        border-slate-800
        bg-slate-900/95
        shadow-md
      "
      aria-hidden="true"
    >
      {/* SHIMMER */}
      <div
        className="
          pointer-events-none
          absolute
          inset-0
          z-20
          overflow-hidden
          rounded-2xl
        "
      >
        <motion.div
          className="
            absolute
            inset-y-0
            -left-1/2
            w-1/3
            bg-gradient-to-r
            from-transparent
            via-white/10
            to-transparent
            blur-sm
            will-change-transform
          "
          animate={{
            x: ["0%", "350%"],
          }}
          transition={{
            duration: 1.8,
            ease: "linear",
            repeat: Infinity,
          }}
        />
      </div>

      {/* IMAGE PLACEHOLDER */}
      <div
        className="
          relative
          h-40
          sm:h-52
          md:h-64
          lg:h-72
          xl:h-80
          overflow-hidden
          bg-slate-800/80
        "
      >
        <div
          className="
            absolute
            inset-0
            bg-gradient-to-t
            from-slate-900
            via-slate-800
            to-slate-700
          "
        />
      </div>

      {/* CONTENT PLACEHOLDER */}
      <div
        className="
          relative
          z-10
          -mt-px
          flex
          h-16
          sm:h-20
          md:h-24
          lg:h-28
          xl:h-32
          flex-col
          justify-center
          bg-slate-900/95
          p-2
          sm:p-3
          md:p-4
        "
      >
        <div
          className="
            mx-auto
            mb-2
            h-4
            w-5/6
            rounded-full
            bg-slate-700/70
          "
        />

        <div
          className="
            mx-auto
            h-4
            w-2/3
            rounded-full
            bg-slate-800/80
          "
        />
      </div>
    </div>
  );
}

export default function CardsListSkeleton({ count = 25 }) {
  return (
    <motion.div
      className="flex flex-wrap justify-center gap-8 pt-8"
      initial={{
        opacity: 0,
      }}
      animate={{
        opacity: 1,
      }}
      transition={{
        duration: 0.2,
      }}
    >
      {Array.from({ length: count }).map((_, index) => (
        <SkeletonCard key={index} />
      ))}
    </motion.div>
  );
}
