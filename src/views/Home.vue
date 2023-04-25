<script>
import store from "../store/index.js";
import { computed } from "vue";
import { supabase } from "../supabase.js";
import { Icon } from "@iconify/vue";

export default {
  name: "Home",
  components: { Icon },
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
    <header class="px-20 pt-8">
      <h1 class="text-xl">Welcome to lifelytics!</h1>
    </header>
    <body class="px-20 pt-8">
      <p>Sign in or create an account to continue.</p>
    </body>
  </div>

  <div v-else>
    <span>
      <header class="flex px-10 pt-8">
        <h1 class="text-xl">Grove Street - Home</h1>

        <div class="flex flex-row justify-end ml-auto">
          <div class="flex flex-row items-center ml-5">
            <router-link
              class="bg-light-light-green duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
              :to="{ name: 'AddItem' }"
            >
              <Icon icon="mdi:plus" width="20" />
              <p class="ml-1.5">Add item</p>
            </router-link>
          </div>
        </div>
      </header>
    </span>
    <body class="px-10 pt-8">
      <p>At least it was before I fucked everything up.</p>
      <p>
        <span>Welcome back </span><span class="italic">{{ user.email }}</span>
      </p>
    </body>
  </div>
  <img class="mt-20 m-auto" src="../assets/data.svg" width="450" />
</template>
