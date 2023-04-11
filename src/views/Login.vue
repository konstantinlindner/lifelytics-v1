<script>
import { ref } from "vue";
import { supabase } from "../supabase.js";
import { useRouter } from "vue-router";
import { computed } from "vue";
import store from "../store/index.js";
export default {
  name: "login",
  setup() {
    // create data / vars

    const router = useRouter();
    const email = ref(null);
    const password = ref(null);
    const confirmPassword = ref(null);
    const errorMsg = ref(null);

    // login function

    const login = async () => {
      try {
        const { error } = await supabase.auth.signInWithPassword({
          email: email.value,
          password: password.value,
        });
        if (error) throw error;
        router.push({ name: "Home" });
      } catch (error) {
        errorMsg.value = `Error: ${error.message}`;
        setTimeout(() => {
          errorMsg.value = null;
        }, 5000);
      }
    };

    // Set user const

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

    return { email, password, errorMsg, login, user };
  },
};
</script>

<template>
  <div v-if="!user" class="max-w-screen-sm mx-auto px-4 py-10">
    <!-- Error Handling -->
    <div v-if="errorMsg" class="mb-10 p-4 rounded-md bg-light-grey shadow-lg">
      <p class="text-red-500">{{ errorMsg }}</p>
    </div>
    <!-- Login -->
    <form
      @submit.prevent="login"
      class="p-8 flex flex-col bg-light-grey rounded-md shadow-lg"
    >
      <h1 class="text-3xl text-black mb-4">Welcome back</h1>

      <div class="flex flex-col mb-2">
        <label for="email" class="mb-1 text-sm text-black">Email</label>
        <input
          type="text"
          required
          class="p-2 text-black focus:outline-none"
          id="email"
          v-model="email"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="password" class="mb-1 text-sm text-black">Password</label>
        <input
          type="password"
          required
          class="p-2 text-black focus:outline-none"
          id="password"
          v-model="password"
        />
      </div>
      <button
        type="submit"
        class="mt-6 py-2 px-6 rounded-sm self-start text-sm text-black bg-light-green duration-200 hover:bg-dark-light-green mb-4"
      >
        Sign in
      </button>
      <div class="flex justify-center">
        <router-link class="text-sm mt-5" :to="{ name: 'Register' }"
          >Don't have an account?
          <span class="text-dark-light-green">Sign up</span></router-link
        >
      </div>
    </form>
  </div>
</template>
