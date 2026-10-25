import { useEffect, useState } from "react";
import { useParams } from "react-router";
import { useTranslation } from "react-i18next";
import { fetchUserDeck } from "../api/userDecks";
import { useAuth } from "../hooks/useAuth";
import useCurrentLanguage from "../hooks/useCurrentLanguage";
import { getApiErrorMessage } from "../utils/apiErrorMessageHelper";
import LoadingSpinner from "../components/ui/LoadingSpinner";
import DeckBuilder from "../components/card/DeckBuilder";
import { SearchX, TriangleAlert } from "lucide-react";
import ErrorState from "../components/ui/ErrorState";

function UserDeckView({ userDeckId }) {
  const { t } = useTranslation();
  const { isAuthenticated, authenticatedFetch } = useAuth();

  // Capture the language when opening the editor: the name and description
  // are loaded in that language, and PATCH must update the same language.
  const language = useCurrentLanguage();
  const [loadLanguage] = useState(language);

  const [userDeck, setUserDeck] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (!isAuthenticated) return;

    let cancelled = false;

    const load = async () => {
      try {
        const deck = await authenticatedFetch((token) =>
          fetchUserDeck({
            accessToken: token,
            id: userDeckId,
            lang: loadLanguage,
          }),
        );

        if (!cancelled) {
          setError(null);
          setUserDeck({ ...deck, lang: loadLanguage });
        }
      } catch (err) {
        console.error(err);
        if (!cancelled) setError(err);
      }
    };

    load();

    return () => {
      cancelled = true;
    };
  }, [authenticatedFetch, isAuthenticated, userDeckId, loadLanguage]);

  if (error) {
    // 404 means the deck does not exist or belongs to another user,
    // and the two cases are intentionally not distinguished.
    const isNotFound = error.status === 404 || error.status === 400;

    return isNotFound ? (
      <ErrorState
        icon={SearchX}
        title={t("user_deck.not_found")}
        description={t("user_deck.not_found_description")}
      />
    ) : (
      <ErrorState icon={TriangleAlert} title={getApiErrorMessage(error, t)} />
    );
  }

  if (!userDeck) return <LoadingSpinner />;

  return (
    <DeckBuilder
      deckCode={userDeck.deck.code.toLowerCase()}
      userDeck={userDeck}
    />
  );
}

export default function UserDeckPage() {
  const { userDeckId } = useParams();

  // The key resets component state when navigating from /decks/7 to /decks/8.
  return <UserDeckView key={userDeckId} userDeckId={userDeckId} />;
}
