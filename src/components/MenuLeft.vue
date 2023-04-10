<script>
import store from "../store/index.js";
import { computed } from "vue";
export default {
  setup() {
    const user = computed(() => store.state.user);
    return { user };
  },
};
</script>

<template>
  <nav class="bg-light-grey h-screen">
    <router-link class="cursor-pointer select-none" :to="{ name: 'Home' }">
      <header
        class="flex bg-light-green items-center justify-center gap-x-4 w-72 h-24"
      >
        <img class="h-14" src="../assets/logo.png" />
        <h1 class="text-xl">
          <span class="font-normal">life</span
          ><span class="font-thin">lytics</span>
        </h1>
      </header></router-link
    >
  </nav>
</template>
