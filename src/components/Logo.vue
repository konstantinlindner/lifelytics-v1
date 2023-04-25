<script>
import { Icon } from "@iconify/vue";

export default {
  name: "Logo",
  components: { Icon },
  props: {
    hideText: {
      type: Boolean,
      required: false,
      default: false,
    },
  },
  setup() {},
};
</script>

<template>
  <header class="flex items-center justify-center">
    <router-link
      class="cursor-pointer select-none flex items-center gap-x-3"
      :to="{ name: 'Home' }"
    >
      <Icon
        icon="streamline:health-medical-heart-rate-health-beauty-information-data-beat-pulse-monitor-heart-rate-info"
        width="50"
      />

      <h1 v-if="!hideText" class="text-xl">
        <span class="font-normal">life</span
        ><span class="font-thin">lytics</span>
      </h1>
    </router-link>
  </header>
</template>
