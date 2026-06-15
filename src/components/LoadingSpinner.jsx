function LoadingSpinner() {
  return (
    <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex justify-center items-center z-50">
      <div className="bg-black/60 backdrop-blur-md rounded-xl p-8 shadow-2xl flex items-center gap-4">
        <div className="w-8 h-8 border-4 border-amber-400 border-t-transparent rounded-full animate-spin"></div>
        <p className="text-xl text-white font-semibold">Loading...</p>
      </div>
    </div>
  );
}

export default LoadingSpinner;
