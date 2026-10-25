import { useParams } from "react-router";
import DeckBuilder from "../components/card/DeckBuilder";

export default function CardsPage() {
  const { deckCode } = useParams();

  return <DeckBuilder deckCode={deckCode} />;
}
