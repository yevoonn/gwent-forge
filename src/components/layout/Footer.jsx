import { useTranslation } from "react-i18next";
import { Link } from "react-router";
import { navigationItems } from "../../data/navigation";
import { socialLinks } from "../../data/socials";

export default function Footer() {
  const { t } = useTranslation();

  return (
    <footer
      className="
        w-full
        border-t
        border-slate-800/80
        bg-slate-950/40
        px-6
        md:px-12
        lg:px-16
        xl:px-24
        py-8
        text-sm
        text-slate-400
      "
    >
      <div
        className="
          mx-auto
          flex
          max-w-7xl
          flex-col
          items-center
          gap-6
          text-center
          lg:flex-row
          lg:items-center
          lg:justify-between
          lg:gap-8
          lg:text-left
        "
      >
        {/* Branding */}
        <Link
          to="/"
          className="
            flex
            shrink-0
            items-center
            gap-2.5
            transition-opacity
            hover:opacity-85
          "
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
        <div
          className="
            max-w-xl
            text-xs
            text-center
            leading-relaxed
            text-slate-500
            lg:px-4
          "
        >
          <p className="mb-1">
            {t("footer.description_1")} {t("footer.description_2")}
          </p>
        </div>

        {/* Nav links */}
        <nav aria-label="Footer navigaton" className="shrink-0">
          <ul className="flex flex-col items-center gap-2 lg:items-start">
            {navigationItems.map((item) => {
              const Icon = item.icon;
              return (
                <li key={item.to}>
                  <Link
                    to={item.to}
                    className="
                      group
                      inline-flex
                      items-center
                      gap-2
                      text-xs
                      text-slate-300
                      transition-colors
                      duration-200
                      hover:text-amber-400
                    "
                  >
                    {Icon && (
                      <Icon
                        size={14}
                        className="
                          text-amber-400/70
                          transition-transform
                          duration-200
                          group-hover:scale-110
                        "
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
