export default function RangeBadge({ type, range }) {
  let imageURL = `/icons/${range.toLowerCase()}_icon_transparent.webp`;

  return (
    <div
      className="
        absolute
        left-0.5
        top-12
        sm:left-1
        sm:top-24
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
      {(type === "Unit" || type === "Hero") && range && (
        <div
          className="
            h-14
            w-14
            rounded-full
            bg-amber-500
            border-4
            border-orange-300
            shadow-lg
            flex
            items-center
            justify-center
            scale-90
          "
        >
          <img src={imageURL} className="scale-75"></img>
        </div>
      )}
    </div>
  );
}
