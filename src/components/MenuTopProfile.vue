<script lang="ts">
import { Icon } from "@iconify/vue";
import { supabase } from "../supabase.ts";
import { useRouter } from "vue-router";

export default {
  name: "MenuTopProfile",
  components: { Icon },

  setup() {
    // setup ref to router
    const router = useRouter();

    // sign out function
    const signOut = async () => {
      await supabase.auth.signOut();
      router.push({ name: "Home" });
    };

    return { signOut };
  },
};
</script>

<template>
  <div class="bg-white shadow-md border rounded-md">
    <router-link
      @click=""
      class="duration-300 hover:bg-light-grey rounded-md px-2 py-1 flex flex-row items-center cursor-pointer w-28"
      :to="{ name: 'Profile' }"
    >
      <Icon icon="mdi:account-check-outline" width="20" />
      <p class="ml-1.5">Profile</p>
    </router-link>

    <router-link
      @click=""
      class="duration-300 hover:bg-light-grey rounded-md px-2 py-1 flex flex-row items-center cursor-pointer w-28"
      :to="{ name: 'Settings' }"
    >
      <Icon icon="mdi:cog-outline" width="20" />
      <p class="ml-1.5">Settings</p>
    </router-link>

    <button
      @click="signOut"
      class="duration-300 hover:bg-light-grey rounded-md px-2 py-1 flex flex-row items-center cursor-pointer w-28"
    >
      <Icon icon="mdi:logout-variant" width="20" />
      <p class="ml-1.5">Sign out</p>
    </button>
  </div>
</template>
