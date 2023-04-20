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
  <nav class="bg-light-light-grey h-screen w-72">
    <div class="px-5 py-5">
      <ul class="">
        <router-link v-if="user" class="cursor-pointer" :to="{ name: 'Home' }"
          >Home</router-link
        >
      </ul>
      <ul class="pt-2">
        <router-link
          v-if="user"
          class="cursor-pointer"
          :to="{ name: 'AddTransaction' }"
          >Add transaction</router-link
        >
      </ul>
    </div>
  </nav>
</template>
