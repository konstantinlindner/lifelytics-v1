<script lang="ts">
import { supabase } from "./supabase.ts";
import store from "./store/index.ts";
import { computed } from "vue";

import MenuTop from "./components/MenuTop.vue";
import SignIn from "./views/SignIn.vue";
import Home from "./views/Home.vue";
import SignUp from "./views/SignUp.vue";
import MenuSide from "./components/MenuSide.vue";
import AppLogo from "./components/AppLogo.vue";
import AddRecord from "./views/AddRecord.vue";
import Flights from "./views/Flights.vue";
import Accommodation from "./views/Accommodation.vue";

export default {
  name: "App",
  components: {
    MenuTop,
    Home,
    SignIn,
    SignUp,
    MenuSide,
    AppLogo,
    AddRecord,
    Flights,
    Accommodation,
  },

  setup() {
    // Create data / vars

    // Get user data

    async function getUserData() {
      const {
        data: { user },
      } = await supabase.auth.getUser();
    }

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
  <div class="font-Roboto box-border flex h-screen w-screen">
    <MenuSide />

    <div class="flex flex-col w-screen">
      <MenuTop />

      <router-view />
    </div>
  </div>
</template>

<style>
@import url("https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap");
</style>
