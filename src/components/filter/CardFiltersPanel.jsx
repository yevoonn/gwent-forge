import { AnimatePresence, motion } from "motion/react";
import { X } from "lucide-react";
import CardFiltersContent from "./CardFiltersContent";

const closeButtonClasses = `
  rounded-xl
  p-2
  text-slate-400
  transition-colors
  duration-200
  hover:bg-slate-800
  hover:text-white
  active:scale-95
  cursor-pointer
`;

const scrollAreaClasses =
  "overflow-y-auto [scrollbar-width:thin] [scrollbar-color:theme(colors.slate.700)_transparent]";

const AccentLine = () => (
  <div className="pointer-events-none absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-amber-400/50 to-transparent" />
);

export default function CardFiltersPanel({
  filters,
  isOpen,
  onClose,
  sortField,
  setSortField,
  sortDirection,
  setSortDirection,
  cardType,
  setCardType,
  cardRange,
  setCardRange,
  showOnlySelected,
  setShowOnlySelected,
  hasSelectedCards,
}) {
  const content = (
    <CardFiltersContent
      filters={filters}
      sortField={sortField}
      setSortField={setSortField}
      sortDirection={sortDirection}
      setSortDirection={setSortDirection}
      cardType={cardType}
      setCardType={setCardType}
      cardRange={cardRange}
      setCardRange={setCardRange}
      showOnlySelected={showOnlySelected}
      setShowOnlySelected={setShowOnlySelected}
      hasSelectedCards={hasSelectedCards}
    />
  );

  return (
    <AnimatePresence>
      {isOpen && (
        <>
          {/* BACKDROP */}
          <motion.div
            className="fixed inset-0 z-40 bg-black/70"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
          />

          {/* DRAWER FOR MOBILE */}
          <motion.div
            className="
              fixed
              bottom-0
              left-0
              right-0
              z-50
              flex
              max-h-[85dvh]
              flex-col
              overflow-hidden
              rounded-t-3xl
              border-t
              border-slate-700/80
              bg-gradient-to-b
              from-slate-900
              to-slate-950
              shadow-[0_-12px_40px_-12px_rgba(0,0,0,0.65)]
              ring-1
              ring-white/5
              md:hidden
            "
            style={{ willChange: "transform" }}
            initial={{ y: "100%" }}
            animate={{ y: 0 }}
            exit={{ y: "100%" }}
            transition={{ duration: 0.15 }}
          >
            <AccentLine />

            <div className="relative flex h-11 shrink-0 items-center justify-center">
              <div className="h-1.5 w-12 rounded-full bg-slate-600/80" />

              <button
                type="button"
                onClick={onClose}
                aria-label="Close"
                className={`absolute right-4 top-1/2 -translate-y-1/2 ${closeButtonClasses}`}
              >
                <X size={22} />
              </button>
            </div>

            <div
              className={`${scrollAreaClasses} px-6 pt-2 pb-[calc(env(safe-area-inset-bottom)+2rem)]`}
            >
              {content}
            </div>
          </motion.div>

          {/* MODAL FOR DESKTOP */}
          <motion.div
            className="
              fixed
              left-1/2
              top-1/2
              z-50
              hidden
              max-h-[90dvh]
              w-full
              max-w-md
              -translate-x-1/2
              -translate-y-1/2
              flex-col
              overflow-hidden
              rounded-3xl
              border
              border-slate-700/80
              bg-gradient-to-b
              from-slate-900
              to-slate-950
              shadow-[0_24px_60px_-12px_rgba(0,0,0,0.75)]
              ring-1
              ring-white/5
              md:flex
            "
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0, scale: 0.95 }}
            transition={{ duration: 0.2 }}
          >
            <AccentLine />

            <button
              type="button"
              onClick={onClose}
              aria-label="Close"
              className={`absolute right-4 top-4 z-10 ${closeButtonClasses}`}
            >
              <X size={22} />
            </button>

            <div className={`${scrollAreaClasses} px-6 pt-6 pb-8`}>
              {content}
            </div>
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
