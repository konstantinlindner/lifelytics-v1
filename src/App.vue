<script>
import Navigation from "./components/Navigation.vue";
import Login from "./views/Login.vue";
import Home from "./views/Home.vue";
import Register from "./views/Register.vue";
import { ref } from "vue";
import { supabase } from "./supabase.js";
import store from "./store/index.js";
import MenuLeft from "./components/MenuLeft.vue";
import { computed } from "vue";
import Logo from "./components/Logo.vue";

export default {
  components: {
    Navigation,
    Home,
    Login,
    Register,
    MenuLeft,
    Logo,
  },
  setup() {
    // Create data / vars

    // const user = ref(null);

    // Get user data

    // async function getUserData() {
    //   const {
    //     data: { user },
    //   } = await supabase.auth.getUser();
    // }

    // Runs when there is a auth state change

    supabase.auth.onAuthStateChange((_, session) => {
      store.methods.setUser(session);
    });

    const user = computed(() => store.state.user);

    return { user };
  },
};
</script>

<template>
  <div class="min-h-full font-Roboto box-border">
    <div class="flex">
      <div><logo /></div>
      <div class="w-screen">
        <Navigation />
      </div>
    </div>
    <div class="flex">
      <div v-if="user"><MenuLeft /></div>
      <div class="w-screen">
        <router-view />
      </div>
    </div>
  </div>
</template>

<style>
@import url("https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap");
</style>
