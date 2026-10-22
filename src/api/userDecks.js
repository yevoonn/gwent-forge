import { apiFetch } from "./client";

export async function createUserDeck({
  accessToken,
  deckId,
  name,
  description,
  cardCodes,
}) {
  const body = { deckId, name, cardCodes };

  if (description) {
    body.description = description;
  }

  const data = await apiFetch("/api/user-decks", {
    method: "POST",
    accessToken,
    body: JSON.stringify(body),
  });

  return data.userDeck;
}
