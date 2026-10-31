import { useEffect, useState } from "react";
import { fetchCards } from "../../api/cards";
import { fetchFilters } from "../../api/filters";
import useCurrentLanguage from "../../hooks/useCurrentLanguage";
import LoadingSpinner from "../ui/LoadingSpinner";
import CardsGrid from "./CardsGrid";

export default function DeckBuilder({ deckCode, userDeck = null }) {
  const language = useCurrentLanguage();

  const [leaders, setLeaders] = useState([]);
  const [cards, setCards] = useState([]);
  const [filters, setFilters] = useState({
    cardTypes: [],
    cardRanges: [],
    cardAbilities: [],
  });

  const [leadersLoading, setLeadersLoading] = useState(false);
  const [cardsLoading, setCardsLoading] = useState(false);
  const [filtersLoading, setFiltersLoading] = useState(false);

  const [search, setSearch] = useState("");
  const [sortField, setSortField] = useState("name");
  const [sortDirection, setSortDirection] = useState("asc");
  const [cardType, setCardType] = useState("");
  const [cardRange, setCardRange] = useState("");
  const [selectedAbilities, setSelectedAbilities] = useState([]);

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
            abilities: selectedAbilities,
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
    selectedAbilities,
  ]);

  useEffect(() => {
    const loadFilters = async () => {
      setFiltersLoading(true);

      try {
        const data = await fetchFilters({ lang: language });
        setFilters(data);
      } catch (error) {
        console.error(error);
      } finally {
        setFiltersLoading(false);
      }
    };

    loadFilters();
  }, [language]);

  const loading = leadersLoading || cardsLoading || filtersLoading;

  return (
    <>
      {loading && <LoadingSpinner />}

      <CardsGrid
        key={deckCode}
        userDeck={userDeck}
        deckCode={deckCode}
        leaders={leaders}
        cards={cards}
        filters={filters}
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
        selectedAbilities={selectedAbilities}
        setSelectedAbilities={setSelectedAbilities}
      />
    </>
  );
}
