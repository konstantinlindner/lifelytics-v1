<script>
import store from "../store/index.js";
import { computed } from "vue";
import { supabase } from "../supabase.js";

export default {
  name: "Home",
  components: {},
  setup() {
    const user = computed(() => store.state.user);

    async function getUserData() {
      const {
        data: { user },
      } = await supabase.auth.getUser();
    }

    getUserData();

    return { user };
  },
};
</script>

<template>
  <div v-if="!user">
    <header class="px-10 pt-8">
      <h1 class="text-xl">Welcome to lifelytics!</h1>
    </header>
    <body class="px-10 pt-8">
      <p>Please sign in to continue.</p>
    </body>
  </div>

  <div v-else>
    <header class="px-10 pt-8">
      <h1 class="text-xl">Home</h1>
    </header>
    <body class="px-10 pt-8">
      <p>
        <span>Welcome back </span><span class="italic">{{ user.email }}</span>
      </p>
    </body>
  </div>
  <img class="mt-20 m-auto" src="../assets/data.svg" width="450" />
</template>
