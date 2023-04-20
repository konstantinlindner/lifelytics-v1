<script>
import { Icon } from "@iconify/vue";

export default {
  name: "Logo",
  components: { Icon },
  setup() {},
};
</script>

<template>
  <header class="w-72 h-24 flex items-center justify-center">
    <router-link
      class="cursor-pointer select-none flex items-center gap-x-3"
      :to="{ name: 'Home' }"
    >
      <Icon
        icon="streamline:health-medical-heart-rate-health-beauty-information-data-beat-pulse-monitor-heart-rate-info"
        width="50"
      />

      <h1 class="text-xl">
        <span class="font-normal">life</span
        ><span class="font-thin">lytics</span>
      </h1>
    </router-link>
  </header>
</template>
