export function getIsWarning({ value, limit, mode }) {
  switch (mode) {
    case "max":
      return value > limit;

    case "min":
      return value < limit;

    default:
      return false;
  }
}
