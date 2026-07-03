import { useEffect, useState } from "react";
import ParticlesBackground from "../components/ParticlesBackground";
import { fetchCards } from "../api/cards";
import LoadingSpinner from "../components/LoadingSpinner";
import CardsPage from "../components/CardsPage";
import HeroSection from "../components/HeroSection";
import { factions } from "../data/factions";

export default function HomePage() {
  const [index, setIndex] = useState(0);
  const [leaders, setLeaders] = useState([]);
  const [cards, setCards] = useState([]);
  const [leadersLoading, setLeadersLoading] = useState(false);
  const [cardsLoading, setCardsLoading] = useState(false);
  const [selectedFactionDeckCode, setSelectedFactionDeckCode] = useState(null);
  const [search, setSearch] = useState("");
  const [sortField, setSortField] = useState("name");
  const [sortDirection, setSortDirection] = useState("asc");
  const [cardType, setCardType] = useState("");
  const [cardRange, setCardRange] = useState("");

  const handleFactionClick = (deckCode) => {
    setSearch("");
    setSelectedFactionDeckCode(deckCode);
  };

  useEffect(() => {
    if (!selectedFactionDeckCode) return;

    const loadLeaders = async () => {
      setLeadersLoading(true);
      try {
        const leadersData = await fetchCards({
          deck: selectedFactionDeckCode,
          lang: "en",
          sort: "code_asc",
          is_deck_card: "false",
          type: "leader",
        });

        setLeaders(leadersData);
      } catch (error) {
        console.error(error);
      } finally {
        setLeadersLoading(false);
      }
    };

    loadLeaders();
  }, [selectedFactionDeckCode]);

  useEffect(() => {
    if (!selectedFactionDeckCode) return;

    const timeoutId = setTimeout(
      async () => {
        setCardsLoading(true);

        try {
          const cardsData = await fetchCards({
            deck: selectedFactionDeckCode,
            search,
            sort: `${sortField}_${sortDirection}`,
            type: cardType,
            range: cardRange,
          });

          setCards(cardsData);
        } catch (error) {
          console.error(error);
        } finally {
          setCardsLoading(false);
        }
      },
      search ? 500 : 0,
    );

    return () => clearTimeout(timeoutId);
  }, [
    selectedFactionDeckCode,
    search,
    sortField,
    sortDirection,
    cardType,
    cardRange,
  ]);

  useEffect(() => {
    const interval = setInterval(() => {
      setIndex((current) => (current + 1) % factions.length);
    }, 3000);

    return () => clearInterval(interval);
  }, []);

  const currentFaction = factions[index];
  const loading = leadersLoading || cardsLoading;

  return (
    <>
      <ParticlesBackground />

      {loading && <LoadingSpinner />}

      {/* HERO */}
      {!selectedFactionDeckCode ? (
        <HeroSection currentFaction={currentFaction} />
      ) : null}

      {/* CARDS GRID */}
      <CardsPage
        selectedFactionDeckCode={selectedFactionDeckCode}
        leaders={leaders}
        cards={cards}
        loading={loading}
        onFactionClick={handleFactionClick}
        search={search}
        setSearch={setSearch}
        sortField={sortField}
        setSortField={setSortField}
        sortDirection={sortDirection}
        setSortDirection={setSortDirection}
        cardType={cardType}
        setCardType={setCardType}
        cardRange={cardRange}
        setCardRange={setCardRange}
        currentFactionCode={currentFaction.code}
      />
    </>
  );
}
