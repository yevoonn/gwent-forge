import ParticlesBackground from "./components/ParticlesBackground";

function App() {
  return (
    <>
      <ParticlesBackground />

      <nav className="text-white">
        <div className="mx-auto px-6 py-4 flex justify-between items-center">
          <div className="font-bold text-xl">Logo</div>

          <ul className="flex gap-6">
            <li>
              <a href="/about">About</a>
            </li>
            <li>
              <a href="/contact">Contact</a>
            </li>
          </ul>
        </div>
      </nav>
      <div className="flex flex-col items-center justify-center text-center min-h-[70vh]">
        <h1 className="font-cinzel text-7xl font-bold">
          Gwent <span className="text-amber-400">Forge</span>
        </h1>

        <p className="mt-6 max-w-2xl text-xl text-slate-300">
          Build your decks before game night.
        </p>

        <p className="mt-6 max-w-2xl text-xl text-slate-300">
          Less Setup, More Gwent.
        </p>

        <button className="mt-10 px-8 py-3 cursor-pointer bg-amber-400 hover:bg-amber-500 text-black font-bold rounded-lg transition duration-300 ease-in-out hover:-translate-y-1 hover:scale-110">
          Get Started
        </button>
      </div>
    </>
  );
}

export default App;
