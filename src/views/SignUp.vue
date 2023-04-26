<script>
import { ref } from "vue";
import { supabase } from "../supabase.ts";
import { useRouter } from "vue-router";
import { computed } from "vue";
import store from "../store/index.ts";
export default {
  name: "signUp",
  setup() {
    // create data / vars

    const router = useRouter();

    const firstName = ref(null);
    const lastName = ref(null);
    const email = ref(null);
    const password = ref(null);
    const confirmPassword = ref(null);
    const errorMsg = ref(null);

    // signUp function

    const signUp = async () => {
      if (password.value === confirmPassword.value) {
        try {
          const { error } = await supabase.auth.signUp({
            email: email.value,
            password: password.value,
          });
          if (error) throw error;
          router.push({ name: "SignIn" });
        } catch (error) {
          errorMsg.value = error.message;
          setTimeout(() => {
            errorMsg.value = null;
          }, 5000);
        }
        return;
      }
      errorMsg.value = "Passwords do not match";
      setTimeout(() => {
        errorMsg.value = null;
      }, 5000);
    };

    const user = computed(() => store.state.user);

    // If already logged in, redirect to home

    async function redirectSignedIn() {
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (user) {
        router.push({ name: "Home" });
      }
    }

    redirectSignedIn();

    return {
      firstName,
      lastName,
      email,
      password,
      errorMsg,
      signUp,
      user,
    };
  },
};
</script>

<template>
  <div v-if="!user" class="w-96 mx-auto py-10">
    <!-- Error Handling -->

    <div v-if="errorMsg" class="mb-10 p-4 rounded-md bg-light-grey">
      <p class="text-red-500">{{ errorMsg }}</p>
    </div>

    <!-- signUp -->

    <form
      @submit.prevent="signUp"
      class="p-8 flex flex-col border shadow-lg rounded-md"
    >
      <h1 class="text-2xl mx-auto mb-2">Create your account</h1>
      <p class="mx-auto mb-5">It's free and only takes a minute</p>

      <div class="flex flex-col mb-2">
        <label for="firstName" class="mb-1 text-sm">First name</label>
        <input
          type="text"
          required
          id="firstName"
          v-model="firstName"
          class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-slate-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="lastName" class="mb-1 text-sm">Last name</label>
        <input
          type="text"
          required
          id="lastName"
          v-model="lastName"
          class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-slate-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="email" class="mb-1 text-sm">Email</label>
        <input
          type="text"
          required
          id="email"
          v-model="email"
          class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-slate-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="Password" class="mb-1 text-sm">Password</label>
        <input
          type="password"
          required
          id="Password"
          v-model="password"
          class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-slate-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="confirmPassword" class="mb-1 text-sm"
          >Confirm password</label
        >
        <input
          type="password"
          required
          id="confirmPassword"
          v-model="confirmPassword"
          class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-slate-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500"
        />
      </div>
      <button
        type="submit"
        class="min-w-full mt-6 py-2 px-6 rounded-md self-start text-sm bg-light-green duration-300 hover:bg-dark-light-green active:bg-dark-dark-light-green mb-4"
      >
        Sign up
      </button>
      <div class="flex justify-center">
        <router-link class="text-sm mt-5" :to="{ name: 'SignIn' }"
          >Already have an account?
          <span class="text-dark-dark-light-green">Sign in</span></router-link
        >
      </div>
    </form>
  </div>
</template>
