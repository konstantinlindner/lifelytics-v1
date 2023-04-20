<script>
import store from "../../store/index.js";
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
    <menu class="flex flex-col space-y-1 px-5 py-5">
      <li>
        <div class="flex flex-row items-center">
          <router-link
            class="duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
            :to="{ name: 'Home' }"
          >
            <Icon icon="mdi:home" width="20" />
            <p class="ml-1.5">Home</p>
          </router-link>
        </div>
      </li>

      <li>
        <div class="flex flex-row items-center">
          <router-link
            class="duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
            :to="{ name: 'Transactions' }"
          >
            <Icon icon="mdi:cash" width="20" />
            <p class="ml-1.5">Transactions</p>
          </router-link>
        </div>
      </li>
    </menu>
  </nav>
</template>
