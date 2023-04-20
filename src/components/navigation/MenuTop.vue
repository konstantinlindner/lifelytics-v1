<script>
import store from "../../store/index.js";
import { computed } from "vue";
import { supabase } from "../../supabase.js";
import { useRouter } from "vue-router";
import { Icon } from "@iconify/vue";

export default {
  components: { Icon },
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
  <header class="bg-light-green h-24">
    <nav class="h-24 mx-5 gap-x-5 flex flex-row items-center justify-end">
      <router-link v-if="!user" class="cursor-pointer" :to="{ name: 'Home' }"
        >Home</router-link
      >

      <router-link v-if="!user" class="cursor-pointer" :to="{ name: 'Login' }"
        >Sign in</router-link
      >

      <router-link v-if="user" class="cursor-pointer" :to="{ name: 'Profile' }"
        >Profile</router-link
      >

      <li v-if="user" @click="logout" class="cursor-pointer list-none">
        Sign out
      </li>

      <button
        v-if="user"
        class="bg-dark-light-green hover:bg-light-blue duration-300 rounded-full w-8 h-8 flex items-center justify-center cursor-pointer"
        @click="logout"
      >
        <Icon icon="mdi:account" width="24" />
      </button>
    </nav>
  </header>
</template>
