import { Routes, Route } from "react-router-dom";
import { lazy, Suspense } from "react";
import MainLayout from "./layouts/MainLayout";
import LoadingSpinner from "./components/LoadingSpinner";

const HomePage = lazy(() => import("./pages/HomePage"));
const CardsPage = lazy(() => import("./pages/CardsPage"));
const AboutPage = lazy(() => import("./pages/AboutPage"));
const ContactPage = lazy(() => import("./pages/ContactPage"));

export default function App() {
  return (
    <Suspense fallback={<LoadingSpinner />}>
      <Routes>
        <Route element={<MainLayout />}>
          <Route index element={<HomePage />} />
          <Route path="about" element={<AboutPage />} />
          <Route path="contact" element={<ContactPage />} />
          <Route path="cards/:deckCode" element={<CardsPage />} />
        </Route>
      </Routes>
    </Suspense>
  );
}
