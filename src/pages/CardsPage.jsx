import { useParams } from "react-router";
import { factions } from "../data/factions";
import DeckBuilder from "../components/card/DeckBuilder";
import NotFoundPage from "./NotFoundPage";

export default function CardsPage() {
  const { deckCode } = useParams();

  if (!factions.some((f) => f.code === deckCode)) {
    return <NotFoundPage />;
  }

  return <DeckBuilder deckCode={deckCode} />;
}
