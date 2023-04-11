<script>
import { ref } from "vue";
import { supabase } from "../supabase.js";
import { useRouter } from "vue-router";
import { computed } from "vue";
import store from "../store/index.js";
export default {
  name: "home",
  components: {},
  setup() {
    const user = computed(() => store.state.user);
    const router = useRouter();

    // If not logged in, redirect to sign in page

    async function redirectNotSignedIn() {
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (!user) {
        router.push({ name: "Login" });
      }
    }

    redirectNotSignedIn();

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
