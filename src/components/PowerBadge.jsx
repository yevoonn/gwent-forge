export default function PowerBadge({ power, type, ability }) {
  const imageURL =
    type === "Special"
      ? `/icons/${ability.code.toLowerCase()}_icon_transparent.webp`
      : null;

  return (
    <div
      className="
        absolute
        left-0.5
        top-0.5
        sm:left-1
        sm:top-1
        z-25
        h-25
        w-25
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
      {type === "Hero" ? (
        <>
          <svg className="h-25 w-25" viewBox="0 0 100 100">
            {[...Array(22)].map((_, i) => {
              const angle = (i * 360 * Math.PI) / (180 * 22);
              const spikeLength = 52;
              const spikeWidth = 20;
              const x1 = 50;
              const y1 = 50;
              const x2 = 50 + spikeLength * Math.cos(angle);
              const y2 = 50 + spikeLength * Math.sin(angle);
              const x3 = 50 + spikeWidth * Math.cos(angle + Math.PI / 2);
              const y3 = 50 + spikeWidth * Math.sin(angle + Math.PI / 2);
              const x4 = 50 + spikeWidth * Math.cos(angle - Math.PI / 2);
              const y4 = 50 + spikeWidth * Math.sin(angle - Math.PI / 2);

              return (
                <polygon
                  key={i}
                  points={`${x1},${y1} ${x2},${y2} ${x3},${y3} ${x4},${y4}`}
                  fill="#fe9a00"
                />
              );
            })}
            <circle
              cx="50"
              cy="50"
              r="35"
              fill="#272525"
              stroke="#fe9a00"
              strokeWidth="5"
            />
          </svg>

          <div className="absolute inset-0 flex items-center justify-center">
            <h1 className="font-cinzel text-5xl font-bold text-gray-100">
              {power}
            </h1>
          </div>
        </>
      ) : (
        <div
          className="
            h-18
            w-18
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
          {type === "Special" ? (
            <img src={imageURL} className="scale-85"></img>
          ) : (
            <h1 className="font-cinzel text-5xl font-bold text-gray-800">
              {power}
            </h1>
          )}
        </div>
      )}
    </div>
  );
}
