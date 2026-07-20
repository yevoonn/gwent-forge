import i18n from "i18next";
import LanguageDetector from "i18next-browser-languagedetector";
import { initReactI18next } from "react-i18next";

import enCommon from "./locales/en/common.json";
import plCommon from "./locales/pl/common.json";
import itCommon from "./locales/it/common.json";

import enAbout from "./locales/en/about.json";
import plAbout from "./locales/pl/about.json";
import itAbout from "./locales/it/about.json";

import enContact from "./locales/en/contact.json";
import plContact from "./locales/pl/contact.json";
import itContact from "./locales/it/contact.json";

i18n
  .use(LanguageDetector)
  .use(initReactI18next)
  .init({
    resources: {
      en: {
        common: enCommon,
        about: enAbout,
        contact: enContact,
      },
      pl: {
        common: plCommon,
        about: plAbout,
        contact: plContact,
      },
      it: {
        common: itCommon,
        about: itAbout,
        contact: itContact,
      },
    },

    fallbackLng: "en",
    supportedLngs: ["en", "pl", "it"],

    ns: ["common", "about", "contact"],
    defaultNS: "common",

    interpolation: {
      escapeValue: false,
    },

    detection: {
      order: ["localStorage", "navigator"],
      caches: ["localStorage"],
    },
  });

export default i18n;
