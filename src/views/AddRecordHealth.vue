<script lang="ts">
import { Icon } from "@iconify/vue";
import { ref, onMounted, watch } from "vue";

export default {
  name: "AddRecordHealth",
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
        case 3:
          target.querySelectorAll("button")[2].click();
          break;
      }
    },
  },
  setup() {
    const button1 = ref(false);
    const button2 = ref(false);
    const button3 = ref(false);

    const toggleButton1 = () => {
      button1.value = !button1.value;
    };

    const toggleButton2 = () => {
      button2.value = !button2.value;
    };

    const toggleButton3 = () => {
      button3.value = !button3.value;
    };

    return {
      button1,
      button2,
      button3,
      toggleButton1,
      toggleButton2,
      toggleButton3,
    };
  },
};
</script>

<template>
  <div class="px-8 py-8 mx-auto flex flex-col">
    <h1 class="text-xl mb-8">Health</h1>

    <label class="mb-1 ml-1">Search</label>
    <input
      type="text"
      value=""
      placeholder="Type something"
      class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-slate-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500"
    />

    <p class="mx-auto py-5">or</p>

    <label class="mb-1 ml-1">Choose category</label>
    <div class="mx-auto max-w-max">
      <div class="border min-w-max p-4 rounded-md">
        <div
          ref="optionSelector"
          class="min-w-max grid gap-4 grid-cols-3 rounded-md"
        >
          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">1</p>
              <Icon class="mx-auto" icon="mdi:weight-lifter" width="80" />
              <h1 class="mx-2">Workout</h1>
            </button>
          </router-link>

          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">2</p>
              <Icon class="mx-auto" icon="mdi:scale-bathroom" width="80" />
              <h1 class="mx-2">Weight</h1>
            </button>
          </router-link>

          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">3</p>
              <Icon class="mx-auto" icon="mdi:needle" width="80" />
              <h1 class="mx-2">Vaccination</h1>
            </button>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
