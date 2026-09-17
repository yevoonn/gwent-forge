import { getIsWarning } from "../../utils/deckStatusHelper";
import useMediaQuery from "../../hooks/useMediaQuery";
import DeckStatusSidePanel from "./DeckStatusSidePanel";
import DeckStatusDrawer from "./DeckStatusDrawer";

export default function DeckStatusPanel({
  statuses = [],
  expandedDesktop,
  onToggleDesktop,
  expandedMobile,
  onToggleMobile,
  onCloseMobile,
}) {
  const isDesktop = useMediaQuery("(min-width: 768px)");

  const hasWarnings = statuses.some(getIsWarning);

  if (isDesktop) {
    return (
      <DeckStatusSidePanel
        statuses={statuses}
        expanded={expandedDesktop}
        onToggle={onToggleDesktop}
        hasWarnings={hasWarnings}
      />
    );
  }

  return (
    <DeckStatusDrawer
      statuses={statuses}
      expanded={expandedMobile}
      onToggle={onToggleMobile}
      onClose={onCloseMobile}
      hasWarnings={hasWarnings}
    />
  );
}
