import { useState } from "react";
import { Save } from "lucide-react";
import { useTranslation } from "react-i18next";
import useMediaQuery from "../../hooks/useMediaQuery";
import Sheet from "../ui/Sheet";

const NAME_MAX_LENGTH = 255;
const DESCRIPTION_MAX_LENGTH = 2000;

const fieldClasses = `
  w-full
  rounded-xl
  border
  border-slate-700
  bg-slate-900/80
  px-4
  py-3
  text-white
  placeholder:text-slate-500
  shadow-lg
  shadow-black/30
  transition-all
  duration-300
  focus:border-amber-400
  focus:outline-none
  focus:ring-2
  focus:ring-amber-400/20
`;

export default function SaveDeckModal({ open, onClose }) {
  const { t } = useTranslation();
  const isDesktop = useMediaQuery("(min-width: 768px)");

  const [name, setName] = useState("");
  const [description, setDescription] = useState("");

  const canSubmit = name.trim().length > 0;

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!canSubmit) return;

    // TODO: save user deck (leader and cards + name + description) to backend
  };

  return (
    <Sheet
      open={open}
      onClose={onClose}
      title={t("save_deck.title")}
      variant={isDesktop ? "modal" : "sheet"}
    >
      <form onSubmit={handleSubmit} className="flex flex-col gap-4">
        <div>
          <label
            htmlFor="deck-name"
            className="mb-2 block text-sm text-slate-300"
          >
            {t("save_deck.name_label")}
          </label>
          <input
            id="deck-name"
            type="text"
            value={name}
            maxLength={NAME_MAX_LENGTH}
            onChange={(e) => setName(e.target.value)}
            placeholder={t("save_deck.name_placeholder")}
            className={fieldClasses}
          />
        </div>

        <div>
          <label
            htmlFor="deck-description"
            className="mb-2 block text-sm text-slate-300"
          >
            {t("save_deck.description_label")}
          </label>
          <textarea
            id="deck-description"
            rows={4}
            value={description}
            maxLength={DESCRIPTION_MAX_LENGTH}
            onChange={(e) => setDescription(e.target.value)}
            placeholder={t("save_deck.description_placeholder")}
            className={`${fieldClasses} resize-none`}
          />
          <p className="mt-1 text-right text-xs text-slate-500 tabular-nums">
            {description.length}/{DESCRIPTION_MAX_LENGTH}
          </p>
        </div>

        <button
          type="submit"
          disabled={!canSubmit}
          className="
            flex
            h-12
            cursor-pointer
            items-center
            justify-center
            gap-2
            rounded-xl
            bg-amber-400
            font-bold
            text-black
            transition-all
            duration-200
            hover:bg-amber-300
            active:scale-[0.98]
            disabled:cursor-not-allowed
            disabled:opacity-50
            disabled:hover:bg-amber-400
          "
        >
          <Save size={18} />
          {t("save_deck.submit")}
        </button>
      </form>
    </Sheet>
  );
}
