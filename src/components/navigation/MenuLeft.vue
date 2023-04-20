<script>
import store from "../../store/index.js";
import { computed } from "vue";
import { Icon } from "@iconify/vue";

export default {
  name: "MenuLeft",
  components: { Icon },
  setup() {
    const user = computed(() => store.state.user);
    return { user };
  },
};
</script>

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

      <li>
        <div class="flex flex-row items-center">
          <router-link
            class="duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
            :to="{ name: 'Flights' }"
          >
            <Icon icon="mdi:airplane" width="20" />
            <p class="ml-1.5">Flights</p>
          </router-link>
        </div>
      </li>

      <li>
        <div class="flex flex-row items-center">
          <router-link
            class="duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
            :to="{ name: 'Accommodation' }"
          >
            <Icon icon="mdi:home-city" width="16" />
            <p class="ml-1.5">Accommodation</p>
          </router-link>
        </div>
      </li>
    </menu>
  </nav>
</template>
