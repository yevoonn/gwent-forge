import { User } from "lucide-react";

export default function ProfileHeader({ user }) {
  return (
    <div className="flex items-center gap-4 border-b border-slate-700 p-6">
      <div className="flex h-14 w-14 items-center justify-center rounded-full bg-slate-800 text-amber-400">
        <User size={28} />
      </div>

      <div>
        <h2 className="text-xl font-semibold text-white">{user.username}</h2>

        <p className="text-sm text-slate-400">{user.email}</p>
      </div>
    </div>
  );
}
