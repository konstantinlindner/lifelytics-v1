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
    <nav
      class="container py-5 px-4 flex flex-col gap-4 items-center sm:flex-row h-24"
    >
      <ul class="flex flex-1 justify-end gap-x-10">
        <router-link class="cursor-pointer" :to="{ name: 'Home' }"
          >Home</router-link
        >

        <router-link v-if="!user" class="cursor-pointer" :to="{ name: 'Login' }"
          >Sign in</router-link
        >

        <router-link v-if="user" class="cursor-pointer" :to="{ name: 'Home' }"
          >Profile</router-link
        >

        <li v-if="user" @click="logout" class="cursor-pointer">Sign out</li>
      </ul>
    </nav>
  </header>
</template>
