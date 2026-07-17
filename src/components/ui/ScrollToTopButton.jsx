import { useEffect, useState } from "react";
import { AnimatePresence, motion } from "motion/react";
import { ArrowUp } from "lucide-react";

export default function ScrollToTopButton({ visible }) {
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 700);
    };

    window.addEventListener("scroll", handleScroll);

    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  const scrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
  };

  return (
    <AnimatePresence>
      {visible && scrolled && (
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
          className="fixed bottom-6 right-6 z-50"
        >
          <motion.button
            onClick={scrollToTop}
            whileHover={{
              scale: 1.12,
              y: -3,
            }}
            whileTap={{
              scale: 0.92,
            }}
            className="
              flex
              h-12
              w-12
              cursor-pointer
              items-center
              justify-center
              rounded-xl
              border
              border-slate-700
              bg-slate-900/70
              text-amber-400
              backdrop-blur-sm
              shadow-lg
              shadow-amber-500/10
              hover:border-amber-400
              hover:bg-slate-800
              hover:text-amber-300
              hover:shadow-amber-500/20
            "
          >
            <motion.div
              animate={{
                y: [0, -3, 0],
              }}
              transition={{
                duration: 1.8,
                repeat: Infinity,
                ease: "easeInOut",
              }}
            >
              <ArrowUp size={22} />
            </motion.div>
          </motion.button>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
