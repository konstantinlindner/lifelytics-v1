<script>
import { Icon } from "@iconify/vue";
import Modal from "../components/Modal.vue";

export default {
  name: "Transactions",
  components: { Icon, Modal },
  data() {
    return {
      isModalVisible: false,
    };
  },
  methods: {
    showModal() {
      this.isModalVisible = true;
    },
    closeModal() {
      this.isModalVisible = false;
    },
  },
  setup() {
    return {};
  },
};
</script>

<template>
  <header class="flex px-10 pt-8">
    <h1 class="text-xl">Transactions</h1>
    <div class="flex flex-row justify-end ml-auto">
      <div class="flex flex-row items-center ml-5">
        <button
          class="bg-light-light-green duration-300 hover:bg-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
          @click="showModal"
        >
          <Icon icon="mdi:plus" width="20" />
          <p class="ml-1.5">Add transaction</p>
        </button>
      </div>
    </div>
  </header>

  <Modal v-show="isModalVisible" @close="closeModal" />

  <body class="px-10 pt-8">
    Below is a table of all transactions.
  </body>
</template>
