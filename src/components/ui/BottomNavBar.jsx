import { Link } from "react-router";
import { Home } from "lucide-react";
import { useTranslation } from "react-i18next";
import { BOTTOM_BAR_HEIGHT } from "../../utils/layout";

const itemClasses = `
  relative
  flex
  h-full
  flex-1
  flex-col
  items-center
  justify-center
  gap-1
  text-[11px]
  transition-transform
  duration-150
  active:scale-90
`;

function ItemContent({ icon: Icon, label, active, badge, warning }) {
  const iconColor = warning
    ? "text-red-400"
    : active
      ? "text-amber-300"
      : "text-amber-400";

  return (
    <>
      <span className="relative">
        <Icon size={22} className={iconColor} />
        {(badge || warning) && (
          <span
            className={`absolute -right-1 -top-1 h-2.5 w-2.5 rounded-full ${
              warning ? "animate-pulse bg-red-500" : "bg-amber-400"
            }`}
          />
        )}
      </span>
      <span
        className={
          warning
            ? "text-red-400"
            : active
              ? "text-amber-300"
              : "text-slate-400"
        }
      >
        {label}
      </span>
    </>
  );
}

export default function BottomNavBar({ actions = [] }) {
  const { t } = useTranslation();

  return (
    <nav
      aria-label="Bottom navigation"
      style={{
        height: `calc(${BOTTOM_BAR_HEIGHT} + env(safe-area-inset-bottom))`,
        paddingBottom: "env(safe-area-inset-bottom)",
      }}
      className="
        fixed
        inset-x-0
        bottom-0
        z-30
        flex
        items-stretch
        border-t
        border-slate-700/80
        bg-slate-950
        md:hidden
      "
    >
      {/* HOME */}
      <Link to="/" aria-label={t("bottom_bar.home")} className={itemClasses}>
        <ItemContent icon={Home} label={t("bottom_bar.home")} />
      </Link>

      {/* ACTIONS */}
      {actions.map(({ id, icon, label, onClick, active, badge, warning }) => (
        <button
          key={id}
          type="button"
          onClick={onClick}
          aria-label={label}
          className={`${itemClasses} cursor-pointer`}
        >
          <ItemContent
            icon={icon}
            label={label}
            active={active}
            badge={badge}
            warning={warning}
          />
        </button>
      ))}
    </nav>
  );
}
