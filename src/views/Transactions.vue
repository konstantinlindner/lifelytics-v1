<script>
import { Icon } from "@iconify/vue";
import AppModal from "../components/AppModal.vue";

export default {
  name: "Transactions",
  components: { Icon, AppModal },
  data() {
    return {
      isAppModalVisible: false,
    };
  },
  methods: {
    showAppModal() {
      this.isAppModalVisible = true;
    },
    closeAppModal() {
      this.isAppModalVisible = false;
    },
  },
  setup() {
    return {};
  },
};
</script>

<template>
  <header class="flex px-8 pt-8">
    <h1 class="text-xl">Transactions</h1>
    <div class="flex flex-row justify-end ml-auto">
      <div class="flex flex-row items-center ml-5">
        <button
          class="bg-light-green duration-300 hover:bg-dark-light-green active:bg-dark-dark-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
          @click="showAppModal"
        >
          <Icon icon="mdi:plus" width="20" />
          <p class="ml-1.5 whitespace-nowrap">Add transaction</p>
        </button>
      </div>
    </div>
  </header>

  <AppModal v-show="isAppModalVisible" @close="closeAppModal" />

  <body class="px-8 pt-8">
    Below is a table of all transactions.
    <img class="mt-20 mx-auto" src="../assets/transactions.svg" width="500" />
  </body>
</template>
