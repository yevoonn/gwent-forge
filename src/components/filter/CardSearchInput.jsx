import { Search, X } from "lucide-react";
import { useTranslation } from "react-i18next";

export default function CardSearchInput({ search, setSearch }) {
  const { t } = useTranslation();

  return (
    <div className="relative w-full">
      <Search
        size={18}
        className="absolute left-4 top-1/2 z-10 -translate-y-1/2 text-amber-400"
      />

      <input
        type="text"
        placeholder={t("filters.search_placeholder")}
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        className="
          w-full
          rounded-xl
          border
          border-slate-700
          bg-slate-900/80
          py-3
          pl-11
          pr-10
          text-white
          placeholder:text-slate-500
          transition-all
          duration-300
          shadow-lg
          shadow-black/30
          focus:border-amber-400
          focus:ring-2
          focus:ring-amber-400/20
          focus:outline-none
        "
      />

      {search && (
        <button
          type="button"
          aria-label="Clear search"
          onClick={() => setSearch("")}
          className="
            absolute
            right-3
            top-1/2
            -translate-y-1/2
            cursor-pointer
            text-slate-400
            transition-colors
            hover:text-white
          "
        >
          <X size={18} />
        </button>
      )}
    </div>
  );
}
