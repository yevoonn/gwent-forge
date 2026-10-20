import CardSearchInput from "./CardSearchInput";
import CardFiltersPanel from "./CardFiltersPanel";

export default function CardFilters({
  search,
  setSearch,
  isFiltersOpen,
  setIsFiltersOpen,
  ...filterProps
}) {
  return (
    <div className="sticky top-4 z-10 mx-auto flex max-w-3xl items-center gap-3">
      <CardSearchInput search={search} setSearch={setSearch} />

      <CardFiltersPanel
        isOpen={isFiltersOpen}
        onClose={() => setIsFiltersOpen(false)}
        {...filterProps}
      />
    </div>
  );
}
