import GwentCard from "./GwentCard";

const featuredCards = [
  {
    name: "Foltest",
    deckCode: "northern_realms",
    power: null,
    faction: "Northern Realms",
    rarity: null,
    image: "/cards/foltest.webp",
  },
  {
    name: "Emhyr var Emreis",
    deckCode: "nilfgaard",
    power: null,
    faction: "Nilfgaard",
    rarity: null,
    image: "/cards/emhyr.webp",
  },
  {
    name: "Eredin",
    deckCode: "monsters",
    power: null,
    faction: "Monsters",
    rarity: null,
    image: "/cards/eredin.webp",
  },
  {
    name: "Francesca Findabair",
    deckCode: "scoiatael",
    power: null,
    faction: "Scoia'tael",
    rarity: null,
    image: "/cards/francesca.webp",
  },
  {
    name: "Crach an Craite",
    deckCode: "skellige",
    power: null,
    faction: "Skellige",
    rarity: null,
    image: "/cards/crach.webp",
  },
];

export default function CardsPage({ cards, loading, onFactionClick }) {
  return (
    <>
      <section className="mx-auto max-w-screen-2xl px-6 pt-8">
        <div className="flex flex-wrap justify-center gap-8">
          {featuredCards.map((card) => (
            <button
              key={card.name}
              onClick={() => onFactionClick(card.deckCode)}
              disabled={loading}
            >
              <GwentCard {...card} />
            </button>
          ))}
        </div>
      </section>

      <section className="mx-auto max-w-screen-2xl px-6 pt-8">
        {cards.length > 0 ? (
          <div className="flex flex-wrap justify-center gap-8">
            {cards.map((card) => (
              <GwentCard
                key={card.code}
                name={card.name}
                power={card.power > 0 ? card.power : null}
                image="/cards/geralt.webp"
              />
            ))}
          </div>
        ) : (
          <p className="text-center text-slate-400 text-lg">
            Select faction to view cards
          </p>
        )}
      </section>
    </>
  );
}
