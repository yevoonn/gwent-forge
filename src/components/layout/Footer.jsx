import { useTranslation } from "react-i18next";
import { Link } from "react-router";
import { navigationItems } from "../../data/navigation";

function GithubIcon({ size = 18, className = "" }) {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      className={className}
      aria-hidden="true"
    >
      <path d="M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4" />
      <path d="M9 18c-4.51 2-5-2-7-2" />
    </svg>
  );
}

const socialLinks = [
  {
    name: "GitHub",
    href: "https://github.com/yevoonn/gwent-forge",
    icon: GithubIcon,
  },
];

export default function Footer() {
  const { t } = useTranslation();

  return (
    <footer className="w-full border-t border-slate-800/80 bg-slate-950/40 px-6 md:px-12 lg:px-16 xl:px-24 py-8 text-sm text-slate-400">
      <div className="mx-auto flex max-w-7xl flex-col items-center gap-6 text-center lg:flex-row lg:items-center lg:justify-between lg:gap-8 lg:text-left">
        {/* Branding */}
        <Link
          to="/"
          className="flex shrink-0 items-center gap-2.5 transition-opacity hover:opacity-85"
        >
          <img
            src="/logo.png"
            alt="Gwent Forge Logo"
            className="h-7 w-auto opacity-80"
          />
          <span className="font-cinzel text-base font-semibold text-slate-300">
            Gwent <span className="text-amber-400">Forge</span>
          </span>
        </Link>

        {/* Description */}
        <div className="max-w-xl text-xs text-center leading-relaxed text-slate-500 lg:px-4">
          <p className="mb-1">
            {t("footer.description_1")} {t("footer.description_2")}
          </p>
        </div>

        {/* Nav links */}
        <nav aria-label="Stopka - nawigacja" className="shrink-0">
          <ul className="flex flex-col items-center gap-2 lg:items-start">
            {navigationItems.map((item) => {
              const Icon = item.icon;
              return (
                <li key={item.to}>
                  <Link
                    to={item.to}
                    className="group inline-flex items-center gap-2 text-xs text-slate-300 transition-colors duration-200 hover:text-amber-400"
                  >
                    {Icon && (
                      <Icon
                        size={14}
                        className="text-amber-400/70 transition-transform duration-200 group-hover:scale-110"
                      />
                    )}
                    <span>{t(item.key)}</span>
                  </Link>
                </li>
              );
            })}
          </ul>
        </nav>

        {/* Social media */}
        <div className="flex shrink-0 items-center gap-3">
          {socialLinks.map((social) => {
            const Icon = social.icon;
            return (
              <a
                key={social.name}
                href={social.href}
                target="_blank"
                rel="noopener noreferrer"
                aria-label={social.name}
                className="
                  rounded-lg
                  border
                  border-slate-800
                  bg-slate-900/60
                  p-2
                  text-slate-400
                  transition-all
                  duration-200
                  hover:-translate-y-0.5
                  hover:border-amber-400/40
                  hover:text-amber-400
                  hover:drop-shadow-[0_0_8px_rgba(251,191,36,0.2)]
                "
              >
                <Icon size={18} />
              </a>
            );
          })}
        </div>
      </div>
    </footer>
  );
}
