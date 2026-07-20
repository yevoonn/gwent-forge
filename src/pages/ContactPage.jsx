import { motion } from "motion/react";
import { useTranslation } from "react-i18next";
import {
  MessagesSquare,
  Link,
  Lightbulb,
  Bug,
  HeartHandshake,
} from "lucide-react";

export default function ContactPage() {
  const { t } = useTranslation();

  const contactTopics = [
    {
      icon: Lightbulb,
      title: t("contact.topics.suggestions.title"),
      description: t("contact.topics.suggestions.description"),
    },
    {
      icon: Bug,
      title: t("contact.topics.bugs.title"),
      description: t("contact.topics.bugs.description"),
    },
    {
      icon: HeartHandshake,
      title: t("contact.topics.feedback.title"),
      description: t("contact.topics.feedback.description"),
    },
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
          {t("contact.title")}
        </h1>
        <p className="mx-auto mt-6 max-w-3xl text-lg leading-relaxed text-slate-400">
          {t("contact.intro")}
        </p>
      </motion.section>

      {/* CONTACT CARD */}
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
              <MessagesSquare size={24} />
            </div>

            <div>
              <h2 className="font-cinzel text-2xl font-semibold text-white">
                {t("contact.github.title")}
              </h2>

              <p className="mt-1 text-slate-400">
                {t("contact.github.subtitle")}
              </p>
            </div>
          </div>

          <div className="mt-6">
            <a
              href="https://github.com/yevoonn/gwent-forge"
              target="_blank"
              rel="noopener noreferrer"
              className={`
                group
                flex
                w-full
                min-w-0
                items-start
                gap-3
                rounded-2xl
                border
                border-slate-600
                bg-slate-800/70
                px-4
                py-4
                text-base
                text-slate-200
                backdrop-blur-sm
                transition-all
                duration-200
                hover:-translate-y-0.5
                hover:border-amber-400
                hover:bg-slate-800
                hover:text-white
                hover:shadow-lg
                hover:shadow-amber-500/20

                sm:inline-flex
                sm:w-auto
                sm:min-w-fit
                sm:items-center
                sm:px-5
                sm:text-lg
              `}
            >
              <Link
                size={20}
                className="mt-0.5 shrink-0 text-amber-400 sm:mt-0"
              />

              <span className="min-w-0 break-all font-medium sm:break-normal">
                github.com/yevoonn/gwent-forge
              </span>
            </a>
          </div>

          <p className="mt-4 text-sm leading-relaxed text-slate-400">
            {t("contact.github.note")}
          </p>
        </div>
      </motion.section>

      {/* TOPICS */}
      <motion.section
        initial={{ opacity: 0, y: 24 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-80px" }}
        transition={{ duration: 0.5 }}
        className="mt-16"
      >
        <div className="mb-8 text-center">
          <h2 className="font-cinzel text-3xl font-semibold text-white">
            {t("contact.topics_title")}
          </h2>

          <p className="mt-2 text-slate-400">{t("contact.topics_subtitle")}</p>
        </div>

        <div className="grid gap-6 md:grid-cols-3">
          {contactTopics.map((topic) => {
            const Icon = topic.icon;

            return (
              <motion.div
                key={topic.title}
                whileHover={{ y: -4 }}
                transition={{ type: "spring", stiffness: 300, damping: 22 }}
                className="group rounded-2xl border border-slate-700 bg-slate-900/50 p-6 text-center backdrop-blur-sm transition-colors hover:border-amber-400/40"
              >
                <div className="mb-4 inline-flex rounded-xl bg-amber-400/10 p-3 text-amber-400 transition-transform group-hover:scale-105">
                  <Icon size={24} />
                </div>

                <h3 className="font-cinzel text-xl font-semibold text-white">
                  {topic.title}
                </h3>

                <p className="mt-3 text-slate-400 leading-relaxed">
                  {topic.description}
                </p>
              </motion.div>
            );
          })}
        </div>
      </motion.section>

      {/* COMMUNITY */}
      <motion.section
        initial={{ opacity: 0, y: 24 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-80px" }}
        transition={{ duration: 0.5 }}
        className="mt-16"
      >
        <div className="rounded-3xl border border-amber-400/20 bg-gradient-to-br from-amber-400/10 to-slate-900/60 p-8 text-center backdrop-blur-sm">
          <h2 className="font-cinzel text-2xl font-semibold text-white">
            {t("contact.community.title")}
          </h2>

          <p className="mx-auto mt-4 max-w-2xl text-slate-300 leading-relaxed">
            {t("contact.community.description")}
          </p>

          <div className="mt-6 inline-flex items-center gap-2 rounded-full border border-amber-400/30 bg-amber-400/10 px-4 py-2 text-amber-300">
            <HeartHandshake size={18} />
            <span>{t("contact.community.footer")}</span>
          </div>
        </div>
      </motion.section>
    </div>
  );
}
