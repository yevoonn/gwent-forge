import { ArrowLeft } from "lucide-react";
import { Link } from "react-router-dom";

export default function CardsHeader() {
  return (
    <header className="mx-auto flex max-w-screen-2xl justify-center px-6 pt-2 pb-6">
      <Link
        to="/"
        className="
          inline-flex
          items-center
          gap-2
          rounded-xl
          border
          border-slate-700
          text-white
          bg-slate-900/70
          px-5
          py-2.5
          font-cinzel
          backdrop-blur-sm
          transition-all
          duration-200
          hover:text-amber-300
          hover:-translate-y-0.5
          hover:border-amber-400
          hover:bg-slate-800
          hover:shadow-lg
          hover:shadow-amber-500/20
        "
      >
        <ArrowLeft size={20} />
        <span>Back to Factions</span>
      </Link>
    </header>
  );
}
