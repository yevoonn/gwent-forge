import { Outlet, useMatch } from "react-router";

import ParticlesBackground from "../components/effects/ParticlesBackground";
import Navbar from "../components/navbar/Navbar";
import Footer from "../components/layout/Footer";
import ScrollToTop from "../components/layout/ScrollToTop";
import { BOTTOM_BAR_HEIGHT } from "../utils/layout";

export default function MainLayout() {
  const isCardsPage = useMatch("/cards/:deckCode");

  return (
    <>
      <ScrollToTop />

      <ParticlesBackground />

      <div
        className="min-h-screen flex flex-col"
        style={
          isCardsPage
            ? {
                "--bar-space": `calc(${BOTTOM_BAR_HEIGHT} + env(safe-area-inset-bottom))`,
              }
            : undefined
        }
      >
        <Navbar />
        <main className="flex flex-1 flex-col pb-16 md:pb-20 lg:pb-24">
          <Outlet />
        </main>
        <Footer />
        {isCardsPage && (
          <div className="h-(--bar-space) md:hidden" aria-hidden />
        )}
      </div>
    </>
  );
}
