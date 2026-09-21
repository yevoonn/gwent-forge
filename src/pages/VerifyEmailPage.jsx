import { useEffect, useState } from "react";
import { useSearchParams } from "react-router";
import { useTranslation } from "react-i18next";
import { verifyEmail } from "../api/auth";

export default function VerifyEmailPage() {
  const { t } = useTranslation("common");
  const [searchParams] = useSearchParams();

  const token = searchParams.get("token");

  const [status, setStatus] = useState(token ? "loading" : "invalid");
  const [username, setUsername] = useState("");

  useEffect(() => {
    if (!token) {
      return;
    }

    async function verify() {
      try {
        const response = await verifyEmail(token);

        setUsername(response.user.username);
        setStatus("success");
      } catch {
        setStatus("error");
      }
    }

    verify();
  }, [token]);

  if (status === "loading") {
    return (
      <main className="flex min-h-screen items-center justify-center">
        <p>{t("auth.verifyEmail.verifying")}</p>
      </main>
    );
  }

  if (status === "success") {
    return (
      <main className="flex min-h-screen items-center justify-center">
        <div className="text-center">
          <h1>{t("auth.verifyEmail.successTitle")}</h1>
          <p>
            {t("auth.verifyEmail.successMessage", {
              username,
            })}
          </p>
        </div>
      </main>
    );
  }

  return (
    <main className="flex min-h-screen items-center justify-center">
      <div className="text-center">
        <h1>{t("auth.verifyEmail.errorTitle")}</h1>
        <p>{t("auth.verifyEmail.errorMessage")}</p>
      </div>
    </main>
  );
}
