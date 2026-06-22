import { AnimatePresence, motion } from "motion/react";
import {
  ArrowUp,
  ArrowDown,
  ChevronDown,
  SlidersHorizontal,
  X,
} from "lucide-react";

export default function Filters({
  isOpen,
  onClose,
  sortField,
  setSortField,
  sortDirection,
  setSortDirection,
}) {
  return (
    <AnimatePresence>
      {isOpen && (
        <>
          {/* BACKDROP */}
          <motion.div
            className="fixed inset-0 z-40 bg-black/60 backdrop-blur-sm"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
          />

          {/* DRAWER / MODAL */}
          <motion.div
            className="
              fixed
              z-50
              bottom-0
              left-0
              right-0
              rounded-t-3xl
              border-t
              border-slate-700
              bg-slate-900
              p-6
              shadow-2xl
              md:left-1/2
              md:top-1/2
              md:bottom-auto
              md:right-auto
              md:w-full
              md:max-w-md
              md:-translate-x-1/2
              md:-translate-y-1/2
              md:rounded-3xl
              md:border
              md:border-slate-700
              md:bg-slate-900/95
              md:backdrop-blur-md
            "
            initial={{
              opacity: 0,
              y: 40,
              scale: 0.95,
            }}
            animate={{
              opacity: 1,
              y: 0,
              scale: 1,
            }}
            exit={{
              opacity: 0,
              y: 40,
              scale: 0.95,
            }}
            transition={{
              duration: 0.25,
              ease: "easeInOut",
            }}
          >
            {/* Mobile drawer handle */}
            <div className="mb-4 flex justify-center md:hidden">
              <div className="h-1.5 w-12 rounded-full bg-slate-600" />
            </div>

            {/* Header */}
            <div className="mb-6 flex items-center justify-between">
              <div className="flex items-center gap-2">
                <SlidersHorizontal size={20} />
                <h2 className="font-cinzel text-lg text-white">Filters</h2>
              </div>

              <button
                onClick={onClose}
                className="text-slate-400 hover:text-white"
              >
                <X size={20} />
              </button>
            </div>

            {/* SORT FIELD */}
            <div className="mb-4">
              <label className="mb-2 block text-sm text-slate-400">
                Sort by
              </label>

              <div className="relative">
                <select
                  value={sortField}
                  onChange={(e) => setSortField(e.target.value)}
                  className="
                    w-full
                    appearance-none
                    rounded-xl
                    border
                    border-slate-700
                    bg-slate-800
                    px-4
                    py-3
                    pr-10
                    text-white
                    focus:border-amber-400
                    focus:outline-none
                  "
                >
                  <option value="name">Name</option>
                  <option value="power">Power</option>
                  <option value="code">Code</option>
                </select>

                <ChevronDown
                  size={18}
                  className="
                    pointer-events-none
                    absolute
                    right-3
                    top-1/2
                    -translate-y-1/2
                    text-amber-400
                  "
                />
              </div>
            </div>

            {/* SORT DIRECTION */}
            <div>
              <label className="mb-2 block text-sm text-slate-400">
                Direction
              </label>

              <button
                type="button"
                onClick={() =>
                  setSortDirection((prev) => (prev === "asc" ? "desc" : "asc"))
                }
                className="
                  flex
                  w-full
                  items-center
                  justify-center
                  gap-2
                  rounded-xl
                  border
                  border-slate-700
                  bg-slate-800
                  px-4
                  py-3
                  text-white
                "
              >
                {sortDirection === "asc" ? (
                  <>
                    <ArrowUp size={18} />
                    Ascending
                  </>
                ) : (
                  <>
                    <ArrowDown size={18} />
                    Descending
                  </>
                )}
              </button>
            </div>
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
