import { useLayoutEffect, useState } from "react";
import { createPortal } from "react-dom";
import { AnimatePresence, motion } from "motion/react";
import {
  getTooltipPosition,
  getTooltipTransform,
} from "../../utils/portalTooltipHelper";

export default function PortalTooltip({
  targetRef,
  visible,
  title,
  description,
  width = "w-60",
  descriptionSize = "text-sm",
  placement = "right",
}) {
  const [position, setPosition] = useState({
    top: 0,
    left: 0,
  });

  useLayoutEffect(() => {
    if (!visible || !targetRef?.current) {
      return;
    }

    const updatePosition = () => {
      const rect = targetRef.current.getBoundingClientRect();

      setPosition(getTooltipPosition(rect, placement));
    };

    updatePosition();

    window.addEventListener("resize", updatePosition);
    window.addEventListener("scroll", updatePosition, true);

    return () => {
      window.removeEventListener("resize", updatePosition);
      window.removeEventListener("scroll", updatePosition, true);
    };
  }, [visible, targetRef, placement]);

  return createPortal(
    <AnimatePresence>
      {visible && (
        <div
          style={{
            position: "fixed",
            top: position.top,
            left: position.left,
            transform: getTooltipTransform(placement),
            zIndex: 100,
          }}
          className="hidden md:block pointer-events-none"
        >
          <motion.div
            initial={{
              opacity: 0,
              x: -10,
              scale: 0.95,
            }}
            animate={{
              opacity: 1,
              x: 0,
              scale: 1,
            }}
            exit={{
              opacity: 0,
              x: -10,
              scale: 0.95,
            }}
            transition={{
              duration: 0.18,
              ease: "easeOut",
            }}
            className={`
              ${width}
              rounded-xl
              border
              border-slate-700
              bg-slate-900/90
              p-3
              text-center
              shadow-xl
              shadow-black/40
            `}
          >
            <h4 className="font-cinzel font-bold text-amber-300">{title}</h4>

            {description && (
              <p
                className={`
            mt-1
            leading-relaxed
            text-slate-300
            ${descriptionSize}
          `}
              >
                {description}
              </p>
            )}
          </motion.div>
        </div>
      )}
    </AnimatePresence>,
    document.body,
  );
}
