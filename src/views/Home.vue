<script>
import store from "../store/index.js";
import { computed } from "vue";
import { supabase } from "../supabase.js";

export default {
  name: "home",
  components: {},
  setup() {
    const user = computed(() => store.state.user);
    console.log(user);

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
  <div v-if="!user" class="mx-10 my-10">
    <h1 class="text-xl">Welcome to lifelytics!</h1>
    <br />
    <p>Please sign in to continue.</p>
  </div>
  <div v-else class="mx-10 my-10">
    <h1 class="text-xl">
      <span>Welcome back </span><span class="italic">{{ user.email }}</span>
    </h1>
    <br />
    <p></p>
  </div>
</template>
