<script>
import store from "../store/index.ts";
import { computed } from "vue";
import { supabase } from "../supabase.ts";
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
      <h1 class="text-xl">Manage your life like a pro</h1>
    </header>
    <body class="px-20 pt-6">
      <p class="pb-2">
        A base for your productivity and well-being as well as a tool to track
        your personal finances and life stats.
      </p>

      <router-link :to="{ name: 'SignIn' }">
        <span class="text-dark-light-green">Sign in</span></router-link
      >
      or
      <router-link :to="{ name: 'SignUp' }">
        <span class="text-dark-light-green">
          create an account</span
        ></router-link
      >
      to continue.
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
              :to="{ name: 'AddRecord' }"
            >
              <Icon icon="mdi:plus" width="20" />
              <p class="ml-1.5">Add record</p>
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
  <img class="mt-20 px-10 m-auto" src="../assets/data.svg" width="450" />
</template>
