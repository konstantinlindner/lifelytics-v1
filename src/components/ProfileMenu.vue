<script>
import { Icon } from "@iconify/vue";
import { supabase } from "../supabase.js";
import { useRouter } from "vue-router";

export default {
  name: "ProfileMenu",
  components: { Icon },
  methods: {
    close() {
      this.$emit("close");
    },
  },
  setup() {
    // setup ref to router
    const router = useRouter();

    // logout function
    const logout = async () => {
      await supabase.auth.signOut();
      router.push({ name: "Home" });
    };

    return { logout };
  },
};
</script>

<template>
  <div class="bg-white shadow-lg rounded-md">
    <div class="flex flex-col mx-2 my-2 w-40">
      <header class="ml-auto"></header>

      <router-link
        @click="close"
        class="duration-300 hover:bg-dark-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
        :to="{ name: 'Profile' }"
      >
        <Icon icon="mdi:home" width="20" />
        <p class="ml-1.5">Profile</p>
      </router-link>
    </div>

    <li class="list-none">
      <div class="flex flex-row items-center">
        <button
          @click="logout"
          class="duration-300 hover:bg-dark-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
        >
          <Icon icon="mdi:login" width="20" />
          <p class="ml-1.5">Sign out</p>
        </button>
      </div>
    </li>
  </div>
</template>
