import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { fetchCards } from "../api/cards";
import useCurrentLanguage from "../hooks/useCurrentLanguage";
import LoadingSpinner from "../components/LoadingSpinner";
import CardsGrid from "../components/CardsGrid";
import CardsHeader from "../components/CardsHeader";

export default function CardsPage() {
  const language = useCurrentLanguage();

  const { deckCode } = useParams();

  const [leaders, setLeaders] = useState([]);
  const [cards, setCards] = useState([]);

  const [leadersLoading, setLeadersLoading] = useState(false);
  const [cardsLoading, setCardsLoading] = useState(false);

  const [search, setSearch] = useState("");
  const [sortField, setSortField] = useState("name");
  const [sortDirection, setSortDirection] = useState("asc");
  const [cardType, setCardType] = useState("");
  const [cardRange, setCardRange] = useState("");

  useEffect(() => {
    if (!deckCode) return;

    const loadLeaders = async () => {
      setLeadersLoading(true);
      try {
        const leadersData = await fetchCards({
          deck: deckCode,
          lang: language,
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
  }, [deckCode, language]);

  useEffect(() => {
    if (!deckCode) return;

    const timeoutId = setTimeout(
      async () => {
        setCardsLoading(true);

        try {
          const cardsData = await fetchCards({
            deck: deckCode,
            lang: language,
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
    deckCode,
    language,
    search,
    sortField,
    sortDirection,
    cardType,
    cardRange,
  ]);

  const loading = leadersLoading || cardsLoading;

  return (
    <>
      {loading && <LoadingSpinner />}

      <CardsHeader />

      <CardsGrid
        deckCode={deckCode}
        leaders={leaders}
        cards={cards}
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
      />
    </>
  );
}
