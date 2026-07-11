import { AnimatePresence, motion } from "motion/react";
import { useTranslation } from "react-i18next";

import LanguageSwitcher from "./LanguageSwitcher";
import NavLinkItem from "./NavLinkItem";

import { navigationItems } from "../../data/navigation";

export default function MobileMenu({ isOpen, onClose }) {
  const { t } = useTranslation();

  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          initial={{
            opacity: 0,
            y: -15,
            filter: "blur(8px)",
          }}
          animate={{
            opacity: 1,
            y: 0,
            filter: "blur(0px)",
          }}
          exit={{
            opacity: 0,
            y: -15,
            filter: "blur(8px)",
          }}
          transition={{
            duration: 0.25,
            ease: "easeInOut",
          }}
          className={`
            absolute
            right-6
            top-full
            mt-2
            w-64
            overflow-hidden
            rounded-2xl
            border
            border-slate-700
            bg-slate-900/95
            backdrop-blur-md
            shadow-2xl
            md:hidden
          `}
        >
          <div className="space-y-2 p-3">
            {navigationItems.map((item) => (
              <NavLinkItem
                key={item.to}
                to={item.to}
                icon={item.icon}
                label={t(item.key)}
                mobile
                onClick={onClose}
              />
            ))}
          </div>

          <div className="border-t border-slate-700 p-3">
            <LanguageSwitcher fullWidth />
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
