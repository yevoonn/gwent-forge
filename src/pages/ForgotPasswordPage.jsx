import ForgotPasswordForm from "../components/auth/ForgotPasswordForm";

export default function ForgotPasswordPage() {
  return (
    <div className="flex flex-1 items-center justify-center px-6 py-12">
      <div
        className="
          w-full
          max-w-xl
          rounded-3xl
          border
          border-slate-700
          bg-slate-900/60
          p-8
          backdrop-blur-sm
          sm:p-10
        "
      >
        <ForgotPasswordForm />
      </div>
    </div>
  );
}
