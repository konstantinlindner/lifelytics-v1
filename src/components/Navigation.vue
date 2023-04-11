<script>
import store from "../store/index.js";
import { computed } from "vue";
import { supabase } from "../supabase.js";
import { useRouter } from "vue-router";
export default {
  setup() {
    // get user from store
    const user = computed(() => store.state.user);

    // setup ref to router
    const router = useRouter();

    // logout function
    const logout = async () => {
      await supabase.auth.signOut();
      router.push({ name: "Home" });
    };

    return { logout, user };
  },
};
</script>

<template>
  <header class="bg-light-green">
    <nav class="h-24 px-10 gap-x-5 flex flex-row items-center justify-end">
      <router-link v-if="user" class="cursor-pointer" :to="{ name: 'Home' }"
        >Home</router-link
      >

      <router-link v-if="!user" class="cursor-pointer" :to="{ name: 'Login' }"
        >Sign in</router-link
      >

      <router-link v-if="user" class="cursor-pointer" :to="{ name: 'Home' }"
        >Profile</router-link
      >

      <li v-if="user" @click="logout" class="cursor-pointer list-none">
        Sign out
      </li>
    </nav>
  </header>
</template>
