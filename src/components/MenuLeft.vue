<script>
import store from "../store/index.js";
import { computed } from "vue";
import { Icon } from "@iconify/vue";
import Logo from "./Logo.vue";
import { ref } from "vue";

export default {
  name: "MenuLeft",
  components: { Icon, Logo },
  setup() {
    const user = computed(() => store.state.user);

    const isExpanded = ref(true);

    const toggleExpansion = () => {
      isExpanded.value = !isExpanded.value;
    };

    return { user, isExpanded, toggleExpansion };
  },
  data() {
    return {};
  },
};
</script>

<template>
  <div v-if="user" class="flex flex-col h-screen border-r">
    <div v-if="isExpanded">
      <div class="flex justify-center item-center h-24 w-72">
        <Logo />
      </div>
      <nav>
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

          <li class="flex flex-row items-center">
            <router-link
              class="duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
              :to="{ name: 'Transactions' }"
            >
              <Icon icon="mdi:cash" width="20" />
              <p class="ml-1.5">Transactions</p>
            </router-link>
          </li>

          <li class="flex flex-row items-center">
            <router-link
              class="duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
              :to="{ name: 'Flights' }"
            >
              <Icon icon="mdi:airplane" width="20" />
              <p class="ml-1.5">Flights</p>
            </router-link>
          </li>

          <li class="flex flex-row items-center">
            <router-link
              class="duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
              :to="{ name: 'Accommodation' }"
            >
              <Icon icon="mdi:home-city" width="20" />
              <p class="ml-1.5">Accommodation</p>
            </router-link>
          </li>
        </menu>
      </nav>
    </div>

    <div v-else>
      <div class="flex justify-center item-center h-24 w-24">
        <Logo :hideText="true" />
      </div>

      <nav class="flex flex-col space-y-2 mx-5 my-5">
        <router-link
          class="duration-300 hover:bg-light-green rounded-md px-2 py-1 m-auto cursor-pointer"
          :to="{ name: 'Home' }"
        >
          <Icon icon="mdi:home" width="30" />
        </router-link>

        <router-link
          class="duration-300 hover:bg-light-green rounded-md px-2 py-1 m-auto cursor-pointer"
          :to="{ name: 'Transactions' }"
        >
          <Icon icon="mdi:cash" width="30" />
        </router-link>

        <router-link
          class="duration-300 hover:bg-light-green rounded-md px-2 py-1 m-auto cursor-pointer"
          :to="{ name: 'Flights' }"
        >
          <Icon icon="mdi:airplane" width="30" />
        </router-link>

        <router-link
          class="duration-300 hover:bg-light-green rounded-md px-2 py-1 m-auto cursor-pointer"
          :to="{ name: 'Accommodation' }"
        >
          <Icon icon="mdi:home-city" width="30" />
        </router-link>
      </nav>
    </div>

    <button @click="toggleExpansion" class="mt-auto mb-5 mx-auto">
      <Icon
        :icon="
          isExpanded
            ? 'material-symbols:arrow-back-ios-new-rounded'
            : 'material-symbols:arrow-forward-ios-rounded'
        "
      />
    </button>
  </div>
</template>
