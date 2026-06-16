import { API_URL } from "../config";

export async function fetchCards({
  deck,
  lang = "en",
  sort = "name_asc",
  is_deck_card = "true",
  type,
}) {
  const params = new URLSearchParams({ deck, lang, sort, is_deck_card });

  if (type) {
    params.append("type", type);
  }

  const response = await fetch(`${API_URL}/api/cards?${params.toString()}`);

  if (!response.ok) {
    throw new Error("Failed to fetch cards");
  }

  return await response.json();
}
