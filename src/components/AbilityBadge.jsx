export default function AbilityBadge({ type, ability }) {
  const abilityCode = ability.code.toLowerCase();
  let imageURL = `/icons/${abilityCode}_icon_transparent.webp`;

  return (
    <div
      className="
        absolute
        left-0.5
        top-30
        sm:left-1
        sm:top-60
        z-20
        h-20
        w-20
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
            border-4
            border-amber-500
            shadow-lg
            flex
            items-center
            justify-center
          "
        >
          <img src={imageURL} className="scale-85"></img>
        </div>
      )}
    </div>
  );
}
