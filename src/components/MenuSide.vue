<script>
import store from "../store/index.ts";
import { computed } from "vue";
import { Icon } from "@iconify/vue";
import AppLogo from "./AppLogo.vue";
import { ref, onMounted, watch } from "vue";

export default {
  name: "MenuSide",
  components: { Icon, AppLogo },
  setup() {
    const user = computed(() => store.state.user);

    // const isExpanded = ref(window.innerWidth >= 640);

    const isExpanded = ref(true);

    const toggleExpansion = () => {
      isExpanded.value = !isExpanded.value;
    };

    const handleResize = () => {
      if (window.innerWidth <= 1024) {
        isExpanded.value = false;
      } else {
        isExpanded.value = true;
      }
    };

    onMounted(() => {
      handleResize();
      window.addEventListener("resize", handleResize);
    });

    watch(user, () => {
      handleResize();
    });

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
      <div class="flex justify-center item-center h-24 w-64">
        <AppLogo />
      </div>
      <nav>
        <menu class="flex flex-col space-y-1 px-5 py-5">
          <li>
            <div class="flex flex-row items-center">
              <router-link
                class="duration-300 hover:bg-light-grey rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
                :to="{ name: 'Home' }"
              >
                <Icon icon="mdi:home-outline" width="20" />
                <p class="ml-1.5">Home</p>
              </router-link>
            </div>
          </li>

          <li class="flex flex-row items-center">
            <router-link
              class="duration-300 hover:bg-light-grey rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
              :to="{ name: 'Transactions' }"
            >
              <Icon icon="mdi:playlist-edit" width="20" />
              <p class="ml-1.5">Transactions</p>
            </router-link>
          </li>

          <li class="flex flex-row items-center">
            <router-link
              class="duration-300 hover:bg-light-grey rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
              :to="{ name: 'Flights' }"
            >
              <Icon icon="mdi:airplane-takeoff" width="20" />
              <p class="ml-1.5">Flights</p>
            </router-link>
          </li>

          <li class="flex flex-row items-center">
            <router-link
              class="duration-300 hover:bg-light-grey rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
              :to="{ name: 'Accommodation' }"
            >
              <Icon icon="mdi:bed-queen-outline" width="20" />
              <p class="ml-1.5">Accommodation</p>
            </router-link>
          </li>
        </menu>
      </nav>
    </div>

    <div v-else>
      <div class="flex justify-center item-center h-24 w-24">
        <AppLogo :hideText="true" />
      </div>

      <nav class="flex flex-col space-y-1 mt-5">
        <router-link
          class="duration-300 hover:bg-light-grey rounded-full p-2 mx-auto cursor-pointer"
          :to="{ name: 'Home' }"
        >
          <Icon icon="mdi:home-outline" width="25" />
        </router-link>

        <router-link
          class="duration-300 hover:bg-light-grey rounded-full p-2 mx-auto cursor-pointer"
          :to="{ name: 'Transactions' }"
        >
          <Icon icon="mdi:playlist-edit" width="25" />
        </router-link>

        <router-link
          class="duration-300 hover:bg-light-grey rounded-full p-2 mx-auto cursor-pointer"
          :to="{ name: 'Flights' }"
        >
          <Icon icon="mdi:airplane-takeoff" width="25" />
        </router-link>

        <router-link
          class="duration-300 hover:bg-light-grey rounded-full p-2 mx-auto cursor-pointer"
          :to="{ name: 'Accommodation' }"
        >
          <Icon icon="mdi:bed-queen-outline" width="25" />
        </router-link>
      </nav>
    </div>

    <button
      @click="toggleExpansion"
      class="mt-auto mb-8 mx-auto hover:bg-light-grey p-2 rounded-full duration-300"
    >
      <Icon
        width="20"
        :icon="
          isExpanded
            ? 'material-symbols:arrow-back-ios-new-rounded'
            : 'material-symbols:arrow-forward-ios-rounded'
        "
      />
    </button>
  </div>
</template>
