<script>
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
    };
  },
};
</script>

<template>
  <!-- <div class="flex">
    <AppLogo class="h-24 w-72" />
    <h1 class="ml-auto mr-5 my-auto">hello</h1>
  </div> -->

  <div v-if="!user" class="flex">
    <AppLogo class="h-24 w-72" />

    <div class="flex ml-auto mr-8 my-auto">
      <router-link
        v-if="!user"
        class="w-fit duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
        :to="{ name: 'Home' }"
      >
        <Icon icon="mdi:home" width="20" />
        <p class="ml-1.5">Home</p>
      </router-link>

      <router-link
        v-if="!user"
        class="w-fit duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
        :to="{ name: 'SignIn' }"
      >
        <Icon icon="mdi:login" width="20" />
        <p class="ml-1.5">Sign in</p>
      </router-link>
    </div>
  </div>

  <div v-else class="flex h-24">
    <div class="flex my-auto ml-auto mr-8">
      <button
        class="bg-light-green hover:bg-dark-light-green duration-300 rounded-full w-8 h-8 flex items-center justify-center cursor-pointer"
        @click="toggleProfileMenu"
      >
        <Icon icon="mdi:account" width="24" />
      </button>
    </div>
  </div>

  <div class="absolute right-2 top-20">
    <MenuTopProfile v-show="isProfileMenuVisible" />
  </div>
</template>
