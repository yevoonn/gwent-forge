import { motion } from "motion/react";
import { useEffect, useState } from "react";
import { useTranslation } from "react-i18next";
import { useAuth } from "../hooks/useAuth";

import ProfileHeader from "../components/profile/ProfileHeader";
import ProfileInfo from "../components/profile/ProfileInfo";
import UsernameSection from "../components/profile/UsernameSection";
import PasswordSection from "../components/profile/PasswordSection";

export default function ProfilePage() {
  const { t: tCommon } = useTranslation("common");
  const { t: tProfile } = useTranslation("profile");
  const { user, loadProfile } = useAuth();

  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProfile = async () => {
      try {
        setError(null);
        await loadProfile();
      } catch (error) {
        console.error("Profile error:", error);
        setError(error);
      } finally {
        setIsLoading(false);
      }
    };

    fetchProfile();
  }, [loadProfile]);

  if (isLoading) {
    return (
      <main className="mx-auto max-w-screen-xl px-6 py-12">
        <p className="text-slate-400">{tCommon("spinner.text")}</p>
      </main>
    );
  }

  if (error || !user) {
    return (
      <main className="mx-auto max-w-screen-xl px-6 py-12">
        <p className="text-red-400">{tCommon("errors.generic")}</p>
      </main>
    );
  }

  return (
    <div className="mx-auto max-w-screen-2xl px-6 py-12 text-white">
      {/* HERO */}
      <motion.section
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
        className="text-center"
      >
        <h1 className="font-cinzel text-4xl font-bold tracking-tight text-white md:text-6xl">
          {tProfile("title")}
        </h1>
      </motion.section>

      {/* PROFILE CARD */}
      <motion.section
        initial={{ opacity: 0, y: 24 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-80px" }}
        transition={{ duration: 0.5 }}
        className="mx-auto mt-16 max-w-2xl"
      >
        <div className="overflow-hidden rounded-3xl border border-slate-700 bg-slate-900/60 backdrop-blur-sm">
          <ProfileHeader user={user} />

          <div className="divide-y divide-slate-700">
            <UsernameSection />
            <PasswordSection />
            <ProfileInfo user={user} />
          </div>
        </div>
      </motion.section>
    </div>
  );
}
