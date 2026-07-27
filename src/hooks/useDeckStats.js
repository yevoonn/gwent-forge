import { useMemo } from "react";

export default function useDeckStats(selectedCards, selectedLeader) {
  const power = useMemo(() => {
    return selectedCards.reduce((sum, card) => sum + (card.power ?? 0), 0);
  }, [selectedCards]);

  const units = useMemo(() => {
    return selectedCards.reduce((count, card) => {
      return (
        count + (card.type.code === "UNIT" || card.type.code === "HERO" ? 1 : 0)
      );
    }, 0);
  }, [selectedCards]);

  const special = useMemo(() => {
    return selectedCards.reduce((count, card) => {
      return count + (card.type.code === "SPECIAL" ? 1 : 0);
    }, 0);
  }, [selectedCards]);

  const spy = useMemo(() => {
    return selectedCards.reduce((count, card) => {
      return count + (card?.abilities[0]?.code === "SPY" ? 1 : 0);
    }, 0);
  }, [selectedCards]);

  const medic = useMemo(() => {
    return selectedCards.reduce((count, card) => {
      return count + (card?.abilities[0]?.code === "MEDIC" ? 1 : 0);
    }, 0);
  }, [selectedCards]);

  return {
    leaders: selectedLeader ? 1 : 0,
    units,
    power,
    special,
    spy,
    medic,
  };
}
