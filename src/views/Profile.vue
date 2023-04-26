<script lang="ts">
import { computed } from "vue";
import store from "../store/index.ts";

export default {
  name: "Profile",
  components: {},
  setup() {
    const user = computed(() => store.state.user);

    return { user };
  },
};
</script>

<template>
  <div v-if="user" class="mx-10 my-10">
    <h1 class="text-xl">Profile</h1>
    <br />
    <p>ID: {{ user.id }}</p>
    <p>Email: {{ user.email }}</p>
    <p>Phone: {{ user.phone }}</p>
  </div>
</template>
