<script>
export default {
  setup() {
    // get user from store

    // setup ref to router

    // logout function

    return {};
  },
};
</script>

<template>
  <header class="bg-light-green text-grey">
    <nav
      class="container py-5 px-4 flex flex-col gap-4 items-center sm:flex-row"
    >
      <router-link class="cursor-pointer" :to="{ name: 'Home' }">
        <div class="cursor-pointer select-none flex items-center gap-x-4">
          <img class="W-14" width="50" src="../assets/logo.png" />
          <h1 class="text-xl">
            <span class="font-thin">konte</span
            ><span class="font-normal">life</span>
          </h1>
        </div></router-link
      >
      <ul class="flex flex-1 justify-end gap-x-10">
        <router-link class="cursor-pointer" :to="{ name: 'Home' }"
          >Home</router-link
        >
        <router-link class="cursor-pointer" :to="{ name: 'Login' }"
          >Login</router-link
        >
        <router-link class="cursor-pointer" :to="{ name: 'Register' }"
          >Register</router-link
        >
        <li class="cursor-pointer">Profile</li>
        <li class="cursor-pointer">Logout</li>
      </ul>
    </nav>
  </header>
</template>
