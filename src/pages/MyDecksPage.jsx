import { useEffect, useState } from "react";
import { Link } from "react-router";
import { motion } from "motion/react";
import { Layers3, TriangleAlert } from "lucide-react";
import { useTranslation } from "react-i18next";
import { fetchUserDecks } from "../api/userDecks";
import { useAuth } from "../hooks/useAuth";
import useCurrentLanguage from "../hooks/useCurrentLanguage";
import { getFactionStyle } from "../data/factions";
import { getApiErrorMessage } from "../utils/apiErrorMessageHelper";
import LoadingSpinner from "../components/ui/LoadingSpinner";
import ErrorState from "../components/ui/ErrorState";

const MotionLink = motion.create(Link);

export default function MyDecksPage() {
  const { t } = useTranslation();
  const language = useCurrentLanguage();
  const { isAuthenticated, authenticatedFetch } = useAuth();

  const [decks, setDecks] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (!isAuthenticated) return;

    let cancelled = false;

    const load = async () => {
      try {
        const data = await authenticatedFetch((token) =>
          fetchUserDecks({ accessToken: token, lang: language }),
        );

        if (!cancelled) {
          setError(null);
          setDecks(data);
        }
      } catch (err) {
        console.error(err);
        if (!cancelled) setError(err);
      }
    };

    load();

    return () => {
      cancelled = true;
    };
  }, [authenticatedFetch, isAuthenticated, language]);

  if (error) {
    return (
      <ErrorState icon={TriangleAlert} title={getApiErrorMessage(error, t)} />
    );
  }

  if (!decks) return <LoadingSpinner />;

  if (decks.length === 0) {
    return (
      <ErrorState
        icon={Layers3}
        title={t("my_decks.empty_title")}
        description={t("my_decks.empty_description")}
      />
    );
  }

  return (
    <div className="mx-auto w-full max-w-screen-2xl px-6 py-12 text-white">
      <motion.header
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
        className="mb-10 text-center"
      >
        <h1 className="font-cinzel text-4xl font-bold tracking-tight md:text-5xl">
          {t("my_decks.title")}
        </h1>
        <p className="mt-3 text-slate-400">{t("my_decks.subtitle")}</p>
      </motion.header>

      <div className="grid auto-rows-fr gap-6 md:grid-cols-2 xl:grid-cols-3">
        {decks.map((deck, index) => {
          const factionCode = deck.deck.code.toLowerCase();
          const style = getFactionStyle(factionCode);

          return (
            <MotionLink
              key={deck.id}
              to={`/decks/${deck.id}`}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.4, delay: Math.min(index * 0.05, 0.4) }}
              whileHover={{ y: -4 }}
              className={`group flex h-full flex-col rounded-2xl border p-6 shadow-lg shadow-black/20 backdrop-blur-sm transition-[border-color,box-shadow] duration-200 hover:shadow-xl ${style.tile}`}
            >
              <div className="mb-4 flex items-center gap-3">
                <div
                  className={`inline-flex rounded-xl p-3 transition-transform group-hover:scale-105 ${style.icon}`}
                >
                  <Layers3 size={24} />
                </div>

                <span
                  className={`text-sm font-bold uppercase tracking-widest ${style.label}`}
                >
                  {t(`factions.${factionCode}`)}
                </span>
              </div>

              <h2 className="truncate font-cinzel text-xl font-semibold text-amber-400">
                {deck.name}
              </h2>

              {deck.description && (
                <p className="mt-3 line-clamp-3 min-h-[4.875rem] leading-relaxed text-white">
                  {deck.description}
                </p>
              )}
            </MotionLink>
          );
        })}
      </div>
    </div>
  );
}
