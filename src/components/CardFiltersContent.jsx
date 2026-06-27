import { ArrowUp, ArrowDown, SlidersHorizontal, X } from "lucide-react";

const sortFields = [
  { value: "name", label: "Name" },
  { value: "power", label: "Power" },
  { value: "code", label: "Code" },
];

const cardTypes = [
  { value: "", label: "All" },
  { value: "hero", label: "Hero" },
  { value: "special", label: "Special" },
  { value: "unit", label: "Unit" },
];

const cardRanges = [
  {
    value: "agile",
    icon: "/icons/agile_icon_transparent.webp",
    label: "Agile",
  },
  {
    value: "close",
    icon: "/icons/close_icon_transparent.webp",
    label: "Close",
  },
  {
    value: "ranged",
    icon: "/icons/ranged_icon_transparent.webp",
    label: "Ranged",
  },
  {
    value: "siege",
    icon: "/icons/siege_icon_transparent.webp",
    label: "Siege",
  },
];

export default function CardFiltersContent({
  onClose,
  sortField,
  setSortField,
  sortDirection,
  setSortDirection,
  cardType,
  setCardType,
  cardRange,
  setCardRange,
}) {
  return (
    <>
      {/* MOBILE DRAWER HANDLE */}
      <div className="mb-4 flex justify-center md:hidden">
        <div className="h-1.5 w-12 rounded-full bg-slate-600" />
      </div>

      {/* HEADER */}
      <div className="mb-6 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <SlidersHorizontal size={20} />
          <h2 className="font-cinzel text-lg text-white">Filters</h2>
        </div>

        <button onClick={onClose} className="text-slate-400 hover:text-white">
          <X size={20} />
        </button>
      </div>

      {/* SORT FIELD */}
      <div className="mb-4">
        <label className="mb-2 block text-sm text-slate-400">Sort by</label>

        <div className="flex rounded-xl border border-slate-700 bg-slate-800 p-1">
          {sortFields.map((field) => (
            <button
              key={field.value}
              type="button"
              onClick={() => setSortField(field.value)}
              className={`
                      flex-1
                      rounded-lg
                      px-3
                      py-2
                      text-sm
                      transition-all
                      ${
                        sortField === field.value
                          ? "bg-amber-500 text-black"
                          : "text-slate-300 hover:text-white"
                      }
                    `}
            >
              {field.label}
            </button>
          ))}
        </div>
      </div>

      {/* SORT DIRECTION */}
      <div className="mb-4">
        <label className="mb-2 block text-sm text-slate-400">Direction</label>

        <div className="flex rounded-xl border border-slate-700 bg-slate-800 p-1">
          <button
            type="button"
            onClick={() => setSortDirection("asc")}
            className={`
                    flex-1
                    flex
                    items-center
                    justify-center
                    gap-2
                    rounded-lg
                    py-2
                    text-sm
                    transition-all
                    ${
                      sortDirection === "asc"
                        ? "bg-amber-500 text-black"
                        : "text-slate-300 hover:text-white"
                    }
                  `}
          >
            <ArrowUp size={16} />
            Asc
          </button>

          <button
            type="button"
            onClick={() => setSortDirection("desc")}
            className={`
                    flex-1
                    flex
                    items-center
                    justify-center
                    gap-2
                    rounded-lg
                    py-2
                    text-sm
                    transition-all
                    ${
                      sortDirection === "desc"
                        ? "bg-amber-500 text-black"
                        : "text-slate-300 hover:text-white"
                    }
                  `}
          >
            <ArrowDown size={16} />
            Desc
          </button>
        </div>
      </div>

      {/* TYPE */}
      <div className="mb-4">
        <label className="mb-2 block text-sm text-slate-400">Type</label>

        <div className="flex rounded-xl border border-slate-700 bg-slate-800 p-1 overflow-x-auto">
          {cardTypes.map((type) => (
            <button
              key={type.value}
              type="button"
              onClick={() => setCardType(type.value)}
              className={`
                      flex-1
                      min-w-[80px]
                      rounded-lg
                      px-3
                      py-2
                      text-sm
                      transition-all
                      ${
                        cardType === type.value
                          ? "bg-amber-500 text-black"
                          : "text-slate-300 hover:text-white"
                      }
                    `}
            >
              {type.label}
            </button>
          ))}
        </div>
      </div>

      {/* RANGE */}
      <div className="mb-4">
        <label className="mb-2 block text-sm text-slate-400">Range</label>

        <div className="flex rounded-xl border border-slate-700 bg-slate-800 p-1">
          {cardRanges.map((range) => (
            <button
              key={range.value}
              type="button"
              onClick={() =>
                setCardRange(cardRange === range.value ? "" : range.value)
              }
              title={range.label}
              className={`
                flex-1
                flex
                items-center
                justify-center
                rounded-lg
                py-2
                transition-all
                ${
                  cardRange === range.value
                    ? "bg-amber-500"
                    : "text-slate-300 hover:bg-slate-700"
                }
              `}
            >
              {range.value === "" ? (
                <span className="text-sm font-medium">All</span>
              ) : (
                <img
                  src={range.icon}
                  alt={range.label}
                  className={`
                    h-8
                    w-8
                    object-contain
                    transition-all
                    ${
                      cardRange === range.value
                        ? "brightness-0"
                        : "brightness-0 invert opacity-80"
                    }
                  `}
                />
              )}
            </button>
          ))}
        </div>
      </div>
    </>
  );
}
