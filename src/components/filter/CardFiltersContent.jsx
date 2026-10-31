import { useTranslation } from "react-i18next";
import { ArrowUp } from "lucide-react";

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
  sortField,
  setSortField,
  sortDirection,
  setSortDirection,
  cardType,
  setCardType,
  cardRange,
  setCardRange,
  selectedAbilities,
  setSelectedAbilities,
  showOnlySelected,
  setShowOnlySelected,
  hasSelectedCards,
}) {
  const { t } = useTranslation();

  const { cardTypes = [], cardRanges = [], cardAbilities = [] } = filters || {};

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

  const abilityOptions = cardAbilities.map((ability) => ({
    value: ability.code,
    label: ability.name ?? ability.code,
  }));

  const toggleAbility = (code) =>
    setSelectedAbilities((prev) =>
      prev.includes(code)
        ? prev.filter((selected) => selected !== code)
        : [...prev, code],
    );

  return (
    <>
      {/* SHOW ONLY SELECTED */}
      <div className="mb-4">
        <button
          type="button"
          disabled={!hasSelectedCards}
          aria-disabled={!hasSelectedCards}
          onClick={() => {
            if (hasSelectedCards) {
              setShowOnlySelected((prev) => !prev);
            }
          }}
          className={`
            flex
            w-full
            items-center
            justify-between
            rounded-xl
            border
            border-slate-700
            bg-slate-800
            px-4
            py-3
            transition-opacity
            ${hasSelectedCards ? "cursor-pointer" : "cursor-not-allowed opacity-50"}
          `}
        >
          <span className="text-sm text-slate-300 font-bold">
            {t("filters.show_only_selected")}
          </span>

          <span
            className={`
              relative
              inline-flex
              h-6
              w-11
              shrink-0
              items-center
              rounded-full
              transition-colors
              duration-200
              ${showOnlySelected ? "bg-amber-400" : "bg-slate-600"}
            `}
          >
            <span
              className={`
                inline-block
                h-4
                w-4
                transform
                rounded-full
                bg-slate-950
                transition-transform
                duration-200
                ${showOnlySelected ? "translate-x-6" : "translate-x-1"}
              `}
            />
          </span>
        </button>
      </div>

      {/* SORT FIELD */}
      <div className="mb-4">
        <label className="mb-2 block text-sm text-slate-300">
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
                  ? "bg-amber-400 text-black"
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
              bg-amber-400
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
        <label className="mb-2 block text-sm text-slate-300">
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
                rounded-lg
                px-3
                py-2
                text-sm
                transition-all
                cursor-pointer
                font-bold
                ${
                  cardType === type.value
                    ? "bg-amber-400 text-black"
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
        <label className="mb-2 block text-sm text-slate-300">
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
                    ? "bg-amber-400"
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

      {/* ABILITIES */}
      {abilityOptions.length > 0 && (
        <div>
          <label className="mb-2 block text-sm text-slate-300">
            {t("filters.abilities")}
          </label>

          <div className="grid grid-cols-[repeat(auto-fill,minmax(3rem,1fr))] gap-1 rounded-xl border border-slate-700 bg-slate-800 p-1">
            {abilityOptions.map((ability) => {
              const active = selectedAbilities.includes(ability.value);

              return (
                <button
                  key={ability.value}
                  type="button"
                  aria-pressed={active}
                  aria-label={ability.label}
                  title={ability.label}
                  onClick={() => toggleAbility(ability.value)}
                  className={`
                    flex
                    aspect-square
                    cursor-pointer
                    items-center
                    justify-center
                    rounded-lg
                    transition-all
                    active:scale-95
                    ${active ? "bg-amber-400" : "hover:bg-slate-700"}
                  `}
                >
                  <span
                    className={`
                      flex
                      h-9
                      w-9
                      items-center
                      justify-center
                      rounded-full
                      border-2
                      bg-stone-200
                      transition-colors
                      ${active ? "border-slate-950" : "border-orange-300"}
                    `}
                  >
                    <img
                      src={`/icons/${ability.value.toLowerCase()}_icon_transparent.webp`}
                      alt=""
                      className="h-7 w-7 object-contain"
                    />
                  </span>
                </button>
              );
            })}
          </div>
        </div>
      )}
    </>
  );
}
