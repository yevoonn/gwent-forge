export default function SectionHeading({ id, title, subtitle }) {
  return (
    <div className="mb-6 md:mb-8">
      <div className="flex items-center gap-4">
        <span className="h-px flex-1 bg-gradient-to-r from-transparent to-amber-400/40" />

        <h2
          id={id}
          className="font-cinzel text-base font-bold uppercase tracking-[0.2em] text-amber-400 sm:text-lg md:text-xl"
        >
          {title}
        </h2>

        <span className="h-px flex-1 bg-gradient-to-l from-transparent to-amber-400/40" />
      </div>

      {subtitle && (
        <p className="mt-2 truncate text-center text-xs text-slate-400 sm:text-sm">
          {subtitle}
        </p>
      )}
    </div>
  );
}
