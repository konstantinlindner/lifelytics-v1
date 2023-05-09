<script lang="ts">
import { Icon } from "@iconify/vue";

export default {
  name: "DailyLog",
  components: { Icon },

  setup() {},
};
</script>

<template>
  <div class="bg-white shadow-inner border rounded-md">
    <ul class="space-x-1 flex flex-row mx-2">
      <li class="flex flex-row items-center">
        <router-link
          class="duration-300 hover:bg-light-grey rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
          :to="{ name: 'Transactions' }"
        >
          <Icon icon="mdi:bed" width="20" />
          <p class="ml-1.5">Sleep</p>
        </router-link>
      </li>

      <li class="flex flex-row items-center">
        <router-link
          class="duration-300 hover:bg-light-grey rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
          :to="{ name: 'Transactions' }"
        >
          <Icon icon="mdi:pill" width="20" />
          <p class="ml-1.5">Medication</p>
        </router-link>
      </li>

      <li class="flex flex-row items-center">
        <router-link
          class="duration-300 hover:bg-light-grey rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
          :to="{ name: 'Transactions' }"
        >
          <Icon icon="mdi:fencing" width="20" />
          <p class="ml-1.5">Sex</p>
        </router-link>
      </li>
    </ul>
  </div>
</template>
