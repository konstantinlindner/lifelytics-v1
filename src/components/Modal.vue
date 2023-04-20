<script>
export default {
  name: "Modal",
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
      <div class="bg-white shadow-md overflow-x-auto flex flex-col">
        <header class="p-15 flex relative text-light-green justify-between">
          <slot name="header"> This is the default title! </slot>
          <button type="button" class="btn-close" @click="close">x</button>
        </header>

        <section class="relative px-20 py-10">
          <slot name="body"> This is the default body! </slot>
        </section>

        <footer class="p-15 flex flex-col justify-end">
          <slot name="footer"> This is the default footer! </slot>
          <button
            type="absolute top-0 right-0 text-sm p-10 cursor-pointer font-bold text-light-green"
            class=""
            @click="close"
          >
            Close Modal
          </button>
        </footer>
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
