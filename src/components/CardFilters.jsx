import { Search, SlidersHorizontal, X } from "lucide-react";
import CardFiltersPanel from "./CardFiltersPanel";

export default function CardFilters({
  search,
  setSearch,
  sortField,
  setSortField,
  sortDirection,
  setSortDirection,
  cardType,
  setCardType,
  cardRange,
  setCardRange,
  isFiltersOpen,
  setIsFiltersOpen,
}) {
  return (
    <div
      className="
        sticky
        top-4
        z-10
        mx-auto
        flex
        max-w-3xl
        items-center
        gap-3
      "
    >
      {/* SEARCH */}
      <div className="relative flex-1">
        <Search
          size={18}
          className="
            absolute
            left-4
            top-1/2
            -translate-y-1/2
            text-amber-400
            z-10
          "
        />

        <input
          type="text"
          placeholder="Search cards..."
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
            backdrop-blur-sm
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

        {/* CLEAR BUTTON */}
        {search && (
          <button
            type="button"
            onClick={() => setSearch("")}
            className="
              absolute
              right-3
              top-1/2
              -translate-y-1/2
              text-slate-400
              hover:text-white
              transition-colors
            "
          >
            <X size={18} />
          </button>
        )}
      </div>

      <button
        type="button"
        onClick={() => setIsFiltersOpen(true)}
        className="
          flex
          h-[50px]
          w-[50px]
          shrink-0
          items-center
          justify-center
          cursor-pointer
          rounded-xl
          border
          border-slate-700
          bg-slate-900/70
          text-white
          backdrop-blur-sm
          transition-all
          duration-200
          shadow-lg
          shadow-black/30
          transition-all
          hover:text-amber-300
          hover:-translate-y-0.5
          hover:border-amber-400
          hover:bg-slate-800
          hover:shadow-lg
          hover:shadow-amber-500/20
          sm:w-auto
          sm:px-4
        "
      >
        <SlidersHorizontal size={18} />

        <span className="hidden sm:inline ml-2">Filters</span>

        {(cardType || cardRange) && (
          <span
            className="
              absolute
              -right-1
              -top-1
              h-3
              w-3
              rounded-full
              bg-amber-400
            "
          />
        )}
      </button>

      <CardFiltersPanel
        isOpen={isFiltersOpen}
        onClose={() => setIsFiltersOpen(false)}
        sortField={sortField}
        setSortField={setSortField}
        sortDirection={sortDirection}
        setSortDirection={setSortDirection}
        cardType={cardType}
        setCardType={setCardType}
        cardRange={cardRange}
        setCardRange={setCardRange}
      />
    </div>
  );
}
