import {
  CloudSunRain,
  Crown,
  Eye,
  Heart,
  ShieldUser,
  Swords,
} from "lucide-react";

export const deckStatusConfig = [
  {
    id: "leader",
    icon: Crown,
    source: "leaders",
    limit: 1,
    mode: "min",
  },
  {
    id: "units",
    icon: ShieldUser,
    source: "units",
    limit: 22,
    mode: "min",
  },
  {
    id: "power",
    icon: Swords,
    source: "power",
    limit: 130,
    mode: "max",
  },
  {
    id: "special",
    icon: CloudSunRain,
    source: "special",
    limit: 5,
    mode: "max",
  },
  {
    id: "spy",
    icon: Eye,
    source: "spy",
    limit: 2,
    mode: "max",
  },
  {
    id: "medic",
    icon: Heart,
    source: "medic",
    limit: 2,
    mode: "max",
  },
];
