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
    <header class="bg-light-green w-72 h-24 flex items-center justify-center">
      <router-link
        class="cursor-pointer select-none flex items-center justify-center gap-x-4"
        :to="{ name: 'Home' }"
      >
        <img class="h-14" src="../assets/logo.png" />
        <h1 class="text-xl">
          <span class="font-normal">life</span
          ><span class="font-thin">lytics</span>
        </h1>
      </router-link>
    </header>
  </nav>
</template>
