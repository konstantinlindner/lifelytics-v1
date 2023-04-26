<script lang="ts">
import store from "../store/index.ts";
import { computed } from "vue";
import { supabase } from "../supabase.ts";
import { useRouter } from "vue-router";
import { Icon } from "@iconify/vue";
import AppLogo from "./AppLogo.vue";
import MenuTopProfile from "./MenuTopProfile.vue";
import { ref } from "vue";

export default {
  name: "MenuTop",
  components: { Icon, AppLogo, MenuTopProfile },

  setup() {
    // get user from store
    const user = computed(() => store.state.user);

    // setup ref to router
    const router = useRouter();

    // sign out function
    const signOut = async () => {
      await supabase.auth.signOut();
      router.push({ name: "Home" });
    };

    // profile menu

    const isNotification = ref(true);

    const toggleNotification = () => {
      isNotification.value = !isNotification.value;
    };

    const isDarkMode = ref(false);

    const toggleDarkMode = () => {
      isDarkMode.value = !isDarkMode.value;
    };

    const isProfileMenuVisible = ref(false);

    const toggleProfileMenu = () => {
      isProfileMenuVisible.value = !isProfileMenuVisible.value;
    };

    const closeProfileMenu = () => {
      isProfileMenuVisible.value = false;
    };

    return {
      signOut,
      user,
      isProfileMenuVisible,
      toggleProfileMenu,
      closeProfileMenu,
      isDarkMode,
      toggleDarkMode,
      isNotification,
      toggleNotification,
    };
  },
};
</script>

<template>
  <div v-if="!user" class="flex">
    <AppLogo class="h-24 w-64" />

    <div class="flex ml-auto mr-8 my-auto space-x-1">
      <router-link
        v-if="!user"
        class="w-fit duration-300 hover:bg-light-green active:bg-dark-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
        :to="{ name: 'Home' }"
      >
        <Icon icon="mdi:home-outline" width="20" />
        <p class="ml-1.5">Home</p>
      </router-link>

      <router-link
        v-if="!user"
        class="w-fit duration-300 hover:bg-light-green active:bg-dark-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
        :to="{ name: 'SignIn' }"
      >
        <Icon icon="mdi:login-variant" width="20" />
        <p class="whitespace-nowrap ml-1.5">Sign in</p>
      </router-link>
    </div>
  </div>

  <div v-else class="flex h-24">
    <div class="flex my-auto ml-auto mr-8 space-x-1">
      <button
        @click="toggleDarkMode"
        class="hover:bg-light-grey rounded-full p-2 duration-300"
      >
        <Icon
          class="mx-auto"
          width="25"
          :icon="isDarkMode ? 'mdi:weather-sunny' : 'mdi:weather-night'"
        />
      </button>

      <button
        @click="toggleNotification"
        class="hover:bg-light-grey rounded-full p-2 duration-300"
      >
        <Icon
          class="mx-auto"
          width="25"
          :icon="isNotification ? 'mdi:bell-badge-outline' : 'mdi:bell-outline'"
        />
      </button>

      <button
        class="mx-auto hover:bg-light-grey rounded-full p-2 duration-300"
        @click="toggleProfileMenu"
      >
        <Icon class="mx-auto" width="25" icon="mdi:account-outline" />
      </button>
    </div>
  </div>

  <div class="absolute right-2 top-20">
    <MenuTopProfile v-show="isProfileMenuVisible" />
  </div>
</template>
