import { useEffect } from "react";
import { useAuth } from "../hooks/useAuth";

export default function ProfilePage() {
  const { user, loadProfile } = useAuth();

  useEffect(() => {
    loadProfile().catch((error) => {
      console.error("Profile error:", error);
    });
  }, [loadProfile]);

  return (
    <main className="mx-auto max-w-screen-xl px-6 py-12">
      <h1 className="font-cinzel text-3xl font-semibold text-amber-400">
        Profile
      </h1>

      <pre className="mt-6 text-slate-300">{JSON.stringify(user, null, 2)}</pre>
    </main>
  );
}
