export function getApiErrorMessage(error, t) {
  if (!error) {
    return t("errors.generic");
  }

  // Prefer a specific error returned in details.
  if (error.details?.length) {
    const detail = error.details[0];

    if (detail.code) {
      const translationKey = `errors.api.${detail.code}`;
      const translatedMessage = t(translationKey, {
        defaultValue: "",
      });

      if (translatedMessage) {
        return translatedMessage;
      }
    }
  }

  // Fall back to the main API error code.
  if (error.code) {
    const translationKey = `errors.api.${error.code}`;
    const translatedMessage = t(translationKey, {
      defaultValue: "",
    });

    if (translatedMessage) {
      return translatedMessage;
    }
  }

  return t("errors.generic");
}
