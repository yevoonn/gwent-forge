export const getTooltipPosition = (rect, placement) => {
  const gap = 12;

  switch (placement) {
    case "left":
      return {
        top: rect.top + rect.height / 2,
        left: rect.left - gap,
      };

    case "top":
      return {
        top: rect.top - gap,
        left: rect.left + rect.width / 2,
      };

    case "bottom":
      return {
        top: rect.bottom + gap,
        left: rect.left + rect.width / 2,
      };

    case "center":
      return {
        top: rect.top + rect.height / 2,
        left: rect.left + rect.width / 2,
      };

    case "right":
    default:
      return {
        top: rect.top + rect.height / 2,
        left: rect.right + gap,
      };
  }
};

export const getTooltipTransform = (placement) => {
  switch (placement) {
    case "left":
      return "translate(-100%, -50%)";

    case "top":
      return "translate(-50%, -100%)";

    case "bottom":
      return "translate(-50%, 0)";

    case "center":
      return "translate(-50%, -50%)";

    case "right":
    default:
      return "translate(0, -50%)";
  }
};
