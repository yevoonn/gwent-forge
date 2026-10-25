import { useState } from "react";
import { useNavigate } from "react-router";
import { useTranslation } from "react-i18next";
import useMediaQuery from "../../hooks/useMediaQuery";
import { useAuth } from "../../hooks/useAuth";
import { useToast } from "../../hooks/useToast";
import { Save } from "lucide-react";
import { createUserDeck, updateUserDeck } from "../../api/userDecks";
import { getApiErrorMessage } from "../../utils/apiErrorMessageHelper";
import Sheet from "../ui/Sheet";

const NAME_MAX_LENGTH = 255;
const DESCRIPTION_MAX_LENGTH = 2000;
const MAX_CARDS = 200;

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

// Mounted each time the modal opens, so the fields always start with
// the current userDeck values (name and description).
function SaveDeckForm({
  deckId,
  cardCodes,
  userDeck,
  onSaved,
  onClose,
  isSubmitting,
  setIsSubmitting,
}) {
  const { t } = useTranslation();
  const { authenticatedFetch } = useAuth();
  const { showToast } = useToast();
  const navigate = useNavigate();

  const isEdit = Boolean(userDeck);

  const [name, setName] = useState(userDeck?.name ?? "");
  const [description, setDescription] = useState(userDeck?.description ?? "");
  const [error, setError] = useState("");

  const hasCards = cardCodes.length > 0;
  const tooManyCards = cardCodes.length > MAX_CARDS;
  const canSubmit =
    name.trim().length > 0 &&
    hasCards &&
    !tooManyCards &&
    deckId != null &&
    !isSubmitting;

  const hint = !hasCards
    ? t("save_deck.hint_no_cards")
    : tooManyCards
      ? t("save_deck.hint_too_many", { max: MAX_CARDS })
      : "";

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!canSubmit) return;

    setIsSubmitting(true);
    setError("");

    try {
      if (isEdit) {
        const updated = await authenticatedFetch((token) =>
          updateUserDeck({
            accessToken: token,
            id: userDeck.id,
            lang: userDeck.lang,
            name: name.trim(),
            description: description.trim(),
            cardCodes,
          }),
        );

        // The response contains the name and description in the language
        // specified by userDeck.lang.
        onSaved?.({ ...updated, lang: userDeck.lang });
        onClose();
        showToast(t("save_deck.success_edit"));
      } else {
        const created = await authenticatedFetch((token) =>
          createUserDeck({
            accessToken: token,
            deckId,
            name: name.trim(),
            description: description.trim(),
            cardCodes,
          }),
        );

        onClose();
        showToast(t("save_deck.success"));
        navigate(`/decks/${created.id}`, { replace: true });
      }
    } catch (err) {
      console.error(err);
      setError(
        err.status === 401
          ? t("save_deck.session_expired")
          : getApiErrorMessage(err, t),
      );
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
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
          disabled={isSubmitting}
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
          disabled={isSubmitting}
          className={`${fieldClasses} resize-none`}
        />
        <p className="mt-1 text-right text-xs tabular-nums text-slate-500">
          {description.length}/{DESCRIPTION_MAX_LENGTH}
        </p>
      </div>

      {(hint || error) && (
        <p
          role={error ? "alert" : undefined}
          className={`text-center text-sm ${
            error ? "text-red-400" : "text-slate-400"
          }`}
        >
          {error || hint}
        </p>
      )}

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
        {isSubmitting ? t("save_deck.saving") : t("save_deck.submit")}
      </button>
    </form>
  );
}

export default function SaveDeckModal({
  open,
  onClose,
  deckId,
  cardCodes,
  userDeck,
  onSaved,
}) {
  const { t } = useTranslation();
  const isDesktop = useMediaQuery("(min-width: 768px)");
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleClose = () => {
    if (isSubmitting) return;
    onClose();
  };

  return (
    <Sheet
      open={open}
      onClose={handleClose}
      title={t(userDeck ? "save_deck.title_edit" : "save_deck.title")}
      variant={isDesktop ? "modal" : "sheet"}
    >
      <SaveDeckForm
        deckId={deckId}
        cardCodes={cardCodes}
        userDeck={userDeck}
        onSaved={onSaved}
        onClose={onClose}
        isSubmitting={isSubmitting}
        setIsSubmitting={setIsSubmitting}
      />
    </Sheet>
  );
}
