import { apiFetch } from "./client";

let refreshPromise = null;

export async function login({ email, password }) {
  return apiFetch("/api/auth/login", {
    method: "POST",
    body: JSON.stringify({
      email,
      password,
    }),
  });
}

export async function register({ email, username, password }) {
  return apiFetch("/api/auth/register", {
    method: "POST",
    body: JSON.stringify({
      email,
      username,
      password,
    }),
  });
}

export async function profile(accessToken) {
  return apiFetch("/api/auth/profile", {
    method: "GET",
    accessToken,
  });
}

export async function updateProfile(accessToken, { username }) {
  return apiFetch("/api/auth/profile", {
    method: "PATCH",
    accessToken,
    body: JSON.stringify({
      username,
    }),
  });
}

export function refresh() {
  // If a refresh request is already in progress, reuse the same promise
  // instead of sending another request to the API.
  if (!refreshPromise) {
    refreshPromise = apiFetch("/api/auth/refresh", {
      method: "POST",
    }).finally(() => {
      // Allow the next refresh request only after the current one
      // has completed successfully or failed.
      refreshPromise = null;
    });
  }

  return refreshPromise;
}

export async function logout() {
  return apiFetch("/api/auth/logout", {
    method: "POST",
  });
}
