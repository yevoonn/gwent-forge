export default function AbilityBadge({ type, ability }) {
  let imageURL = `/icons/${ability.code.toLowerCase()}_icon_transparent.webp`;

  return (
    <div
      className="
        absolute
        left-0.5
        top-28
        sm:left-1
        sm:top-56
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
      {(type === "Unit" || type === "Hero") && ability && (
        <div
          className="
            h-14
            w-14
            rounded-full
            bg-gray-100
            border-dashed
            border-4
            border-gray-500
            shadow-lg
            flex
            items-center
            justify-center
            scale-90
          "
        >
          <img src={imageURL} className="scale-85"></img>
        </div>
      )}
    </div>
  );
}
