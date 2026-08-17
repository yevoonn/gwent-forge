import { useState } from "react";
import { useTranslation } from "react-i18next";
import { Link } from "react-router";
import { LogIn, Menu, UserPlus2, X } from "lucide-react";

import LanguageSwitcher from "./LanguageSwitcher";
import NavLinkItem from "./NavLinkItem";
import MobileMenu from "./MobileMenu";
import AuthModal from "../auth/AuthModal";

import { navigationItems } from "../../data/navigation";

export default function Navbar() {
  const { t } = useTranslation();
  const [isOpen, setIsOpen] = useState(false);
  const [isAuthModalOpen, setIsAuthModalOpen] = useState(false);
  const [authModalMode, setAuthModalMode] = useState("login");

  const openAuthModal = (mode) => {
    setAuthModalMode(mode);
    setIsAuthModalOpen(true);
  };

  return (
    <nav className="relative z-50 text-white">
      <div className="mx-auto flex items-center justify-between px-6 py-4">
        {/* Logo */}
        <Link
          to="/"
          className="
            inline-flex
            items-center
            gap-3
            transition-all
            duration-200
            hover:-translate-y-0.5
            hover:drop-shadow-[0_0_10px_rgba(251,191,36,0.25)]
          "
        >
          <img src="/logo.png" alt="Gwent Forge Logo" className="h-8 w-auto" />

          <span className="hidden font-cinzel text-xl font-semibold sm:inline">
            Gwent <span className="text-amber-400">Forge</span>
          </span>
        </Link>

        {/* Desktop Navigation */}
        <ul className="hidden items-center gap-4 md:flex">
          {navigationItems.map((item) => (
            <li key={item.to}>
              <NavLinkItem to={item.to} icon={item.icon} label={t(item.key)} />
            </li>
          ))}

          {/* Temporarily hidden until authentication UI is ready for production. */}
          <li className="hidden">
            <NavLinkItem
              icon={LogIn}
              label="Login"
              isButton
              onClick={() => openAuthModal("login")}
            />
          </li>

          {/* Temporarily hidden until authentication UI is ready for production. */}
          <li className="hidden">
            <NavLinkItem
              icon={UserPlus2}
              label="Register"
              isButton
              onClick={() => openAuthModal("register")}
            />
          </li>

          <li>
            <LanguageSwitcher />
          </li>
        </ul>

        {/* Mobile Hamburger */}
        <button
          onClick={() => setIsOpen((prev) => !prev)}
          className="
            p-1
            transition-colors
            duration-200
            hover:text-amber-400
            md:hidden
          "
          aria-label="Toggle menu"
        >
          {isOpen ? <X size={28} /> : <Menu size={28} />}
        </button>
      </div>

      {/* Mobile Dropdown */}
      <MobileMenu
        isOpen={isOpen}
        onClose={() => setIsOpen(false)}
        onAuthOpen={openAuthModal}
      />

      <AuthModal
        isOpen={isAuthModalOpen}
        mode={authModalMode}
        onClose={() => setIsAuthModalOpen(false)}
        onModeChange={setAuthModalMode}
      />
    </nav>
  );
}
