import { API_URL } from "../config";

export async function fetchFilters({ lang = "en" }) {
  const [cardTypes, cardRanges, cardAbilities] = await Promise.all([
    fetchCardTypes({ lang }),
    fetchCardRanges({ lang }),
    fetchCardAbilities({ lang }),
  ]);

  return {
    cardTypes,
    cardRanges,
    cardAbilities,
  };
}

async function fetchCardTypes({ lang = "en" }) {
  const code = "HERO,SPECIAL,UNIT";
  const params = new URLSearchParams({ lang, code });

  const response = await fetch(
    `${API_URL}/api/card-types?${params.toString()}`,
  );

  if (!response.ok) {
    throw new Error("Failed to fetch card types");
  }

  return await response.json();
}

async function fetchCardRanges({ lang = "en" }) {
  const params = new URLSearchParams({ lang });

  const response = await fetch(
    `${API_URL}/api/card-ranges?${params.toString()}`,
  );

  if (!response.ok) {
    throw new Error("Failed to fetch card ranges");
  }

  return await response.json();
}

async function fetchCardAbilities({ lang = "en" }) {
  const params = new URLSearchParams({
    lang,
    sort: "name_asc",
    is_special: "false",
  });

  const response = await fetch(
    `${API_URL}/api/card-abilities?${params.toString()}`,
  );

  if (!response.ok) {
    throw new Error("Failed to fetch card abilities");
  }

  return await response.json();
}
