import { useTranslation } from "react-i18next";

export default function useCurrentLanguage() {
  const { i18n } = useTranslation();

  return i18n.resolvedLanguage;
}
