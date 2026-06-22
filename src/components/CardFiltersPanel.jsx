import { AnimatePresence, motion } from "motion/react";
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
  { value: "", label: "All" },
  { value: "agile", label: "Agile" },
  { value: "close", label: "Close" },
  { value: "ranged", label: "Ranged" },
  { value: "siege", label: "Siege" },
];

export default function Filters({
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
              <label className="mb-2 block text-sm text-slate-400">
                Direction
              </label>

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

              <div className="flex rounded-xl border border-slate-700 bg-slate-800 p-1 overflow-x-auto">
                {cardRanges.map((range) => (
                  <button
                    key={range.value}
                    type="button"
                    onClick={() => setCardRange(range.value)}
                    className={`
                      min-w-[80px]
                      rounded-lg
                      px-3
                      py-2
                      text-sm
                      transition-all
                      ${
                        cardRange === range.value
                          ? "bg-amber-500 text-black"
                          : "text-slate-300 hover:text-white"
                      }
                    `}
                  >
                    {range.label}
                  </button>
                ))}
              </div>
            </div>
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
