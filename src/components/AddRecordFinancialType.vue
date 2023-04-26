<script lang="ts">
import { Icon } from "@iconify/vue";
import { ref, onMounted, watch } from "vue";

export default {
  name: "AddRecordFinancialType",
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
    const button1 = ref(false);
    const button2 = ref(false);

    const toggleButton1 = () => {
      button1.value = !button1.value;
    };

    const toggleButton2 = () => {
      button2.value = !button2.value;
    };

    return { button1, button2, toggleButton1, toggleButton2 };
  },
};
</script>

<template>
  <div class="min-w-max p-4 rounded-md border">
    <h1 class="text-xl mb-6 flex justify-center">Choose type</h1>
    <div
      ref="optionSelector"
      class="min-w-max grid gap-4 grid-cols-2 rounded-md"
    >
      <button
        class="relative border bg-light-light-grey hover:bg-light-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
        @click=""
      >
        <p class="text-sm absolute top-2 left-3">1</p>
        <Icon class="mx-auto" icon="mdi:cash-plus" width="80" />
        <h1 class="mx-2">Income</h1>
      </button>

      <button
        class="relative border bg-light-light-grey hover:bg-light-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
        @click=""
      >
        <p class="text-sm absolute top-2 left-3">2</p>
        <Icon class="mx-auto" icon="mdi:cash-minus" width="80" />
        <h1 class="mx-2">Expense</h1>
      </button>
    </div>
  </div>
</template>
