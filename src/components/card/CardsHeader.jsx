import { useTranslation } from "react-i18next";
import { factions } from "../../data/factions";

export default function CardsHeader({ deckCode }) {
  const { t } = useTranslation();
  const faction = factions.find((f) => f.code === deckCode);

  return (
    <header className="mx-auto flex max-w-screen-2xl justify-center px-6 pt-2 pb-6">
      <div
        className={`
              text-2xl
              sm:text-2xl
              md:text-6xl
              font-bold
              tracking-wide
              font-cinzel
              ${faction.color}
            `}
        style={{
          textShadow: "0 0 20px currentColor",
        }}
      >
        {t(`factions.${faction.code}`)}
      </div>
    </header>
  );
}
