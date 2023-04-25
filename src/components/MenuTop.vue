<script>
import store from "../store/index.js";
import { computed } from "vue";
import { supabase } from "../supabase.js";
import { useRouter } from "vue-router";
import { Icon } from "@iconify/vue";
import Logo from "./Logo.vue";
import ProfileMenu from "./ProfileMenu.vue";
import { ref } from "vue";

export default {
  name: "MenuTop",
  components: { Icon, Logo, ProfileMenu },
  data() {
    return {};
  },
  methods: {},
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

    // profile menu

    const isProfileMenuVisible = ref(false);

    const toggleProfileMenu = () => {
      isProfileMenuVisible.value = !isProfileMenuVisible.value;
    };

    const closeProfileMenu = () => {
      isProfileMenuVisible.value = false;
    };

    return {
      logout,
      user,
      isProfileMenuVisible,
      toggleProfileMenu,
      closeProfileMenu,
    };
  },
};
</script>

<template>
  <header class="flex flex-row h-24">
    <div v-if="!user" class="flex justify-center item-center h-24 w-72">
      <Logo />
    </div>
    <nav
      class="h-24 mx-8 gap-x-1 flex flex-row items-center justify-end ml-auto"
    >
      <li v-if="!user" class="list-none">
        <div class="flex flex-row items-center">
          <router-link
            class="duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
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
            class="duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
            :to="{ name: 'Login' }"
          >
            <Icon icon="mdi:login" width="20" />
            <p class="ml-1.5">Sign in</p>
          </router-link>
        </div>
      </li>

      <button
        v-if="user"
        class="bg-light-green hover:bg-dark-light-green duration-300 rounded-full w-8 h-8 flex items-center justify-center cursor-pointer"
        @click="toggleProfileMenu"
      >
        <Icon icon="mdi:account" width="24" />
      </button>
    </nav>
  </header>

  <div class="absolute right-2 top-20">
    <ProfileMenu v-show="isProfileMenuVisible" />
  </div>
</template>
