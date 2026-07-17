import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import FeaturedCards from "../components/card/FeaturedCards";
import HeroSection from "../components/layout/HeroSection";
import { factions } from "../data/factions";

export default function HomePage() {
  const navigate = useNavigate();

  const [index, setIndex] = useState(0);

  const currentFaction = factions[index];

  const handleFactionClick = (deckCode) => {
    navigate(`/cards/${deckCode}`);
  };

  useEffect(() => {
    const interval = setInterval(() => {
      setIndex((current) => (current + 1) % factions.length);
    }, 3000);

    return () => clearInterval(interval);
  }, []);

  return (
    <>
      <HeroSection currentFaction={currentFaction} />

      <FeaturedCards
        onFactionClick={handleFactionClick}
        currentFactionCode={currentFaction.code}
      />
    </>
  );
}
