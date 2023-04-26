<script>
import { Icon } from "@iconify/vue";

export default {
  name: "AppModal",
  components: { Icon },
  methods: {
    close() {
      this.$emit("close");
    },
  },
};
</script>

<template>
  <transition name="modal-fade">
    <div
      class="fixed inset-0 bg-overlay-background flex justify-center items-center"
    >
      <div class="bg-white shadow-lg rounded-md">
        <div class="flex flex-col mx-2 my-2 w-80 h-40">
          <header class="ml-auto">
            <button type="button" @click="close">
              <Icon icon="mdi:close" />
            </button>
          </header>

          <section class="mx-auto">
            <slot name="body">This is a modal</slot>
          </section>

          <footer class="flex flex-col mt-auto">
            <li class="ml-auto list-none mx-3 my-2">
              <div class="flex flex-row items-center">
                <button
                  class="bg-light-green duration-300 hover:bg-dark-light-green active:bg-dark-dark-light-green rounded-md px-2 py-1 flex flex-row items-center cursor-pointer"
                  @click="close"
                >
                  <p>Confirm</p>
                </button>
              </div>
            </li>
          </footer>
        </div>
      </div>
    </div>
  </transition>
</template>

<style>
.modal-fade-enter,
.modal-fade-leave-to {
  opacity: 0;
}

.modal-fade-enter-active,
.modal-fade-leave-active {
  transition: opacity 0.5s ease;
}
</style>
