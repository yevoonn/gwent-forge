import { API_URL } from "../config";

export async function apiFetch(endpoint, options = {}) {
  const response = await fetch(`${API_URL}${endpoint}`, {
    ...options,
    credentials: "include",
    headers: {
      "Content-Type": "application/json",
      ...options.headers,
    },
  });

  if (response.status === 204) {
    return null;
  }

  const data = await response.json();

  if (!response.ok) {
    const error = new Error(data?.error?.message || "Request failed");

    // Preserve the structured error information returned by the API.
    // These values will later be used to map backend errors
    // to frontend translation keys.
    error.code = data?.error?.code;
    error.details = data?.error?.details;

    throw error;
  }

  return data;
}
