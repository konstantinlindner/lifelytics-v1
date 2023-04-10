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
  <nav class="bg-light-grey h-screen w-72">
    <ul class="px-5 py-5">
      <li>Item 1</li>
      <li>Item 2</li>
      <li>Item 3</li>
      <li>Item 4</li>
      <li>Item 5</li>
      <li>Item 6</li>
    </ul>
  </nav>
</template>
