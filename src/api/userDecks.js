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

export async function fetchUserDeck({ accessToken, id, lang = "en" }) {
  const data = await apiFetch(`/api/user-decks/${id}?lang=${lang}`, {
    accessToken,
  });

  return data.userDeck;
}

export async function fetchUserDecks({ accessToken, lang = "en" }) {
  const data = await apiFetch(`/api/user-decks?lang=${lang}`, {
    accessToken,
  });

  return data.userDecks;
}

export async function updateUserDeck({
  accessToken,
  id,
  lang,
  name,
  description,
  cardCodes,
}) {
  const data = await apiFetch(`/api/user-decks/${id}`, {
    method: "PATCH",
    accessToken,
    body: JSON.stringify({ lang, name, description, cardCodes }),
  });

  return data.userDeck;
}

export async function deleteUserDeck({ accessToken, id }) {
  await apiFetch(`/api/user-decks/${id}`, {
    method: "DELETE",
    accessToken,
  });
}
