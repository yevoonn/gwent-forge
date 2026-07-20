import { useTranslation } from "react-i18next";
import { ArrowUp, SlidersHorizontal, X } from "lucide-react";

const sortFields = [
  { value: "name", label: "filters.sort_fields.name" },
  { value: "power", label: "filters.sort_fields.power" },
  { value: "code", label: "filters.sort_fields.code" },
];

const rangeIcons = {
  AGILE: "/icons/agile_icon_transparent.webp",
  CLOSE: "/icons/close_icon_transparent.webp",
  RANGED: "/icons/ranged_icon_transparent.webp",
  SIEGE: "/icons/siege_icon_transparent.webp",
};

export default function CardFiltersContent({
  filters,
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
  const { t } = useTranslation();

  const { cardTypes = [], cardRanges = [] } = filters || {};

  const typeOptions = [
    ...cardTypes.map((type) => ({
      value: type.code.toLowerCase(),
      label: type.name,
    })),
  ];

  const rangeOptions = [
    ...cardRanges.map((range) => ({
      value: range.code.toLowerCase(),
      label: range.name,
      icon: rangeIcons[range.code],
    })),
  ];

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
          <h2 className="font-cinzel text-lg text-white">
            {t("filters.title")}
          </h2>
        </div>

        <button
          onClick={onClose}
          className="cursor-pointer text-slate-400 hover:text-white"
        >
          <X size={20} />
        </button>
      </div>

      {/* SORT FIELD */}
      <div className="mb-4">
        <label className="mb-2 block text-sm text-slate-400">
          {t("filters.sort_by")}
        </label>

        <div className="flex rounded-xl border border-slate-700 bg-slate-800 p-1 gap-1">
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
              cursor-pointer
              font-bold
              ${
                sortField === field.value
                  ? "bg-amber-500 text-black"
                  : "text-slate-300 hover:bg-slate-700"
              }
            `}
            >
              {t(field.label)}
            </button>
          ))}

          <div className="mx-2 w-px bg-slate-600" />

          <button
            type="button"
            onClick={() =>
              setSortDirection((prev) => (prev === "asc" ? "desc" : "asc"))
            }
            title={sortDirection === "asc" ? "Ascending" : "Descending"}
            className="
              flex
              h-10
              w-10
              items-center
              justify-center
              rounded-lg
              bg-amber-500
              text-black
              transition-all
              hover:bg-amber-400
              active:scale-95
              cursor-pointer
            "
          >
            <ArrowUp
              size={18}
              className={`transition-transform duration-200 ${
                sortDirection === "desc" ? "rotate-180" : ""
              }`}
            />
          </button>
        </div>
      </div>

      {/* TYPE */}
      <div className="mb-4">
        <label className="mb-2 block text-sm text-slate-400">
          {t("filters.type")}
        </label>

        <div className="flex rounded-xl border border-slate-700 bg-slate-800 p-1 gap-1">
          {typeOptions.map((type) => (
            <button
              key={type.value}
              type="button"
              onClick={() =>
                setCardType(cardType === type.value ? "" : type.value)
              }
              className={`
                flex-1
                flex
                items-center
                justify-center
                h-10
                min-w-[80px]
                rounded-lg
                px-3
                py-2
                text-sm
                transition-all
                cursor-pointer
                font-bold
                ${
                  cardType === type.value
                    ? "bg-amber-500 text-black"
                    : "text-slate-300 hover:bg-slate-700"
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
        <label className="mb-2 block text-sm text-slate-400">
          {t("filters.range")}
        </label>

        <div className="flex rounded-xl border border-slate-700 bg-slate-800 p-1 gap-1">
          {rangeOptions.map((range) => (
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
                cursor-pointer
                ${
                  cardRange === range.value
                    ? "bg-amber-500"
                    : "text-slate-300 hover:bg-slate-700"
                }
              `}
            >
              <img
                src={range.icon}
                alt={range.label}
                className={`
                    h-6
                    w-6
                    object-contain
                    transition-all
                    ${
                      cardRange === range.value
                        ? "brightness-0"
                        : "brightness-0 invert opacity-80"
                    }
                  `}
              />
            </button>
          ))}
        </div>
      </div>
    </>
  );
}
