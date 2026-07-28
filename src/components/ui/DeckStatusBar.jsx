import { useRef, useState } from "react";
import { AnimatePresence, motion } from "motion/react";
import { useTranslation } from "react-i18next";
import { Swords } from "lucide-react";
import { isWarning } from "../../utils/deckStatusHelper";
import PortalTooltip from "./PortalTooltip";

export default function DeckStatusBar({
  icon: Icon = Swords,
  value,
  limit,
  mode,
  tooltipTitleKey,
  tooltipDescriptionKey,
}) {
  const { t } = useTranslation();

  const tooltipRef = useRef(null);
  const [isTooltipVisible, setIsTooltipVisible] = useState(false);

  const warning = isWarning({ value, limit, mode });

  return (
    <AnimatePresence>
      <>
        <motion.div
          ref={tooltipRef}
          onMouseEnter={() => setIsTooltipVisible(true)}
          onMouseLeave={() => setIsTooltipVisible(false)}
          initial={{
            opacity: 0,
            scale: 0.5,
            y: 120,
            filter: "blur(8px)",
          }}
          animate={{
            opacity: 1,
            scale: 1,
            y: 0,
            filter: "blur(0px)",
          }}
          exit={{
            opacity: 0,
            scale: 0.5,
            y: 120,
            filter: "blur(8px)",
          }}
          transition={{
            duration: 0.5,
            ease: [0.22, 1, 0.36, 1],
          }}
        >
          <div
            className={`
              flex
              h-12
              items-center
              gap-3
              rounded-xl
              border
              px-4
              text-white
              backdrop-blur-sm
              shadow-lg
              cursor-default
              ${
                warning
                  ? "border-red-500/60 bg-red-950/50 shadow-red-500/15 hover:bg-red-950/30 hover:border-red-400"
                  : "border-slate-700 bg-slate-900/70 shadow-amber-500/10 hover:bg-slate-800 hover:border-amber-400"
              }
            `}
          >
            {/* ICON */}
            <div
              className={`
                flex
                items-center
                justify-center
                ${warning ? "text-red-400" : "text-amber-400"}
              `}
            >
              <Icon size={20} />
            </div>
            {/* VALUE */}
            <div className="grid grid-cols-[2rem_auto] items-baseline gap-2">
              <motion.span
                key={value}
                initial={{
                  scale: 0.88,
                  y: 2,
                  opacity: 0.7,
                  filter: "drop-shadow(0 0 0px rgba(251,191,36,0))",
                }}
                animate={{
                  scale: [0.88, 1.18, 1],
                  y: [2, -2, 0],
                  opacity: 1,
                  filter: warning
                    ? [
                        "drop-shadow(0 0 0px rgba(248,113,113,0))",
                        "drop-shadow(0 0 12px rgba(248,113,113,0.9))",
                        "drop-shadow(0 0 4px rgba(248,113,113,0.35))",
                      ]
                    : [
                        "drop-shadow(0 0 0px rgba(251,191,36,0))",
                        "drop-shadow(0 0 10px rgba(251,191,36,0.9))",
                        "drop-shadow(0 0 3px rgba(251,191,36,0.35))",
                      ],
                }}
                transition={{
                  duration: 0.38,
                  times: [0, 0.45, 1],
                  ease: [0.22, 1, 0.36, 1],
                }}
                className={`
                text-right
                font-cinzel
                text-xl
                font-bold
                tabular-nums
                ${warning ? "text-red-400" : "text-amber-400"}
              `}
              >
                {value}
              </motion.span>

              <span className="text-xs text-slate-400 tabular-nums">
                /{limit}
              </span>
            </div>
          </div>
        </motion.div>

        <PortalTooltip
          targetRef={tooltipRef}
          visible={isTooltipVisible}
          title={t(tooltipTitleKey)}
          description={t(tooltipDescriptionKey)}
          width="w-60"
        />
      </>
    </AnimatePresence>
  );
}
