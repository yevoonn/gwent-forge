export default function Navbar() {
  return (
    <nav className="text-white">
      <div className="mx-auto px-6 py-4 flex justify-between items-center">
        <a
          href="/"
          className="inline-flex items-center gap-3 transition-transform duration-200 hover:scale-105"
        >
          <img src="/logo.png" alt="Gwent Forge Logo" className="h-8 w-auto" />
          <span className="hidden sm:inline font-cinzel text-xl font-semibold">
            Gwent <span className="text-amber-400">Forge</span>
          </span>
        </a>
        <ul className="flex gap-6">
          <li>
            <a
              href="/"
              className="inline-flex transition-transform duration-200 hover:scale-115 hover:text-amber-400"
            >
              <p className="font-cinzel">About</p>
            </a>
          </li>
          <li>
            <a
              href="/"
              className="inline-flex transition-transform duration-200 hover:scale-115 hover:text-amber-400"
            >
              <p className="font-cinzel">Contact</p>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  );
}
