<script>
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
      const target = this.$refs.typeSelector;
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
  <div class="p-4 bg-light-light-grey rounded-md">
    <h1 class="text-xl mb-6 flex justify-center">Choose type</h1>
    <div ref="typeSelector" class="min-w-max grid gap-4 grid-cols-2 rounded-md">
      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click="toggleButton1"
      >
        <Icon icon="mdi:heart" width="80" />
        <h1 class="mx-2">Health</h1>
      </button>

      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click="toggleButton2"
      >
        <Icon icon="mdi:money" width="80" />
        <h1 class="mx-2">Financial</h1>
      </button>
    </div>
  </div>
</template>
