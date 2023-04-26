declare interface User {
  email?: string | undefined;
  password?: string | undefined;
  phone?: string | undefined;
  id?: string | undefined;
}

declare interface Supabase {
  error?: string | undefined;
  errorMsg?: string | undefined;
}
