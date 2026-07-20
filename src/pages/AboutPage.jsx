import { motion } from "motion/react";
import { useTranslation } from "react-i18next";
import { Sparkles, Layers3, Globe, Shield, Wrench, Swords } from "lucide-react";

export default function AboutPage() {
  const { t } = useTranslation("about");

  const features = [
    {
      icon: Layers3,
      title: t("features.deck_management.title"),
      description: t("features.deck_management.description"),
    },
    {
      icon: Swords,
      title: t("features.card_browser.title"),
      description: t("features.card_browser.description"),
    },
    {
      icon: Globe,
      title: t("features.localization.title"),
      description: t("features.localization.description"),
    },
    {
      icon: Sparkles,
      title: t("features.game_night.title"),
      description: t("features.game_night.description"),
    },
  ];

  const techStack = [
    "React",
    "Vite",
    "Tailwind CSS",
    "Motion",
    "tsParticles",
    "Node.js",
    "Express",
    "Prisma",
    "PostgreSQL",
  ];

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
          {t("title")}
        </h1>
        <p className="mx-auto mt-4 max-w-3xl font-cinzel text-xl text-slate-300 md:text-2xl">
          {t("tagline")}
        </p>
        <p className="mx-auto mt-6 max-w-3xl text-lg leading-relaxed text-slate-400">
          {t("intro")}
        </p>
      </motion.section>

      {/* WHY */}
      <motion.section
        initial={{ opacity: 0, y: 24 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-80px" }}
        transition={{ duration: 0.5 }}
        className="mt-16"
      >
        <div className="rounded-3xl border border-slate-700 bg-slate-900/60 p-8 backdrop-blur-sm">
          <div className="flex items-center gap-3">
            <div className="rounded-xl bg-amber-400/10 p-3 text-amber-400">
              <Swords size={24} />
            </div>
            <h2 className="font-cinzel text-2xl font-semibold text-white">
              {t("why.title")}
            </h2>
          </div>

          <div className="mt-6 space-y-4 text-slate-300 leading-relaxed">
            <p>{t("why.paragraph1")}</p>
            <p>{t("why.paragraph2")}</p>
          </div>
        </div>
      </motion.section>

      {/* FEATURES */}
      <motion.section
        initial={{ opacity: 0, y: 24 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-80px" }}
        transition={{ duration: 0.5 }}
        className="mt-16"
      >
        <div className="mb-8 text-center">
          <h2 className="font-cinzel text-3xl font-semibold text-white">
            {t("features_title")}
          </h2>
          <p className="mt-2 text-slate-400">{t("features_subtitle")}</p>
        </div>

        <div className="grid gap-6 md:grid-cols-2">
          {features.map((feature) => {
            const Icon = feature.icon;

            return (
              <motion.div
                key={feature.title}
                whileHover={{ y: -4 }}
                transition={{ type: "spring", stiffness: 300, damping: 22 }}
                className="group rounded-2xl border border-slate-700 bg-slate-900/50 p-6 backdrop-blur-sm transition-colors hover:border-amber-400/40"
              >
                <div className="mb-4 inline-flex rounded-xl bg-amber-400/10 p-3 text-amber-400 transition-transform group-hover:scale-105">
                  <Icon size={24} />
                </div>

                <h3 className="font-cinzel text-xl font-semibold text-white">
                  {feature.title}
                </h3>

                <p className="mt-3 text-slate-400 leading-relaxed">
                  {feature.description}
                </p>
              </motion.div>
            );
          })}
        </div>
      </motion.section>

      {/* TECH STACK */}
      <motion.section
        initial={{ opacity: 0, y: 24 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-80px" }}
        transition={{ duration: 0.5 }}
        className="mt-16"
      >
        <div className="rounded-3xl border border-slate-700 bg-slate-900/60 p-8 backdrop-blur-sm">
          <div className="flex items-center gap-3">
            <div className="rounded-xl bg-amber-400/10 p-3 text-amber-400">
              <Wrench size={24} />
            </div>
            <h2 className="font-cinzel text-2xl font-semibold text-white">
              {t("tech_stack.title")}
            </h2>
          </div>

          <div className="mt-6 flex flex-wrap gap-3">
            {techStack.map((tech) => (
              <span
                key={tech}
                className="rounded-full border border-slate-600 bg-slate-800/70 px-4 py-2 text-sm text-slate-200 backdrop-blur-sm transition-colors hover:border-amber-400/40 hover:text-white"
              >
                {tech}
              </span>
            ))}
          </div>
        </div>
      </motion.section>

      {/* DISCLAIMER */}
      <motion.section
        initial={{ opacity: 0, y: 24 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-80px" }}
        transition={{ duration: 0.5 }}
        className="mt-16"
      >
        <div className="rounded-3xl border border-red-500/30 bg-red-950/20 p-8 backdrop-blur-sm">
          <div className="flex items-start gap-4">
            <div className="rounded-xl bg-red-500/10 p-3 text-red-400">
              <Shield size={24} />
            </div>

            <div>
              <h2 className="font-cinzel text-2xl font-semibold text-red-300">
                {t("disclaimer.title")}
              </h2>

              <div className="mt-4 space-y-4 text-slate-300 leading-relaxed">
                <p>{t("disclaimer.paragraph1")}</p>
                <p>{t("disclaimer.paragraph2")}</p>
                <p>{t("disclaimer.paragraph3")}</p>
              </div>
            </div>
          </div>
        </div>
      </motion.section>
    </div>
  );
}
