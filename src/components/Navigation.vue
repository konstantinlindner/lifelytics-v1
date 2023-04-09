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
  <header class="bg-light-green text-black">
    <nav
      class="container py-5 px-4 flex flex-col gap-4 items-center sm:flex-row"
    >
      <router-link class="cursor-pointer" :to="{ name: 'Home' }">
        <div class="cursor-pointer select-none flex items-center gap-x-4">
          <img class="W-14" width="50" src="../assets/logo.png" />
          <h1 class="text-xl">
            <span class="font-normal">life</span
            ><span class="font-thin">lytics</span>
          </h1>
        </div></router-link
      >
      <ul class="flex flex-1 justify-end gap-x-10">
        <router-link v-if="!user" class="cursor-pointer" :to="{ name: 'Login' }"
          >Sign in</router-link
        >
        <li v-if="user" class="cursor-pointer">Profile</li>
        <li v-if="user" @click="logout" class="cursor-pointer">Sign out</li>
      </ul>
    </nav>
  </header>
</template>
