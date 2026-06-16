import { useEffect, useState } from "react";
import ParticlesBackground from "./components/ParticlesBackground";
import { fetchCards } from "./api/cards";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import LoadingSpinner from "./components/LoadingSpinner";
import CardsPage from "./components/CardsPage";
import HeroSection from "./components/HeroSection";
import { factions } from "./data/factions";

function App() {
  const [index, setIndex] = useState(0);
  const [cards, setCards] = useState([]);
  const [loading, setLoading] = useState(false);

  async function handleFactionClick(deckCode) {
    setLoading(true);
    try {
      const data = await fetchCards({
        deck: deckCode,
        lang: "en",
        sort: "name_asc",
      });

      setCards(data);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    const interval = setInterval(() => {
      setIndex((current) => (current + 1) % factions.length);
    }, 3000);

    return () => clearInterval(interval);
  }, []);

  const currentFaction = factions[index];

  return (
    <>
      <ParticlesBackground />

      {loading && <LoadingSpinner />}

      <div className="min-h-screen flex flex-col">
        <Navbar />

        <main className="flex-1">
          {/* HERO */}
          <HeroSection currentFaction={currentFaction} />

          {/* CARDS GRID */}
          <CardsPage
            cards={cards}
            loading={loading}
            onFactionClick={handleFactionClick}
          />
        </main>

        <Footer />
      </div>
    </>
  );
}

export default App;
