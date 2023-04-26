<script>
import { ref } from "vue";
import { supabase } from "../supabase.ts";
import { useRouter } from "vue-router";
import { computed } from "vue";
import store from "../store/index.ts";
export default {
  name: "SignIn",
  setup() {
    // create data / vars

    const router = useRouter();
    const email = ref(null);
    const password = ref(null);
    const errorMsg = ref(null);

    // signIn function

    const signIn = async () => {
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

    return { email, password, errorMsg, signIn, user };
  },
};
</script>

<template>
  <div v-if="!user" class="w-96 mx-auto py-10">
    <!-- Error Handling -->
    <div v-if="errorMsg" class="mb-10 p-4 rounded-md bg-light-grey">
      <p class="text-red-500">{{ errorMsg }}</p>
    </div>
    <!-- signIn -->
    <form
      @submit.prevent="signIn"
      class="p-8 flex flex-col bg-light-light-grey rounded-md"
    >
      <h1 class="text-2xl mx-auto mb-2">Welcome back</h1>
      <p class="mx-auto mb-5">Enter your details below</p>

      <div class="flex flex-col mb-2">
        <label for="email" class="mb-1 text-sm">Email</label>
        <input
          type="text"
          required
          class="rounded-md p-2 focus:outline-none"
          id="email"
          v-model="email"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="password" class="mb-1 text-sm">Password</label>
        <input
          type="password"
          required
          class="rounded-md p-2 focus:outline-none"
          id="password"
          v-model="password"
        />
      </div>
      <button
        type="submit"
        class="min-w-full mt-6 py-2 px-6 rounded-md self-start text-sm bg-light-green duration-300 hover:bg-dark-light-green mb-4"
      >
        Sign in
      </button>
      <div class="flex justify-center">
        <router-link class="text-sm mt-5" :to="{ name: 'SignUp' }"
          >Don't have an account?
          <span class="text-dark-light-green">Sign up</span></router-link
        >
      </div>
    </form>
  </div>
</template>
