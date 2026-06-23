import { AnimatePresence, motion } from "motion/react";
import CardFiltersContent from "./CardFiltersContent";

export default function CardFiltersPanel({
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
}) {
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
              rounded-t-3xl
              border-t
              border-slate-700
              bg-slate-900
              p-6
              shadow-2xl
              md:hidden
            "
            initial={{ y: "100%" }}
            animate={{ y: 0 }}
            exit={{ y: "100%" }}
            transition={{
              type: "spring",
              damping: 25,
              stiffness: 250,
            }}
          >
            <CardFiltersContent
              onClose={onClose}
              sortField={sortField}
              setSortField={setSortField}
              sortDirection={sortDirection}
              setSortDirection={setSortDirection}
              cardType={cardType}
              setCardType={setCardType}
              cardRange={cardRange}
              setCardRange={setCardRange}
            />
          </motion.div>

          {/* MODAL FOR DESKTOP */}
          <motion.div
            className="
              hidden
              md:block
              fixed
              z-50
              left-1/2
              top-1/2
              w-full
              max-w-md
              -translate-x-1/2
              -translate-y-1/2
              rounded-3xl
              border
              border-slate-700
              bg-slate-900/95
              p-6
              shadow-2xl
              backdrop-blur-md
            "
            initial={{
              opacity: 0,
              scale: 0.95,
            }}
            animate={{
              opacity: 1,
              scale: 1,
            }}
            exit={{
              opacity: 0,
              scale: 0.95,
            }}
            transition={{
              duration: 0.2,
            }}
          >
            <CardFiltersContent
              onClose={onClose}
              sortField={sortField}
              setSortField={setSortField}
              sortDirection={sortDirection}
              setSortDirection={setSortDirection}
              cardType={cardType}
              setCardType={setCardType}
              cardRange={cardRange}
              setCardRange={setCardRange}
            />
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
