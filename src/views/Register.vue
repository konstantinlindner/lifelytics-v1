<script>
import { ref } from "vue";
import { supabase } from "../supabase.js";
import { useRouter } from "vue-router";
import { computed } from "vue";
import store from "../store/index.js";
export default {
  name: "Register",
  setup() {
    // create data / vars

    const router = useRouter();

    const firstName = ref(null);
    const lastName = ref(null);
    const email = ref(null);
    const password = ref(null);
    const confirmPassword = ref(null);
    const errorMsg = ref(null);

    // register function

    const register = async () => {
      if (password.value === confirmPassword.value) {
        try {
          const { error } = await supabase.auth.signUp({
            email: email.value,
            password: password.value,
          });
          if (error) throw error;
          router.push({ name: "Login" });
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
      register,
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

    <!-- Register -->

    <form
      @submit.prevent="register"
      class="p-8 flex flex-col bg-light-grey rounded-md"
    >
      <h1 class="text-3xl mb-4">Register</h1>

      <div class="flex flex-col mb-2">
        <label for="firstName" class="mb-1 text-sm">First name</label>
        <input
          type="text"
          required
          class="rounded-md p-2 focus:outline-none"
          id="firstName"
          v-model="firstName"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="lastName" class="mb-1 text-sm">Last name</label>
        <input
          type="text"
          required
          class="rounded-md p-2 focus:outline-none"
          id="lastName"
          v-model="lastName"
        />
      </div>

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
        <label for="Password" class="mb-1 text-sm">Password</label>
        <input
          type="password"
          required
          class="rounded-md p-2 focus:outline-none"
          id="Password"
          v-model="password"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="confirmPassword" class="mb-1 text-sm"
          >Confirm password</label
        >
        <input
          type="password"
          required
          class="rounded-md p-2 focus:outline-none"
          id="confirmPassword"
          v-model="confirmPassword"
        />
      </div>
      <button
        type="submit"
        class="min-w-full mt-6 py-2 px-6 rounded-md self-start text-sm bg-light-green duration-300 hover:bg-dark-light-green mb-4"
      >
        Register
      </button>
      <div class="flex justify-center">
        <router-link class="text-sm mt-5" :to="{ name: 'Login' }"
          >Already have an account?
          <span class="text-dark-light-green">Sign in</span></router-link
        >
      </div>
    </form>
  </div>
</template>
