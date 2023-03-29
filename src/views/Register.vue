<script>
import { ref } from "vue";
import { supabase } from "../supabase.js";
import { useRouter } from "vue-router";
export default {
  name: "register",
  setup() {
    // create data / vars

    const router = useRouter();
    const firstName = ref(null);
    const lastName = ref(null);
    const dateOfBirth = ref(null);
    const email = ref(null);
    const phoneNumber = ref(null);
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

    return {
      firstName,
      lastName,
      dateOfBirth,
      email,
      phoneNumber,
      password,
      confirmPassword,
      errorMsg,
      register,
    };
  },
};
</script>

<template>
  <div class="max-w-screen-sm mx-auto px-4 py-10">
    <!-- Error Handling -->

    <div v-if="errorMsg" class="mb-10 p-4 rounded-md bg-light-grey shadow-lg">
      <p class="text-red-500">{{ errorMsg }}</p>
    </div>

    <!-- Register -->

    <form
      @submit.prevent="register"
      class="p-8 flex flex-col bg-light-grey rounded-md shadow-lg"
    >
      <h1 class="text-3xl text-black mb-4">Register</h1>

      <div class="flex flex-col mb-2">
        <label for="firstName" class="mb-1 text-sm text-black"
          >First name</label
        >
        <input
          type="text"
          required
          class="p-2 text-black focus:outline"
          id="firstName"
          v-model="firstName"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="lastName" class="mb-1 text-sm text-black">Last name</label>
        <input
          type="text"
          required
          class="p-2 text-black focus:outline"
          id="lastName"
          v-model="lastName"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="dateOfBirth" class="mb-1 text-sm text-black"
          >Date of birth</label
        >
        <input
          type="date"
          required
          class="p-2 text-black focus:outline"
          id="dateOfBirth"
          v-model="dateOfBirth"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="email" class="mb-1 text-sm text-black">Email</label>
        <input
          type="text"
          required
          class="p-2 text-black focus:outline"
          id="email"
          v-model="email"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="phone" class="mb-1 text-sm text-black">Phone number</label>
        <input
          type="number"
          class="p-2 text-black focus:outline"
          id="phone"
          v-model="phoneNumber"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="Password" class="mb-1 text-sm text-black">Password</label>
        <input
          type="password"
          required
          class="p-2 text-black focus:outline"
          id="Password"
          v-model="password"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="confirmPassword" class="mb-1 text-sm text-black"
          >Confirm password</label
        >
        <input
          type="password"
          required
          class="p-2 text-black focus:outline"
          id="confirmPassword"
          v-model="confirmPassword"
        />
      </div>
      <button
        type="submit"
        class="mt-6 py-2 px-6 rounded-sm self-start text-sm text-black bg-light-green duration-200 hover:bg-dark-light-green mb-4"
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
