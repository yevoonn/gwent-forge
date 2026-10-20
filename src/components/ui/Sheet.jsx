import { createPortal } from "react-dom";
import { AnimatePresence, motion, useDragControls } from "motion/react";
import { X } from "lucide-react";

const layers = {
  default: { backdrop: "z-40", panel: "z-50" },
  top: { backdrop: "z-[90]", panel: "z-[91]" },
};

const defaultTransition = { duration: 0.15 };

const panelClasses = `
  fixed
  inset-x-0
  bottom-0
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
`;

const scrollClasses =
  "overflow-y-auto px-6 pt-2 pb-[calc(env(safe-area-inset-bottom)+2rem)] [scrollbar-width:thin] [scrollbar-color:theme(colors.slate.700)_transparent]";

const closeButtonClasses = `
  absolute
  right-4
  top-1/2
  -translate-y-1/2
  cursor-pointer
  rounded-xl
  p-2
  text-slate-400
  transition-colors
  duration-200
  hover:bg-slate-800
  hover:text-white
  active:scale-95
`;

export default function Sheet({
  open,
  onClose,
  title,
  children,
  layer = "default",
  draggable = true,
  transition = defaultTransition,
  closeLabel = "Close",
}) {
  const dragControls = useDragControls();
  const z = layers[layer];

  return createPortal(
    <AnimatePresence>
      {open && (
        <>
          {/* BACKDROP */}
          <motion.div
            className={`fixed inset-0 bg-black/70 ${z.backdrop}`}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 0.18 }}
            onClick={onClose}
          />

          {/* BOTTOM SHEET */}
          <motion.div
            className={`${panelClasses} ${z.panel}`}
            style={{ willChange: "transform", contain: "layout paint style" }}
            drag={draggable ? "y" : false}
            dragControls={dragControls}
            dragListener={false}
            dragConstraints={{ top: 0, bottom: 0 }}
            dragElastic={{ top: 0, bottom: 0.45 }}
            onDragEnd={(_, info) => {
              if (info.offset.y > 120 || info.velocity.y > 650) {
                onClose();
              }
            }}
            initial={{ y: "100%" }}
            animate={{ y: 0 }}
            exit={{ y: "100%" }}
            transition={transition}
          >
            {/* Accent line */}
            <div className="pointer-events-none absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-amber-400/50 to-transparent" />

            {/* Handle area: drag starts only from here */}
            <div
              className={`relative flex h-11 shrink-0 items-center justify-center ${
                draggable ? "touch-none" : ""
              }`}
              onPointerDown={(e) => draggable && dragControls.start(e)}
            >
              <div className="h-1.5 w-12 rounded-full bg-slate-600/80" />

              <button
                type="button"
                onClick={onClose}
                onPointerDown={(e) => e.stopPropagation()}
                aria-label={closeLabel}
                className={closeButtonClasses}
              >
                <X size={22} />
              </button>
            </div>

            <div className={scrollClasses}>
              {title && (
                <h2 className="mb-4 text-center font-cinzel text-2xl font-bold text-amber-400">
                  {title}
                </h2>
              )}
              {children}
            </div>
          </motion.div>
        </>
      )}
    </AnimatePresence>,
    document.body,
  );
}
