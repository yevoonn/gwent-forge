import { apiFetch } from "./client";

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

export async function refresh() {
  return apiFetch("/api/auth/refresh", {
    method: "POST",
  });
}

export async function logout() {
  return apiFetch("/api/auth/logout", {
    method: "POST",
  });
}
