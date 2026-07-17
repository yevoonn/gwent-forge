import { Outlet } from "react-router-dom";

import ParticlesBackground from "../components/effects/ParticlesBackground";
import Navbar from "../components/navbar/Navbar";
import Footer from "../components/layout/Footer";

export default function MainLayout() {
  return (
    <>
      <ParticlesBackground />

      <div className="min-h-screen flex flex-col">
        <Navbar />

        <main className="flex-1">
          <Outlet />
        </main>

        <Footer />
      </div>
    </>
  );
}
