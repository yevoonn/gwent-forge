import { Link } from "react-router";

export default function NavLinkItem({
  to,
  icon: Icon,
  label,
  onClick,
  mobile = false,
  isButton = false,
}) {
  const desktopClasses = `
    inline-flex
    items-center
    gap-2
    rounded-xl
    border
    border-slate-700
    bg-slate-900/70
    px-4
    py-2
    font-cinzel
    transition-all
    duration-200
    hover:-translate-y-0.5
    hover:border-amber-400
    hover:bg-slate-800
    hover:text-amber-300
    hover:shadow-lg
    hover:shadow-amber-500/20
  `;

  const mobileClasses = `
    flex
    items-center
    gap-3
    rounded-xl
    border
    border-transparent
    px-4
    py-3
    font-cinzel
    transition-all
    duration-200
    hover:border-amber-400
    hover:bg-slate-800
    hover:text-amber-300
  `;

  const className = mobile ? mobileClasses : desktopClasses;

  const content = (
    <>
      <Icon size={mobile ? 18 : 16} className="shrink-0 text-amber-400" />

      <span>{label}</span>
    </>
  );

  if (isButton) {
    return (
      <button
        type="button"
        onClick={onClick}
        className={`${className} cursor-pointer`}
      >
        {content}
      </button>
    );
  }

  return (
    <Link to={to} onClick={onClick} className={className}>
      {content}
    </Link>
  );
}
