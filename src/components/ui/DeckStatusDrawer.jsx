import { useTranslation } from "react-i18next";
import Sheet from "./Sheet";
import DeckStatusBar from "./DeckStatusBar";

export default function DeckStatusDrawer({ statuses, expanded, onClose }) {
  const { t } = useTranslation();

  return (
    <Sheet open={expanded} onClose={onClose} title={t("deck_status.title")}>
      <div className="flex flex-col gap-3">
        {statuses.map((status) => (
          <DeckStatusBar
            key={status.id}
            {...status}
            showLabel
            fullWidth
            lightweight
          />
        ))}
      </div>
    </Sheet>
  );
}
