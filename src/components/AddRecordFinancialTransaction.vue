<script lang="ts">
import { ref } from "vue";

export default {
  name: "AddRecordFinancialTransaction",
  mounted() {},
  methods: {},
  setup() {
    // create data / vars

    const name = ref(null);
    const amount = ref(null);
    const errorMsg = ref(null);

    return {
      name,
      amount,
      errorMsg,
    };
  },
};
</script>

<template>
  <!-- Error Handling -->

  <div v-if="errorMsg" class="mb-10 p-4 rounded-md bg-light-grey shadow-lg">
    <p class="text-red-500">{{ errorMsg }}</p>
  </div>

  <!-- Form -->

  <form class="border w-96 max-w-screen-sm p-8 flex flex-col rounded-md">
    <h1 class="text-2xl mx-auto mb-5">Enter details</h1>

    <div class="flex flex-col mb-2">
      <label for="name" class="mb-1 text-sm">Name</label>
      <input
        type="text"
        required
        id="name"
        v-model="name"
        class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-slate-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500"
      />
    </div>

    <div class="flex flex-col mb-2">
      <label for="amount" class="mb-1 text-sm">Amount</label>
      <input
        type="number"
        required
        id="amount"
        v-model="amount"
        class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-slate-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500"
      />
    </div>
    <button
      type="submit"
      class="mt-6 py-2 px-6 rounded-md self-start text-sm bg-light-green duration-200 hover:bg-dark-light-green mb-4"
    >
      Next
    </button>
  </form>
</template>
