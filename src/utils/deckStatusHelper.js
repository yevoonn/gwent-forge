export function isWarning({ value, limit, mode }) {
  switch (mode) {
    case "max":
      return value > limit;

    case "min":
      return value < limit;

    default:
      return false;
  }
}
