import { useTranslation } from "react-i18next";
import { factions } from "../../data/factions";

export default function CardsHeader({ deckCode }) {
  const { t } = useTranslation();
  const faction = factions.find((f) => f.code === deckCode);

  return (
    <header className="flex justify-center pt-12 pb-6">
      <h1
        className={`
          text-center
          text-2xl
          font-bold
          tracking-wide
          font-cinzel
          md:text-6xl
          ${faction.color}
        `}
        style={{ textShadow: "0 0 20px currentColor" }}
      >
        {t(`factions.${faction.code}`)}
      </h1>
    </header>
  );
}
