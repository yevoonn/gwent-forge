import { motion } from "motion/react";
import { ChevronLeft, ChevronRight, Home, Save } from "lucide-react";
import { Link } from "react-router";
import { useTranslation } from "react-i18next";
import CardSearchInput from "../filter/CardSearchInput";
import CardFiltersContent from "../filter/CardFiltersContent";
import DeckStatusBar from "../ui/DeckStatusBar";

const PANEL_WIDTH = 320; // px

function SectionTitle({ children }) {
  return (
    <h3 className="mb-3 font-cinzel text-sm font-bold uppercase tracking-widest text-amber-400">
      {children}
    </h3>
  );
}

function Divider() {
  return (
    <div className="h-px bg-gradient-to-r from-transparent via-slate-700 to-transparent" />
  );
}

export default function CardsSidePanel({
  expanded,
  onToggle,
  statuses,
  hasWarnings,
  search,
  setSearch,
  filterProps,
  canSaveDeck,
  onSaveDeck,
  saveLabel,
}) {
  const { t } = useTranslation();

  return (
    <div className="sticky top-18 z-40 flex h-[calc(100dvh-4.5rem)] shrink-0 items-center">
      {/* PANEL */}
      <motion.div
        initial={false}
        animate={{ width: expanded ? PANEL_WIDTH : 0 }}
        transition={{ duration: 0.28, ease: [0.22, 1, 0.36, 1] }}
        className="overflow-hidden"
        inert={!expanded}
      >
        <div
          style={{ width: PANEL_WIDTH }}
          className="
            no-scrollbar
            flex
            max-h-[calc(100dvh-2rem)]
            flex-col
            gap-5
            overflow-y-auto
            rounded-2xl
            border
            border-slate-700
            bg-slate-950/90
            p-4
            shadow-2xl
            shadow-black/40
          "
        >
          {/* HOME */}
          <Link
            to="/"
            className="
              group
              flex
              h-12
              shrink-0
              items-center
              gap-3
              rounded-xl
              border
              border-slate-700
              bg-slate-900/70
              py-1.5
              pl-1.5
              pr-4
              shadow-lg
              shadow-black/30
              transition-all
              duration-200
              hover:border-amber-400
              hover:bg-slate-800
              hover:shadow-amber-500/20
            "
          >
            <span
              className="
                flex
                h-9
                w-9
                items-center
                justify-center
                rounded-lg
                bg-amber-400/10
                text-amber-400
                transition-colors
                duration-200
                group-hover:bg-amber-400
                group-hover:text-slate-950
              "
            >
              <Home size={18} />
            </span>

            <span className="text-sm font-bold text-slate-200 transition-colors group-hover:text-amber-300">
              {t("navigation.home")}
            </span>
          </Link>

          <Divider />

          {/* SEARCH + FILTERS */}
          <section>
            <SectionTitle>{t("filters.title")}</SectionTitle>

            <div className="mb-4">
              <CardSearchInput search={search} setSearch={setSearch} />
            </div>

            <CardFiltersContent {...filterProps} />
          </section>

          <Divider />

          {/* DECK STATUS */}
          <section>
            <SectionTitle>{t("deck_status.title")}</SectionTitle>

            <div className="flex flex-col gap-3">
              {statuses.map((status) => (
                <DeckStatusBar key={status.id} {...status} fullWidth />
              ))}
            </div>

            {canSaveDeck && (
              <button
                type="button"
                onClick={onSaveDeck}
                className="
                  mt-4
                  flex
                  h-12
                  w-full
                  cursor-pointer
                  items-center
                  justify-center
                  gap-2
                  rounded-xl
                  bg-amber-400
                  font-bold
                  text-black
                  transition-all
                  duration-200
                  hover:bg-amber-300
                  active:scale-[0.98]
                "
              >
                <Save size={18} />
                {saveLabel}
              </button>
            )}
          </section>
        </div>
      </motion.div>

      {/* HANDLE */}
      <motion.button
        type="button"
        onClick={onToggle}
        aria-label="Toggle side panel"
        aria-expanded={expanded}
        whileHover={{ scale: 1.06 }}
        whileTap={{ scale: 0.94 }}
        className={`
          relative
          ml-2
          flex
          h-14
          w-7
          shrink-0
          cursor-pointer
          items-center
          justify-center
          rounded-xl
          border
          shadow-lg
          transition-colors
          ${
            hasWarnings
              ? "border-red-500/60 bg-red-950/60 text-red-400 shadow-red-500/15 hover:border-red-400"
              : "border-slate-700 bg-slate-900/80 text-amber-400 shadow-amber-500/10 hover:border-amber-400 hover:text-amber-300"
          }
        `}
      >
        {expanded ? <ChevronLeft size={18} /> : <ChevronRight size={18} />}

        {hasWarnings && !expanded && (
          <motion.span
            animate={{ scale: [1, 1.25, 1], opacity: [1, 0.65, 1] }}
            transition={{ duration: 1.6, repeat: Infinity, ease: "easeInOut" }}
            className="absolute -right-1 -top-1 h-3 w-3 rounded-full bg-red-500"
          />
        )}
      </motion.button>
    </div>
  );
}
