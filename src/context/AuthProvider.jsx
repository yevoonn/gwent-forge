import { useCallback, useEffect, useState } from "react";
import * as authApi from "../api/auth";
import { AuthContext } from "./AuthContext";

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [accessToken, setAccessToken] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [isInitializing, setIsInitializing] = useState(true);

  useEffect(() => {
    const restoreSession = async () => {
      try {
        const result = await authApi.refresh();

        setUser(result.user);
        setAccessToken(result.accessToken);
      } catch {
        setUser(null);
        setAccessToken(null);
      } finally {
        setIsInitializing(false);
      }
    };

    restoreSession();
  }, []);

  const login = useCallback(async (credentials) => {
    setIsLoading(true);

    try {
      const result = await authApi.login(credentials);

      setUser(result.user);
      setAccessToken(result.accessToken);

      return result;
    } finally {
      setIsLoading(false);
    }
  }, []);

  const register = useCallback(async (credentials) => {
    setIsLoading(true);

    try {
      const result = await authApi.register(credentials);

      return result;
    } finally {
      setIsLoading(false);
    }
  }, []);

  const logout = useCallback(async () => {
    setIsLoading(true);

    try {
      await authApi.logout();
    } finally {
      setUser(null);
      setAccessToken(null);
      setIsLoading(false);
    }
  }, []);

  const authenticatedFetch = useCallback(
    async (request) => {
      // A protected request requires a valid access token.
      // If there is no token, the user is not authenticated.
      if (!accessToken) {
        throw new Error("No access token available");
      }

      try {
        // Execute the requested API call using the current access token.
        return await request(accessToken);
      } catch (error) {
        // Only an invalid access token should trigger the refresh flow.
        // Other API errors are passed to the caller unchanged.
        if (error.code !== "INVALID_ACCESS_TOKEN") {
          throw error;
        }

        // The refresh token is stored in an HttpOnly cookie, so the browser
        // sends it automatically. The API returns a new access token.
        const result = await authApi.refresh();

        // Store the refreshed session in the AuthProvider state.
        setUser(result.user);
        setAccessToken(result.accessToken);

        // Retry the original request with the new access token.
        return request(result.accessToken);
      }
    },
    [accessToken],
  );

  const loadProfile = useCallback(async () => {
    const result = await authenticatedFetch((token) => authApi.profile(token));

    setUser(result.user);

    return result.user;
  }, [authenticatedFetch]);

  const updateProfile = useCallback(
    async (data) => {
      const result = await authenticatedFetch((token) =>
        authApi.updateProfile(token, data),
      );

      setUser(result.user);

      return result.user;
    },
    [authenticatedFetch],
  );

  const changePassword = useCallback(
    async (data) => {
      return authenticatedFetch((token) => authApi.changePassword(token, data));
    },
    [authenticatedFetch],
  );

  const value = {
    user,
    accessToken,
    isAuthenticated: Boolean(accessToken),
    isLoading,
    isInitializing,
    login,
    register,
    logout,
    authenticatedFetch,
    loadProfile,
    updateProfile,
    changePassword,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}
