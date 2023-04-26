<script lang="ts">
import { Icon } from "@iconify/vue";

import AddRecordType from "../components/AddRecordType.vue";
import AddRecordHealthCategory from "../components/AddRecordHealthCategory.vue";
import AddRecordFinancialType from "../components/AddRecordFinancialType.vue";
import AddRecordFinancialExpenseCategory from "../components/AddRecordFinancialExpenseCategory.vue";
import AddRecordFinancialTransaction from "../components/AddRecordFinancialTransaction.vue";

export default {
  name: "AddRecord",
  components: {
    Icon,
    AddRecordType,
    AddRecordHealthCategory,
    AddRecordFinancialType,
    AddRecordFinancialExpenseCategory,
    AddRecordFinancialTransaction,
  },

  setup() {
    return {};
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
      <AddRecordType />

      <AddRecordHealthCategory />

      <AddRecordFinancialType />

      <AddRecordFinancialExpenseCategory />

      <AddRecordFinancialTransaction />
    </div>
  </div>
</template>
