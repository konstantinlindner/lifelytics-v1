<script>
import { ref } from "vue";
import { supabase } from "../supabase.js";
import { useRouter } from "vue-router";
import { computed } from "vue";
import store from "../store/index.js";

export default {
  name: "addTransaction",
  setup() {
    // create data / vars

    const router = useRouter();
    const name = ref(null);
    const amount = ref(null);
    const errorMsg = ref(null);

    // Set user const

    const user = computed(() => store.state.user);

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

    return { name, amount, errorMsg, user };
  },
};
</script>

<template>
  <div v-if="user" class="px-4 py-4">
    <!-- Error Handling -->

    <div v-if="errorMsg" class="mb-10 p-4 rounded-md bg-light-grey shadow-lg">
      <p class="text-red-500">{{ errorMsg }}</p>
    </div>

    <!-- Login -->

    <form
      class="max-w-screen-sm p-8 flex flex-col bg-light-grey rounded-md shadow-lg"
    >
      <h1 class="text-3xl mb-4">New transaction</h1>

      <div class="flex flex-col mb-2">
        <label for="name" class="mb-1 text-sm">Name</label>
        <input
          type="text"
          required
          class="rounded-md p-2 focus:outline-none"
          id="name"
          v-model="name"
        />
      </div>

      <div class="flex flex-col mb-2">
        <label for="amount" class="mb-1 text-sm">Amount</label>
        <input
          type="number"
          required
          class="rounded-md p-2 focus:outline-none"
          id="amount"
          v-model="amount"
        />
      </div>
      <button
        type="submit"
        class="mt-6 py-2 px-6 rounded-md self-start text-sm bg-light-green duration-200 hover:bg-dark-light-green mb-4"
      >
        Next
      </button>
    </form>
  </div>
</template>
