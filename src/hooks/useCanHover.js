import { useEffect, useState } from "react";

export default function useCanHover() {
  const getMatches = () =>
    typeof window !== "undefined" &&
    window.matchMedia("(hover: hover) and (pointer: fine)").matches;

  const [canHover, setCanHover] = useState(getMatches);

  useEffect(() => {
    const mediaQuery = window.matchMedia("(hover: hover) and (pointer: fine)");

    const handleChange = (event) => {
      setCanHover(event.matches);
    };

    mediaQuery.addEventListener("change", handleChange);

    return () => {
      mediaQuery.removeEventListener("change", handleChange);
    };
  }, []);

  return canHover;
}
