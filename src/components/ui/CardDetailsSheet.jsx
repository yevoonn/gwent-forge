import { motion } from "motion/react";
import Sheet from "./Sheet";

const sheetTransition = {
  type: "spring",
  damping: 30,
  stiffness: 320,
  mass: 0.9,
};

export default function CardDetailsSheet({ open, onClose, children }) {
  return (
    <Sheet
      open={open}
      onClose={onClose}
      layer="top"
      transition={sheetTransition}
      closeLabel="Close details"
    >
      <motion.div
        initial={{ opacity: 0, y: 8 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.16, delay: 0.08, ease: "easeOut" }}
      >
        {children}
      </motion.div>
    </Sheet>
  );
}
