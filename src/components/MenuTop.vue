<script>
import store from "../store/index.js";
import { computed } from "vue";
import { supabase } from "../supabase.js";
import { useRouter } from "vue-router";
import { Icon } from "@iconify/vue";
import Logo from "./Logo.vue";

export default {
  name: "MenuTop",
  components: { Icon, Logo },
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
  <header class="flex flex-row h-24">
    <div class="mr-auto" v-if="!user"><Logo /></div>
    <nav
      class="h-24 mx-5 gap-x-1 flex flex-row items-center justify-end ml-auto"
    >
      <li v-if="!user" class="list-none">
        <div class="flex flex-row items-center">
          <router-link
            class="duration-300 hover:bg-dark-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
            :to="{ name: 'Home' }"
          >
            <Icon icon="mdi:home" width="20" />
            <p class="ml-1.5">Home</p>
          </router-link>
        </div>
      </li>

      <li v-if="!user" class="list-none">
        <div class="flex flex-row items-center">
          <router-link
            class="duration-300 hover:bg-dark-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
            :to="{ name: 'Login' }"
          >
            <Icon icon="mdi:login" width="20" />
            <p class="ml-1.5">Sign in</p>
          </router-link>
        </div>
      </li>

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