<script>
import { computed } from "vue";
import store from "../store/index.ts";
import { supabase } from "../supabase.ts";
import { useRouter } from "vue-router";

export default {
  name: "Settings",
  components: {},
  setup() {
    const user = computed(() => store.state.user);

    const router = useRouter();

    // If already logged in, redirect to home

    async function redirectSignedIn() {
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (!user) {
        router.push({ name: "Home" });
      }
    }

    redirectSignedIn();

    return { user };
  },
};
</script>

<template>
  <div v-if="user" class="mx-10 my-10">
    <h1 class="text-xl">Settings</h1>
    <br />
    <p>ID: {{ user.id }}</p>
    <p>Email: {{ user.email }}</p>
    <p>Phone: {{ user.phone }}</p>
  </div>
</template>
