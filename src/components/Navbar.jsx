import { useState } from "react";
import { Link } from "react-router-dom";
import { AnimatePresence, motion } from "motion/react";
import { Menu, X, Info, Mail } from "lucide-react";

export default function Navbar() {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <nav className="relative z-50 text-white">
      <div className="mx-auto px-6 py-4 flex justify-between items-center">
        {/* Logo */}
        <Link
          to="/"
          className="inline-flex items-center gap-3 transition-transform duration-200 hover:scale-105"
        >
          <img src="/logo.png" alt="Gwent Forge Logo" className="h-8 w-auto" />

          <span className="hidden sm:inline font-cinzel text-xl font-semibold">
            Gwent <span className="text-amber-400">Forge</span>
          </span>
        </Link>

        {/* Desktop Navigation */}
        <ul className="hidden md:flex gap-6">
          <li>
            <Link
              to="/"
              className="inline-flex items-center gap-2 transition-transform duration-200 hover:scale-110 hover:text-amber-400"
            >
              <Info size={16} />
              <span className="font-cinzel">About</span>
            </Link>
          </li>

          <li>
            <Link
              to="/"
              className="inline-flex items-center gap-2 transition-transform duration-200 hover:scale-110 hover:text-amber-400"
            >
              <Mail size={16} />
              <span className="font-cinzel">Contact</span>
            </Link>
          </li>
        </ul>

        {/* Mobile Hamburger */}
        <button
          onClick={() => setIsOpen((prev) => !prev)}
          className="md:hidden p-1 transition-colors hover:text-amber-400"
          aria-label="Toggle menu"
        >
          {isOpen ? <X size={28} /> : <Menu size={28} />}
        </button>
      </div>

      {/* Mobile Dropdown */}
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
            className="md:hidden absolute right-6 top-full mt-2 w-44 overflow-hidden rounded-2xl border border-slate-700 bg-slate-900/95 backdrop-blur-md shadow-2xl"
          >
            <Link
              to="/"
              onClick={() => setIsOpen(false)}
              className="flex items-center gap-3 px-5 py-4 font-cinzel transition-colors hover:bg-slate-800 hover:text-amber-400"
            >
              <Info size={18} />
              <span>About</span>
            </Link>

            <Link
              to="/"
              onClick={() => setIsOpen(false)}
              className="flex items-center gap-3 px-5 py-4 font-cinzel transition-colors hover:bg-slate-800 hover:text-amber-400"
            >
              <Mail size={18} />
              <span>Contact</span>
            </Link>
          </motion.div>
        )}
      </AnimatePresence>
    </nav>
  );
}
