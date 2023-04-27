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
  <div class="flex">
    <AppLogo v-if="!user" class="h-24 w-64" />

    <div class="h-24"></div>

    <div class="flex ml-auto mr-8 my-auto space-x-1">
      <button
        @click="toggleDarkMode"
        class="hover:bg-light-grey rounded-full p-2 duration-300"
      >
        <Icon
          width="20"
          :icon="isDarkMode ? 'mdi:weather-sunny' : 'mdi:weather-night'"
        />
      </button>

      <router-link
        v-if="!user"
        class="hover:bg-light-grey rounded-full p-2 duration-300"
        :to="{ name: 'SignIn' }"
      >
        <Icon icon="mdi:login-variant" width="20" />
      </router-link>

      <button
        v-if="user"
        @click="toggleNotification"
        class="hover:bg-light-grey rounded-full p-2 duration-300"
      >
        <Icon
          width="20"
          :icon="isNotification ? 'mdi:bell-badge-outline' : 'mdi:bell-outline'"
        />
      </button>

      <button
        v-if="user"
        class="hover:bg-light-grey rounded-full p-2 duration-300"
        @click="toggleProfileMenu"
      >
        <Icon width="20" icon="mdi:account-outline" />
      </button>
    </div>
  </div>

  <div class="absolute right-2 top-20">
    <MenuTopProfile v-show="isProfileMenuVisible" />
  </div>
</template>
