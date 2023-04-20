<script>
import store from "../store/index.js";
import { computed } from "vue";
import { Icon } from "@iconify/vue";

export default {
  components: { Icon },
  setup() {
    const user = computed(() => store.state.user);
    return { user };
  },
};
</script>

class="min-w-full mt-6 py-2 px-6 rounded-md self-start text-sm bg-light-green
duration-200 hover:bg-dark-light-green mb-4"

<template>
  <nav class="bg-light-light-grey h-screen w-72">
    <menu class="flex flex-col space-y-2 px-5 py-5">
      <li>
        <div class="flex flex-row items-center">
          <router-link
            class="duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
            :to="{ name: 'Home' }"
          >
            <Icon icon="mdi-light:home" />
            <p class="ml-2">Home</p>
          </router-link>
        </div>
      </li>

      <li>
        <router-link class="cursor-pointer" :to="{ name: 'Transactions' }">
          Transactions</router-link
        >
      </li>

      <li>
        <router-link class="cursor-pointer" :to="{ name: 'AddTransaction' }"
          >Add transaction</router-link
        >
      </li>
    </menu>
  </nav>
</template>
