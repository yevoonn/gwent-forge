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
        <div
          className="
            absolute
            left-0
            right-0
            top-full
            z-40
            overflow-hidden
            md:hidden
          "
        >
          <motion.div
            initial={{ y: "-100%" }}
            animate={{ y: 0 }}
            exit={{ y: "-100%" }}
            transition={{ duration: 0.15 }}
            style={{ willChange: "transform" }}
            className="
              border-t
              border-slate-700
              bg-slate-950/95
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
        </div>
      )}
    </AnimatePresence>
  );
}
