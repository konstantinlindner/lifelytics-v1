<script>
import { supabase } from "../supabase.ts";
import { useRouter } from "vue-router";
import { computed } from "vue";
import store from "../store/index.ts";
import { Icon } from "@iconify/vue";

export default {
  name: "AddRecordFinancialType",
  components: { Icon },
};
</script>

<template>
  <div class="min-w-max p-4 bg-light-light-grey rounded-md">
    <h1 class="text-xl mb-6 flex justify-center">Choose type</h1>
    <div class="min-w-max grid gap-4 grid-cols-2 rounded-md">
      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:cash-plus" width="80" />
        <h1 class="mx-2">Income</h1>
      </button>

      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:cash-minus" width="80" />
        <h1 class="mx-2">Expense</h1>
      </button>
    </div>
  </div>
</template>
