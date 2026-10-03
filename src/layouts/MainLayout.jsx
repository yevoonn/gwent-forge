import { Outlet } from "react-router";

import ParticlesBackground from "../components/effects/ParticlesBackground";
import Navbar from "../components/navbar/Navbar";
import Footer from "../components/layout/Footer";
import ScrollToTop from "../components/layout/ScrollToTop";

export default function MainLayout() {
  return (
    <>
      <ScrollToTop />

      <ParticlesBackground />

      <div className="min-h-screen flex flex-col">
        <Navbar />

        <main className="flex flex-1 flex-col pb-16 md:pb-20 lg:pb-24">
          <Outlet />
        </main>

        <Footer />
      </div>
    </>
  );
}
