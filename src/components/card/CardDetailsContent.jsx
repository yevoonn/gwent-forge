import { useTranslation } from "react-i18next";

export default function CardDetailsContent({
  name,
  power,
  image,
  type,
  ability,
  range,
}) {
  const { t } = useTranslation();

  return (
    <div className="space-y-5">
      <img
        src={image}
        alt={name}
        className="mx-auto w-44 rounded-xl shadow-xl"
      />

      <div className="text-center">
        <h2 className="font-cinzel text-2xl font-bold text-amber-300">
          {name}
        </h2>

        {power !== null && (
          <p className="mt-1 text-slate-300">
            {t("card_details.power")} {power}
          </p>
        )}
      </div>

      {ability && (
        <section>
          <h3 className="mb-2 font-semibold text-amber-400">
            {t("card_details.ability")}
          </h3>

          {type === "LEADER" ? (
            <p className="font-medium text-white">{ability.description}</p>
          ) : (
            <>
              <p className="font-medium text-white">{ability.name}</p>
              <p className="mt-1 text-sm text-slate-300">
                {ability.description}
              </p>
            </>
          )}
        </section>
      )}

      {range && type !== "SPECIAL" && (
        <section>
          <h3 className="mb-2 font-semibold text-amber-400">
            {t("card_details.range")}
          </h3>

          <p className="font-medium text-white">{range.name}</p>

          <p className="mt-1 text-sm text-slate-300">{range.description}</p>
        </section>
      )}
    </div>
  );
}
