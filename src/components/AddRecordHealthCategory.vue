<script>
import { supabase } from "../supabase.ts";
import { useRouter } from "vue-router";
import { computed } from "vue";
import store from "../store/index.ts";
import { Icon } from "@iconify/vue";

export default {
  name: "AddRecordHealthCategory",
  components: { Icon },
  setup() {
    // create data / vars

    const router = useRouter();

    // Set user const

    const user = computed(() => store.state.user);

    // If not logged in, redirect to sign in page

    async function redirectNotSignedIn() {
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (!user) {
        router.push({ name: "SignIn" });
      }
    }

    redirectNotSignedIn();

    return { user };
  },
};
</script>

<template>
  <div class="min-w-max p-4 bg-light-light-grey rounded-md">
    <h1 class="text-xl mb-6 flex justify-center">Choose health category</h1>
    <div class="min-w-max grid gap-4 grid-cols-3 rounded-md">
      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:cash" width="80" />
        <h1 class="mx-2">Income</h1>
      </button>

      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:home-city" width="80" />
        <h1 class="mx-2">Accommodation</h1>
      </button>

      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:food" width="80" />
        <h1 class="mx-2">Food</h1>
      </button>

      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:train-car" width="80" />
        <h1 class="mx-2">Transportation</h1>
      </button>

      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:flight" width="80" />
        <h1 class="mx-2">Flight</h1>
      </button>

      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:heart-outline" width="80" />
        <h1 class="mx-2">Health</h1>
      </button>

      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:reload" width="80" />
        <h1 class="mx-2">Subscription</h1>
      </button>

      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:finance" width="80" />
        <h1 class="mx-2">Financial</h1>
      </button>

      <button
        class="bg-light-grey hover:bg-light-green duration-300 rounded-md w-40 h-40 cursor-pointer flex flex-col items-center justify-center"
        @click=""
      >
        <Icon icon="mdi:sticker-plus-outline" width="80" />
        <h1 class="mx-2">Other</h1>
      </button>
    </div>
  </div>
</template>
