import { Navigate, Outlet } from "react-router";

import { useAuth } from "../../hooks/useAuth";

export default function ProtectedRoute() {
  const { isAuthenticated, isInitializing } = useAuth();

  // Wait until the initial session restoration is complete.
  if (isInitializing) {
    return null;
  }

  // Unauthenticated users cannot access protected routes.
  if (!isAuthenticated) {
    return <Navigate to="/" replace />;
  }

  return <Outlet />;
}
