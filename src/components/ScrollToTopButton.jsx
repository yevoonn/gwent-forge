import { useEffect, useState } from "react";
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

  if (!visible || !scrolled) return null;

  return (
    <button
      onClick={scrollToTop}
      className={`
        fixed
        bottom-6
        right-6
        z-50
        flex
        h-12
        w-12
        items-center
        justify-center
        rounded-full
        bg-amber-500
        text-black
        shadow-lg
        transition-all
        hover:scale-110
        hover:bg-amber-400
        cursor-pointer
      `}
      aria-label="Scroll to top"
    >
      <ArrowUp size={22} />
    </button>
  );
}
