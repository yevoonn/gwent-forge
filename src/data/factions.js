export const factions = [
  { name: "Northern Realms", code: "northern_realms", color: "text-sky-400" },
  { name: "Nilfgaard", code: "nilfgaard", color: "text-yellow-300" },
  { name: "Monsters", code: "monsters", color: "text-red-600" },
  { name: "Scoia'tael", code: "scoiatael", color: "text-emerald-400" },
  { name: "Skellige", code: "skellige", color: "text-indigo-400" },
];

export const featuredCards = [
  {
    name: "Foltest",
    deckCode: "northern_realms",
    power: null,
    faction: "Northern Realms",
    image: "/cards/NOR002.webp",
  },
  {
    name: "Emhyr var Emreis",
    deckCode: "nilfgaard",
    power: null,
    faction: "Nilfgaard",
    image: "/cards/NIL005.webp",
  },
  {
    name: "Eredin",
    deckCode: "monsters",
    power: null,
    faction: "Monsters",
    image: "/cards/MON001.webp",
  },
  {
    name: "Francesca Findabair",
    deckCode: "scoiatael",
    power: null,
    faction: "Scoia'tael",
    image: "/cards/SCO005.webp",
  },
  {
    name: "Crach an Craite",
    deckCode: "skellige",
    power: null,
    faction: "Skellige",
    image: "/cards/SKE002.webp",
  },
];

const fallbackStyle = {
  tile: "border-slate-700 bg-slate-900/50 hover:border-amber-400/40 hover:shadow-amber-500/10",
  icon: "bg-amber-400/10 text-amber-400",
  label: "text-slate-400",
};

export const factionStyles = {
  northern_realms: {
    tile: "border-sky-400/30 bg-sky-950/30 hover:border-sky-400/70 hover:shadow-sky-500/20",
    icon: "bg-sky-400/10 text-sky-400",
    label: "text-sky-400",
  },
  nilfgaard: {
    tile: "border-yellow-300/30 bg-yellow-950/20 hover:border-yellow-300/70 hover:shadow-yellow-400/20",
    icon: "bg-yellow-300/10 text-yellow-300",
    label: "text-yellow-300",
  },
  monsters: {
    tile: "border-red-500/30 bg-red-950/30 hover:border-red-500/70 hover:shadow-red-500/20",
    icon: "bg-red-500/10 text-red-500",
    label: "text-red-500",
  },
  scoiatael: {
    tile: "border-emerald-400/30 bg-emerald-950/30 hover:border-emerald-400/70 hover:shadow-emerald-500/20",
    icon: "bg-emerald-400/10 text-emerald-400",
    label: "text-emerald-400",
  },
  skellige: {
    tile: "border-indigo-400/30 bg-indigo-950/30 hover:border-indigo-400/70 hover:shadow-indigo-500/20",
    icon: "bg-indigo-400/10 text-indigo-400",
    label: "text-indigo-400",
  },
};

export const getFactionStyle = (code) => factionStyles[code] ?? fallbackStyle;
