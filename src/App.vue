<script>
import Navigation from "./components/Navigation.vue";

export default {
  components: {
    Navigation,
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
  <div>
    <Navigation />
    <router-view />
  </div>
</template>
