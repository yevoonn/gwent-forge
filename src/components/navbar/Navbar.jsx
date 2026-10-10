import { useEffect, useState } from "react";
import { useTranslation } from "react-i18next";
import { Link, useLocation, useNavigate } from "react-router";
import { LogIn, LogOut, Menu, User, UserPlus2, X } from "lucide-react";

import LanguageSwitcher from "./LanguageSwitcher";
import NavLinkItem from "./NavLinkItem";
import MobileMenu from "./MobileMenu";
import AuthModal from "../auth/AuthModal";

import { useAuth } from "../../hooks/useAuth";

export default function Navbar() {
  const { t } = useTranslation();
  const location = useLocation();
  const navigate = useNavigate();
  const {
    isAuthenticated,
    isInitializing,
    logout,
    authModalRequest,
    clearAuthModalRequest,
    clearAuthModalSuccessMessage,
  } = useAuth();

  const [mobileMenuState, setMobileMenuState] = useState({
    isOpen: false,
    locationKey: null,
  });

  const [isAuthModalOpen, setIsAuthModalOpen] = useState(false);

  const [authModalMode, setAuthModalMode] = useState("login");

  const [googleAuthError, setGoogleAuthError] = useState(() => {
    const searchParams = new URLSearchParams(location.search);

    return searchParams.get("googleAuthError") === "account_not_linked"
      ? "account_not_linked"
      : "";
  });

  const openAuthModal = (mode) => {
    setAuthModalMode(mode);
    setIsAuthModalOpen(true);
  };

  const isMobileMenuOpen =
    mobileMenuState.isOpen && mobileMenuState.locationKey === location.key;

  const isRequestedAuthModalOpen = Boolean(authModalRequest);

  const effectiveAuthModalMode = googleAuthError
    ? "login"
    : (authModalRequest?.mode ?? authModalMode);

  const effectiveAuthSuccessMessage = authModalRequest?.successMessage ?? "";

  useEffect(() => {
    const searchParams = new URLSearchParams(location.search);

    if (searchParams.get("googleAuthError") !== "account_not_linked") {
      return;
    }

    // Remove the OAuth error from the URL after handling it.
    searchParams.delete("googleAuthError");

    navigate(
      {
        pathname: location.pathname,
        search: searchParams.toString() ? `?${searchParams.toString()}` : "",
        hash: location.hash,
      },
      { replace: true },
    );
  }, [location.hash, location.pathname, location.search, navigate]);

  return (
    <nav className="relative text-white">
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
          {!isInitializing && (
            <>
              {!isAuthenticated ? (
                <>
                  <li>
                    <NavLinkItem
                      icon={LogIn}
                      label={t("navigation.login")}
                      isButton
                      onClick={() => openAuthModal("login")}
                    />
                  </li>

                  <li>
                    <NavLinkItem
                      icon={UserPlus2}
                      label={t("navigation.register")}
                      isButton
                      onClick={() => openAuthModal("register")}
                    />
                  </li>
                </>
              ) : (
                <>
                  <li>
                    <NavLinkItem
                      to="/profile"
                      icon={User}
                      label={t("navigation.profile")}
                    />
                  </li>

                  <li>
                    <NavLinkItem
                      icon={LogOut}
                      label={t("navigation.logout")}
                      isButton
                      onClick={logout}
                    />
                  </li>
                </>
              )}
            </>
          )}

          <li>
            <LanguageSwitcher />
          </li>
        </ul>

        {/* Mobile Hamburger */}
        <button
          onClick={() => {
            setMobileMenuState({
              isOpen: !isMobileMenuOpen,
              locationKey: location.key,
            });
          }}
          className="
            p-1
            transition-colors
            duration-200
            hover:text-amber-400
            md:hidden
          "
          aria-label="Toggle menu"
        >
          {isMobileMenuOpen ? <X size={28} /> : <Menu size={28} />}
        </button>
      </div>

      {/* Mobile Dropdown */}
      <MobileMenu
        isOpen={isMobileMenuOpen}
        onClose={() =>
          setMobileMenuState((prev) => ({
            ...prev,
            isOpen: false,
          }))
        }
        onAuthOpen={openAuthModal}
      />

      <AuthModal
        isOpen={
          isAuthModalOpen ||
          isRequestedAuthModalOpen ||
          Boolean(googleAuthError)
        }
        mode={effectiveAuthModalMode}
        infoMessage={
          googleAuthError === "account_not_linked"
            ? t("auth.login_form.google.account_not_linked")
            : ""
        }
        onClose={() => {
          setIsAuthModalOpen(false);
          setGoogleAuthError("");
          clearAuthModalRequest();
        }}
        onModeChange={(mode) => {
          setGoogleAuthError("");
          clearAuthModalRequest();
          setAuthModalMode(mode);
          setIsAuthModalOpen(true);
        }}
        successMessage={effectiveAuthSuccessMessage}
        onSuccessMessageClear={() => {
          clearAuthModalSuccessMessage();
        }}
      />
    </nav>
  );
}
