import { useState } from "react";
import { Trash2 } from "lucide-react";
import { useTranslation } from "react-i18next";
import useMediaQuery from "../../hooks/useMediaQuery";
import { useAuth } from "../../hooks/useAuth";
import { useToast } from "../../hooks/useToast";
import { deleteUserDeck } from "../../api/userDecks";
import { getApiErrorMessage } from "../../utils/apiErrorMessageHelper";
import Sheet from "../ui/Sheet";

function DeleteDeckContent({
  deck,
  onClose,
  onDeleted,
  isDeleting,
  setIsDeleting,
}) {
  const { t } = useTranslation();
  const { authenticatedFetch } = useAuth();
  const { showToast } = useToast();

  const [error, setError] = useState("");

  const handleDelete = async () => {
    setIsDeleting(true);
    setError("");

    try {
      await authenticatedFetch((token) =>
        deleteUserDeck({ accessToken: token, id: deck.id }),
      );

      onDeleted(deck.id);
      onClose();
      showToast(t("my_decks.delete_success"));
    } catch (err) {
      console.error(err);
      setError(
        err.status === 401
          ? t("save_deck.session_expired")
          : getApiErrorMessage(err, t),
      );
    } finally {
      setIsDeleting(false);
    }
  };

  return (
    <div className="flex flex-col gap-4 text-center">
      <p className="break-words font-cinzel text-xl font-semibold text-amber-400">
        {deck.name}
      </p>

      <p className="leading-relaxed text-slate-300">
        {t("my_decks.delete_question")}
        <br />
        <span className="text-slate-400">{t("my_decks.delete_warning")}</span>
      </p>

      {error && (
        <p role="alert" className="text-sm text-red-400">
          {error}
        </p>
      )}

      <div className="mt-2 flex gap-3">
        <button
          type="button"
          onClick={onClose}
          disabled={isDeleting}
          className="
            h-12
            flex-1
            cursor-pointer
            rounded-xl
            border
            border-slate-700
            bg-slate-900/70
            font-bold
            text-slate-200
            transition-all
            duration-200
            hover:border-amber-400
            hover:bg-slate-800
            hover:text-amber-300
            active:scale-[0.98]
            disabled:cursor-not-allowed
            disabled:opacity-50
          "
        >
          {t("my_decks.cancel")}
        </button>

        <button
          type="button"
          onClick={handleDelete}
          disabled={isDeleting}
          className="
            flex
            h-12
            flex-1
            cursor-pointer
            items-center
            justify-center
            gap-2
            rounded-xl
            bg-red-500
            font-bold
            text-white
            transition-all
            duration-200
            hover:bg-red-400
            active:scale-[0.98]
            disabled:cursor-not-allowed
            disabled:opacity-50
            disabled:hover:bg-red-500
          "
        >
          <Trash2 size={18} />
          {isDeleting ? t("my_decks.deleting") : t("my_decks.delete_confirm")}
        </button>
      </div>
    </div>
  );
}

export default function DeleteDeckModal({ open, onClose, deck, onDeleted }) {
  const { t } = useTranslation();
  const isDesktop = useMediaQuery("(min-width: 768px)");
  const [isDeleting, setIsDeleting] = useState(false);

  const handleClose = () => {
    if (isDeleting) return;
    onClose();
  };

  return (
    <Sheet
      open={open}
      onClose={handleClose}
      title={t("my_decks.delete_title")}
      variant={isDesktop ? "modal" : "sheet"}
    >
      {deck && (
        <DeleteDeckContent
          deck={deck}
          onClose={onClose}
          onDeleted={onDeleted}
          isDeleting={isDeleting}
          setIsDeleting={setIsDeleting}
        />
      )}
    </Sheet>
  );
}
