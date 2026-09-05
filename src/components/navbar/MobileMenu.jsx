import { AnimatePresence, motion } from "motion/react";
import { useTranslation } from "react-i18next";
import { Link } from "react-router";
import { LogIn, LogOut, User, UserPlus2, X } from "lucide-react";

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
          initial={{ x: "100%" }}
          animate={{ x: 0 }}
          exit={{ x: "100%" }}
          transition={{ duration: 0.2, ease: "easeInOut" }}
          style={{ willChange: "transform" }}
          className="
            fixed
            inset-0
            z-55
            flex
            flex-col
            overflow-y-auto
            overscroll-contain
            bg-slate-950
            md:hidden
          "
        >
          {/* Mobile Menu Header */}
          <div
            className="
              flex
              h-[73px]
              shrink-0
              items-center
              justify-between
              border-b
              border-slate-700
              px-6
            "
          >
            <Link
              to="/"
              onClick={onClose}
              className="
                inline-flex
                items-center
                gap-3
                transition-all
                duration-200
              "
            >
              <img
                src="/logo.png"
                alt="Gwent Forge Logo"
                className="h-8 w-auto"
              />

              <span className="font-cinzel text-xl font-semibold">
                Gwent <span className="text-amber-400">Forge</span>
              </span>
            </Link>

            <button
              type="button"
              onClick={onClose}
              className="
                cursor-pointer
                rounded-lg
                p-1
                text-white
                transition-colors
                duration-200
                hover:text-amber-400
              "
              aria-label="Close menu"
            >
              <X size={28} />
            </button>
          </div>

          {/* Navigation */}
          <div className="flex-1 p-6">
            <div className="space-y-2">
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
                    <>
                      <NavLinkItem
                        to="/profile"
                        icon={User}
                        label={t("navigation.profile")}
                        mobile
                        onClick={onClose}
                      />

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
                    </>
                  )}
                </>
              )}
            </div>
          </div>

          {/* Language Switcher */}
          <div className="shrink-0 border-t border-slate-700 p-6">
            <LanguageSwitcher fullWidth />
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
