<script lang="ts">
import { ref } from "vue";

export default {
  name: "AddRecordFinancialDetails",
  mounted() {},
  methods: {},
  setup() {
    // create data / vars

    const where = ref(null);
    const what = ref(null);
    const amount = ref(null);
    const currency = ref(null);

    return {
      where,
      what,
      amount,
      currency,
    };
  },
};
</script>

<template>
  <!-- Form -->

  <div class="px-4 py-4 mx-auto flex flex-col">
    <div class="mx-auto max-w-max">
      <form class="border w-96 max-w-screen-sm p-8 flex flex-col rounded-md">
        <h1 class="text-2xl mx-auto mb-5">Enter details</h1>

        <div class="flex flex-col mb-2">
          <label for="where" class="mb-1 text-sm">Where</label>
          <input
            type="text"
            required
            id="where"
            placeholder="Where"
            v-model="where"
            class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-pink-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500 placeholder-shown:invalid:border-slate-300 placeholder-shown:invalid:text-slate-600 placeholder-shown:focus:invalid:border-light-green placeholder-shown:focus:invalid:ring-light-green"
          />
        </div>

        <div class="flex flex-col mb-2">
          <label for="what" class="mb-1 text-sm">What</label>
          <input
            type="text"
            required
            id="what"
            placeholder="What"
            v-model="what"
            class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-pink-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500 placeholder-shown:invalid:border-slate-300 placeholder-shown:invalid:text-slate-600 placeholder-shown:focus:invalid:border-light-green placeholder-shown:focus:invalid:ring-light-green"
          />
        </div>

        <div class="flex flex-row space-x-2 w-full">
          <div class="flex flex-col">
            <label for="currency" class="mb-1 text-sm">Currency</label>
            <select
              type=""
              required
              id="currency"
              v-model="currency"
              class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-pink-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500 placeholder-shown:invalid:border-slate-300 placeholder-shown:invalid:text-slate-600 placeholder-shown:focus:invalid:border-light-green placeholder-shown:focus:invalid:ring-light-green"
            />
          </div>

          <div class="flex flex-col mb-2">
            <label for="amount" class="mb-1 text-sm">Amount</label>
            <input
              type="number"
              placeholder="200"
              required
              id="amount"
              v-model="amount"
              class="w-full px-3 py-2 border border-slate-300 rounded-md text-sm placeholder-slate-400 focus:outline-none hover:border-light-green hover:ring-1 hover:ring-light-green focus:border-light-green focus:ring-1 focus:ring-light-green disabled:bg-slate-50 disabled:text-slate-500 disabled:border-pink-200 invalid:border-pink-500 invalid:text-pink-600 focus:invalid:border-pink-500 focus:invalid:ring-pink-500 placeholder-shown:invalid:border-slate-300 placeholder-shown:invalid:text-slate-600 placeholder-shown:focus:invalid:border-light-green placeholder-shown:focus:invalid:ring-light-green"
            />
          </div>
        </div>

        <button
          type="submit"
          class="mt-6 py-2 px-6 rounded-md self-start text-sm bg-light-green duration-200 hover:bg-dark-light-green mb-4"
        >
          Next
        </button>
      </form>
    </div>
  </div>
</template>
