<script lang="ts">
import { Icon } from "@iconify/vue";
import { ref, onMounted, watch } from "vue";

export default {
  name: "AddRecordType",
  components: { Icon },
  mounted() {
    document.addEventListener("keydown", this.handleKeyDown);
  },
  destroyed() {
    document.removeEventListener("keydown", this.handleKeyDown);
  },
  methods: {
    handleKeyDown(event) {
      const target = this.$refs.optionSelector;
      const key = parseInt(event.key);
      switch (key) {
        case 1:
          target.querySelectorAll("button")[0].click();
          break;
        case 2:
          target.querySelectorAll("button")[1].click();
          break;
      }
    },
  },
  setup() {
    return {};
  },
};
</script>

<template>
  <div class="p-4 border rounded-md">
    <h1 class="text-xl mb-6 flex justify-center">Choose type</h1>
    <div
      ref="optionSelector"
      class="min-w-max grid gap-4 grid-cols-2 rounded-md"
    >
      <button
        class="relative border bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
        @click="goToHealth"
      >
        <p class="text-sm absolute top-2 left-3">1</p>
        <Icon class="mx-auto" icon="mdi:heart" width="80" />
        <h1 class="mx-2">Health</h1>
      </button>

      <button
        class="relative border bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
        @click="goToFinancial"
      >
        <p class="text-sm absolute top-2 left-3">2</p>
        <Icon class="mx-auto" icon="mdi:money" width="80" />
        <h1 class="mx-2">Financial</h1>
      </button>
    </div>
  </div>
</template>
