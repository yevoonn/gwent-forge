import { AnimatePresence, motion } from "motion/react";
import { useTranslation } from "react-i18next";
import { LogIn, LogOut, UserPlus2 } from "lucide-react";

import LanguageSwitcher from "./LanguageSwitcher";
import NavLinkItem from "./NavLinkItem";

import { navigationItems } from "../../data/navigation";
import { useAuth } from "../../hooks/useAuth";

export default function MobileMenu({ isOpen, onClose, onAuthOpen }) {
  const { t } = useTranslation();
  const { isAuthenticated, isInitializing, logout } = useAuth();

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
          className="
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
            shadow-2xl
            md:hidden
          "
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

            {!isInitializing && (
              <>
                {!isAuthenticated ? (
                  <>
                    <NavLinkItem
                      icon={LogIn}
                      label={t("navigation.login")}
                      mobile
                      isButton
                      onClick={() => {
                        onClose();
                        onAuthOpen("login");
                      }}
                    />

                    <NavLinkItem
                      icon={UserPlus2}
                      label={t("navigation.register")}
                      mobile
                      isButton
                      onClick={() => {
                        onClose();
                        onAuthOpen("register");
                      }}
                    />
                  </>
                ) : (
                  <NavLinkItem
                    icon={LogOut}
                    label={t("navigation.logout")}
                    mobile
                    isButton
                    onClick={async () => {
                      await logout();
                      onClose();
                    }}
                  />
                )}
              </>
            )}
          </div>

          <div className="border-t border-slate-700 p-3">
            <LanguageSwitcher fullWidth />
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
