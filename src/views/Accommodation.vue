<script>
import { Icon } from "@iconify/vue";

export default {
  name: "Accommodation",
  components: { Icon },
  setup() {
    return {};
  },
};
</script>

<template>
  <header class="flex px-10 pt-8">
    <h1 class="text-xl">Accommodation</h1>
    <div class="flex flex-row justify-end ml-auto">
      <div class="flex flex-row items-center ml-5">
        <router-link
          class="bg-light-light-green duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
          :to="{ name: 'AddRecord' }"
        >
          <Icon icon="mdi:plus" width="20" />
          <p class="ml-1.5 whitespace-nowrap">Add accommodation</p>
        </router-link>
      </div>
    </div>
  </header>
  <body class="px-10 pt-8">
    Below is a table of all accommodations.
    <img class="mt-20 m-auto" src="../assets/accommodation.svg" width="500" />
  </body>
</template>
