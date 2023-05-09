<script lang="ts">
import store from "../store/index.ts";
import { computed } from "vue";
import { Icon } from "@iconify/vue";
import DailyLog from "../components/DailyLog.vue";

export default {
  name: "Home",
  components: { Icon, DailyLog },
  setup() {
    const user = computed(() => store.state.user);

    return { user };
  },
};
</script>

<template>
  <div v-if="!user">
    <header class="px-16 pt-8">
      <h1 class="text-xl">Manage your life like a pro</h1>
    </header>
    <body class="px-16 pt-6">
      <p class="pb-2">
        A base for your productivity and well-being. Track and visualize your
        personal finances, health and life stats in one tool.
      </p>

      <router-link :to="{ name: 'SignIn' }">
        <span class="text-dark-dark-light-green">Sign in</span></router-link
      >
      or
      <router-link :to="{ name: 'SignUp' }">
        <span class="text-dark-dark-light-green">
          create an account</span
        ></router-link
      >
      to get started.

      <img class="mt-20 mx-auto" src="../assets/data.svg" width="500" />
    </body>
  </div>

  <div v-else>
    <span>
      <header class="flex px-8 pt-8">
        <h1 class="text-xl">Home</h1>

        <div class="flex flex-row justify-end ml-auto">
          <div class="flex flex-row items-center">
            <router-link
              class="bg-light-green duration-300 hover:bg-dark-light-green active:bg-dark-dark-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
              :to="{ name: 'AddRecord' }"
            >
              <Icon icon="mdi:plus" width="20" />
              <p class="ml-1.5 whitespace-nowrap">Add record</p>
            </router-link>
          </div>
        </div>
      </header>
    </span>
    <body class="px-8 pt-8">
      <DailyLog class="mt-4" />

      <img class="mt-20 mx-auto" src="../assets/data.svg" width="500" />
    </body>
  </div>
</template>
