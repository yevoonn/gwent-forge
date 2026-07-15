import { useState } from "react";
import Tooltip from "./Tooltip";

export default function AbilityBadge({ type, ability }) {
  const [hovered, setHovered] = useState(false);

  let imageURL = `/icons/${ability.code.toLowerCase()}_icon_transparent.webp`;

  return (
    <div
      className="
        absolute
        left-0.5
        sm:left-1
        top-24
        sm:top-28
        md:top-34
        lg:top-40
        xl:top-44
        z-22
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
      "
    >
      {(type === "UNIT" || type === "HERO") && ability && (
        <div
          className="relative"
          onMouseEnter={() => setHovered(true)}
          onMouseLeave={() => setHovered(false)}
        >
          <div
            className="
            h-14
            w-14
            rounded-full
            bg-stone-200
            border-4
            border-orange-300
            shadow-lg
            flex
            items-center
            justify-center
            scale-90
          "
          >
            <img src={imageURL} alt={ability.code} className="scale-85"></img>
          </div>
          <Tooltip
            visible={hovered}
            title={ability.name}
            description={ability.description}
            className="left-full top-1/2 ml-3 -translate-y-1/2"
          />
        </div>
      )}
    </div>
  );
}
