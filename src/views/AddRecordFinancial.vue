<script lang="ts">
import { Icon } from "@iconify/vue";
import { ref, onMounted, watch } from "vue";

export default {
  name: "AddRecordFinancial",
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
  <div class="px-8 py-8 mx-auto flex flex-col">
    <h1 class="text-xl mb-8">Financial</h1>

    <label class="mb-1 ml-1">Search</label>

    <input
      type="text"
      value=""
      placeholder="Type something"
      class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-slate-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500"
    />

    <p class="mx-auto py-5">or</p>

    <label class="mb-1 ml-1">Choose type</label>

    <div class="mx-auto max-w-max">
      <div class="min-w-max p-4 rounded-md border">
        <div
          ref="optionSelector"
          class="min-w-max grid gap-4 grid-cols-2 rounded-md"
        >
          <router-link :to="{ name: 'AddRecordFinancialIncome' }">
            <button
              class="relative border bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">1</p>
              <Icon class="mx-auto" icon="mdi:cash-plus" width="80" />
              <h1 class="mx-2">Income</h1>
            </button>
          </router-link>

          <router-link :to="{ name: 'AddRecordFinancialExpense' }">
            <button
              class="relative border bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">2</p>
              <Icon class="mx-auto" icon="mdi:cash-minus" width="80" />
              <h1 class="mx-2">Expense</h1>
            </button>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
