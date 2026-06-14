import { useEffect, useState } from "react";
import { fetchCards } from "../api/cards";

export default function CardsPage() {
  const [cards, setCards] = useState([]);

  useEffect(() => {
    async function loadCards() {
      try {
        const data = await fetchCards({
          deck: "MONSTERS",
          lang: "en",
          sort: "name_asc",
        });

        setCards(data);
      } catch (error) {
        console.error("Error loading cards:", error);
      }
    }

    loadCards();
  }, []);

  return (
    <div>
      {cards.map((card) => (
        <div key={card.code}>{card.name}</div>
      ))}
    </div>
  );
}
