import { useTranslation } from "react-i18next";
import { Crown, Zap, Rows3, Hash, Swords } from "lucide-react";

const typeConfig = {
  LEADER: {
    icon: Crown,
    accent: "amber",
  },
  SPECIAL: {
    icon: null,
    accent: "slate",
  },
  UNIT: {
    icon: null,
    accent: "slate",
  },
};

const accentClasses = {
  amber: {
    ring: "ring-amber-400/40",
    glow: "shadow-[0_0_28px_-6px_rgba(251,191,36,0.45)]",
    badge: "border-amber-400/50 bg-amber-400/10 text-amber-300",
  },
  slate: {
    ring: "ring-slate-400/40",
    glow: "shadow-[0_0_28px_-6px_rgba(56,189,248,0.45)]",
    badge: "border-slate-400/50 bg-slate-400/10 text-slate-300",
  },
};

export default function CardDetailsContent({
  name,
  power,
  image,
  type,
  ability,
  range,
  code,
}) {
  const { t } = useTranslation();

  const { icon: TypeIcon, accent } = typeConfig[type] ?? typeConfig.UNIT;
  const accentClass = accentClasses[accent];

  return (
    <div className="space-y-6" onContextMenu={(e) => e.preventDefault()}>
      {/* Image */}
      <div className="flex justify-center">
        <div
          className={`overflow-hidden rounded-2xl ring-2 ${accentClass.ring} ${accentClass.glow}`}
        >
          <img src={image} alt={name} className="w-44" />
        </div>
      </div>

      {/* Type + power pills */}
      <div className="flex flex-wrap items-center justify-center gap-2">
        <div
          className={`flex items-center gap-1.5 rounded-full border px-3 py-1 text-xs font-semibold uppercase tracking-wider ${accentClass.badge}`}
        >
          {TypeIcon && <TypeIcon size={13} strokeWidth={2.5} />}
          {t(`card_details.card_type.${type}`, { defaultValue: type })}
        </div>

        {power !== null && (
          <div className="flex items-center gap-1.5 rounded-full border border-amber-400/50 bg-amber-400/10 px-3 py-1 text-xs font-bold text-amber-300">
            <Swords size={13} strokeWidth={2.5} />
            {power}
          </div>
        )}
      </div>

      {/* Name */}
      <h2 className="text-center font-cinzel text-2xl font-bold leading-tight text-amber-300">
        {name}
      </h2>

      {/* Ability */}
      {ability && (
        <section className="rounded-xl border border-slate-800 bg-slate-900/40 p-4">
          <h3 className="mb-2 flex items-center gap-1.5 text-xs font-bold uppercase tracking-wider text-amber-400">
            <Zap size={14} strokeWidth={2.5} />
            {t("card_details.ability")}
          </h3>

          {type === "LEADER" ? (
            <p className="text-base font-medium text-white">
              {ability.description}
            </p>
          ) : (
            <>
              <p className="text-base font-semibold text-white">
                {ability.name}
              </p>
              <p className="mt-1 text-sm leading-relaxed text-slate-300">
                {ability.description}
              </p>
            </>
          )}
        </section>
      )}

      {/* Range */}
      {range && type !== "SPECIAL" && (
        <section className="rounded-xl border border-slate-800 bg-slate-900/40 p-4">
          <h3 className="mb-2 flex items-center gap-1.5 text-xs font-bold uppercase tracking-wider text-amber-400">
            <Rows3 size={14} strokeWidth={2.5} />
            {t("card_details.range")}
          </h3>

          <p className="text-base font-semibold text-white">{range.name}</p>
          <p className="mt-1 text-sm leading-relaxed text-slate-300">
            {range.description}
          </p>
        </section>
      )}

      {/* Code */}
      {code && (
        <section className="flex items-center justify-center gap-1.5 pt-1">
          <Hash size={12} className="text-slate-500" />
          <p className="font-mono text-xs tracking-wide text-slate-500">
            {code.split("_")[0]}
          </p>
        </section>
      )}
    </div>
  );
}
