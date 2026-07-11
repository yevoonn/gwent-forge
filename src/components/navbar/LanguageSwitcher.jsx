import { Languages } from "lucide-react";
import { motion } from "motion/react";
import { useTranslation } from "react-i18next";

const languages = [
  { code: "en", label: "EN" },
  { code: "pl", label: "PL" },
  { code: "it", label: "IT" },
];

export default function LanguageSwitcher({ fullWidth = false }) {
  const { i18n } = useTranslation();

  return (
    <div
      className={`
        inline-flex
        items-center
        gap-2
        rounded-xl
        border
        border-slate-700
        bg-slate-900/70
        px-3
        py-1.5
        backdrop-blur-sm
        ${fullWidth ? "w-full justify-between" : ""}
      `}
    >
      <Languages size={17} className="text-slate-400" />

      <div
        className={`
          flex
          items-center
          ${fullWidth ? "flex-1 justify-evenly" : "gap-1"}
        `}
      >
        {languages.map((language) => {
          const active = i18n.resolvedLanguage === language.code;

          return (
            <motion.button
              key={language.code}
              onClick={() => i18n.changeLanguage(language.code)}
              whileTap={{ scale: 0.92 }}
              className={`
                relative
                rounded-lg
                px-2
                py-1
                font-cinzel
                text-sm
                transition-all
                duration-200
                cursor-pointer
                ${
                  active
                    ? "text-amber-300 bg-slate-800 shadow-lg shadow-amber-500/15"
                    : "text-white hover:text-amber-300 hover:bg-slate-800/70"
                }
              `}
            >
              {language.label}

              {active && (
                <motion.div
                  layoutId="language-indicator"
                  className="
                    absolute
                    left-2
                    right-2
                    -bottom-0.5
                    h-0.5
                    rounded-full
                    bg-amber-400
                  "
                  transition={{
                    type: "spring",
                    stiffness: 450,
                    damping: 35,
                  }}
                />
              )}
            </motion.button>
          );
        })}
      </div>
    </div>
  );
}
