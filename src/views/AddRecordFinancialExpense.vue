<script lang="ts">
import { Icon } from "@iconify/vue";
import { ref } from "vue";

export default {
  name: "AddRecordFinancialExpense",
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
        case 4:
          target.querySelectorAll("button")[3].click();
          break;
        case 5:
          target.querySelectorAll("button")[4].click();
          break;
        case 6:
          target.querySelectorAll("button")[5].click();
          break;
        case 7:
          target.querySelectorAll("button")[6].click();
          break;
        case 8:
          target.querySelectorAll("button")[7].click();
          break;
        case 9:
          target.querySelectorAll("button")[8].click();
          break;
      }
    },
  },
  setup() {
    const button1 = ref(false);
    const button2 = ref(false);
    const button3 = ref(false);
    const button4 = ref(false);
    const button5 = ref(false);
    const button6 = ref(false);
    const button7 = ref(false);
    const button8 = ref(false);
    const button9 = ref(false);

    const toggleButton1 = () => {
      button1.value = !button1.value;
    };

    const toggleButton2 = () => {
      button2.value = !button2.value;
    };

    const toggleButton3 = () => {
      button3.value = !button3.value;
    };

    const toggleButton4 = () => {
      button4.value = !button4.value;
    };

    const toggleButton5 = () => {
      button5.value = !button5.value;
    };

    const toggleButton6 = () => {
      button6.value = !button6.value;
    };

    const toggleButton7 = () => {
      button7.value = !button7.value;
    };

    const toggleButton8 = () => {
      button8.value = !button8.value;
    };

    const toggleButton9 = () => {
      button9.value = !button9.value;
    };

    return {
      button1,
      button2,
      button3,
      button4,
      button5,
      button6,
      button7,
      button8,
      button9,
      toggleButton1,
      toggleButton2,
      toggleButton3,
      toggleButton4,
      toggleButton5,
      toggleButton6,
      toggleButton7,
      toggleButton8,
      toggleButton9,
    };
  },
};
</script>

<template>
  <div class="px-4 py-4 mx-auto flex flex-col">
    <input
      type="text"
      value=""
      placeholder="type something"
      class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-slate-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500"
    />

    <p class="mx-auto py-5">or</p>

    <div class="mx-auto max-w-max">
      <div class="border min-w-max p-4 rounded-md">
        <h1 class="text-xl mb-6 flex justify-center">Expense</h1>

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
              <Icon class="mx-auto" icon="mdi:home-city" width="80" />
              <h1 class="mx-2">Home and life</h1>
            </button>
          </router-link>

          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">2</p>
              <Icon class="mx-auto" icon="mdi:food" width="80" />
              <h1 class="mx-2">Food and drink</h1>
            </button>
          </router-link>

          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">3</p>
              <Icon class="mx-auto" icon="mdi:party-popper" width="80" />
              <h1 class="mx-2">Entertainment</h1>
            </button>
          </router-link>

          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">4</p>
              <Icon class="mx-auto" icon="mdi:plane-car" width="80" />
              <h1 class="mx-2">Transportation</h1>
            </button>
          </router-link>

          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">5</p>
              <Icon class="mx-auto" icon="mdi:heart" width="80" />
              <h1 class="mx-2">Health and wellness</h1>
            </button>
          </router-link>

          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">6</p>
              <Icon class="mx-auto" icon="mdi:shopping" width="80" />
              <h1 class="mx-2">Shopping</h1>
            </button>
          </router-link>

          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">7</p>
              <Icon class="mx-auto" icon="mdi:reload" width="80" />
              <h1 class="mx-2">Subscriptions</h1>
            </button>
          </router-link>

          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">8</p>
              <Icon class="mx-auto" icon="mdi:finance" width="80" />
              <h1 class="mx-2">Savings, investing and loans</h1>
            </button>
          </router-link>

          <router-link :to="{ name: '' }">
            <button
              class="relative bg-light-light-grey hover:bg-light-green active:bg-dark-light-green duration-300 rounded-md w-40 h-40 cursor-pointer"
              @click=""
            >
              <p class="text-sm absolute top-2 left-3">9</p>
              <Icon
                class="mx-auto"
                icon="mdi:sticker-plus-outline"
                width="80"
              />
              <h1 class="mx-2">Other</h1>
            </button>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
