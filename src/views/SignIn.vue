<script lang="ts">
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
          email: email.value!,
          password: password.value!,
        });
        if (error) throw error;
        router.push({ name: "Home" });
      } catch (error) {
        errorMsg.value = error.message;
        setTimeout(() => {
          errorMsg.value = null;
        }, 5000);
      }
    };

    // Set user const
    const user = computed(() => store.state.user);

    return { email, password, errorMsg, signIn, user };
  },
};
</script>

<template>
  <div v-if="!user" class="w-96 mx-auto py-10">
    <!-- signIn -->
    <form
      @submit.prevent="signIn"
      class="p-8 flex flex-col border shadow-lg rounded-md"
    >
      <h1 class="text-2xl mx-auto mb-2">Welcome back</h1>
      <p class="mx-auto mb-5">Enter your details below</p>

      <div class="flex flex-col mb-2">
        <label for="email" class="mb-1 text-sm">Email</label>
        <input
          type="text"
          required
          placeholder="Email"
          id="email"
          v-model="email"
          class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-pink-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500 placeholder-shown:invalid:border-slate-300 placeholder-shown:invalid:text-slate-600 placeholder-shown:focus:invalid:border-light-green placeholder-shown:focus:invalid:ring-light-green"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="password" class="mb-1 text-sm">Password</label>
        <input
          type="password"
          required
          placeholder="**********"
          id="password"
          v-model="password"
          class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-pink-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500 placeholder-shown:invalid:border-slate-300 placeholder-shown:invalid:text-slate-600 placeholder-shown:focus:invalid:border-light-green placeholder-shown:focus:invalid:ring-light-green"
        />
      </div>

      <!-- Error Handling -->
      <div v-if="errorMsg" class="mx-auto">
        <p class="text-red-500 mt-3">{{ errorMsg }}</p>
      </div>

      <button
        type="submit"
        class="min-w-full mt-6 py-2 px-6 rounded-md self-start text-sm bg-light-green duration-300 hover:bg-dark-light-green active:bg-dark-dark-light-green mb-4"
      >
        Sign in
      </button>
      <div class="flex justify-center">
        <router-link class="text-sm mt-5" :to="{ name: 'SignUp' }"
          >Don't have an account?
          <span class="text-dark-dark-light-green">Sign up</span></router-link
        >
      </div>
    </form>
  </div>
</template>
