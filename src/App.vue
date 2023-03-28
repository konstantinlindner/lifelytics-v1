<script>
import Navigation from "./components/Navigation.vue";
import Login from "./views/Login.vue";
import Home from "./views/Home.vue";
import Register from "./views/Register.vue";

export default {
  components: {
    Navigation,
    Home,
    Login,
    Register,
  },
  setup() {
    // Create data / vars
    // Check to see if user is already logged in
    // If user does not exist, need to make app ready
    // Runs when there is a auth state change
    // if user is logged in, this will fire

    return {};
  },
};
</script>

<template>
  <div class="min-h-full font-Roboto box-border">
    <Navigation />
    <router-view />
  </div>
</template>

<style>
@import url("https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap");
</style>
