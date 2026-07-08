import { useState } from "react";
import BadgeTooltip from "./BadgeTooltip";

export default function RangeBadge({ type, range }) {
  const [hovered, setHovered] = useState(false);

  let imageURL = `/icons/${range?.code?.toLowerCase()}_icon_transparent.webp`;

  if ((type !== "Unit" && type !== "Hero") || !range) {
    return null;
  }

  return (
    <div
      className={`
        absolute
        left-0.5
        top-12
        sm:left-1
        sm:top-24
        z-30
        h-22
        w-22
        scale-55
        sm:scale-65
        md:scale-75
        lg:scale-100
        origin-top-left
        flex
        items-center
        justify-center
      `}
    >
      <div
        className="relative"
        onMouseEnter={() => setHovered(true)}
        onMouseLeave={() => setHovered(false)}
      >
        <div
          className={`
            h-14
            w-14
            rounded-full
            border-4
            border-orange-300
            bg-amber-500
            shadow-lg
            flex
            items-center
            justify-center
            scale-90
          `}
        >
          <img src={imageURL} alt={range.name} className="scale-75" />
        </div>

        <BadgeTooltip
          visible={hovered}
          title={range.name}
          description={range.description}
        />
      </div>
    </div>
  );
}
