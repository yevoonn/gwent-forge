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
          whileHover={{
            scale: 1.12,
            y: -3,
          }}
          whileTap={{
            scale: 0.92,
          }}
          className="fixed bottom-6 right-6 z-50"
        >
          <motion.button
            animate={{
              scale: [1, 1.05, 1],
              y: [0, -2, 0],
            }}
            transition={{
              duration: 2,
              repeat: Infinity,
              ease: "easeInOut",
            }}
            whileHover={{
              scale: 1.12,
              y: -3,
            }}
            whileTap={{
              scale: 0.92,
            }}
            onClick={scrollToTop}
            className={`
              flex
              h-12
              w-12
              items-center
              justify-center
              rounded-full
              bg-amber-500
              text-black
              shadow-lg
              hover:bg-amber-400
              cursor-pointer
            `}
          >
            <ArrowUp size={22} />
          </motion.button>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
