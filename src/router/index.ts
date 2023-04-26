import { createRouter, createWebHistory } from "vue-router";
import store from "../store/index.ts";
import { computed } from "vue";

import Home from "../views/Home.vue";
import SignIn from "../views/SignIn.vue";
import SignUp from "../views/SignUp.vue";
import AddTransaction from "../views/AddTransaction.vue";
import Profile from "../views/Profile.vue";
import Transactions from "../views/Transactions.vue";
import Flights from "../views/Flights.vue";
import Accommodation from "../views/Accommodation.vue";
import AddRecord from "../views/AddRecord.vue";
import Settings from "../views/Settings.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
    meta: {
      title: "Home",
    },
  },
  {
    path: "/sign-in",
    name: "SignIn",
    component: SignIn,
    meta: {
      title: "Sign in",
    },
  },
  {
    path: "/sign-up",
    name: "SignUp",
    component: SignUp,
    meta: {
      title: "Sign up",
    },
  },

  {
    path: "/profile",
    name: "Profile",
    component: Profile,
    meta: {
      title: "Profile",
    },
  },
  {
    path: "/settings",
    name: "Settings",
    component: Settings,
    meta: {
      title: "Settings",
    },
  },
  {
    path: "/transactions",
    name: "Transactions",
    component: Transactions,
    meta: {
      title: "Transactions",
    },
  },
  {
    path: "/flights",
    name: "Flights",
    component: Flights,
    meta: {
      title: "Flights",
    },
  },
  {
    path: "/accommodation",
    name: "Accommodation",
    component: Accommodation,
    meta: {
      title: "Accommodation",
    },
  },
  {
    path: "/add-transaction",
    name: "AddTransaction",
    component: AddTransaction,
    meta: {
      title: "Add transaction",
    },
  },
  {
    path: "/add-record",
    name: "AddRecord",
    component: AddRecord,
    meta: {
      title: "Add record",
    },
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes: routes,
});

// Change document titles

const user = computed(() => store.state.user);

router.beforeEach((to, from, next) => {
  document.title = `${
    to.meta.title === "Home" && !user.value
      ? "Lifelytics - Manage your life like a pro"
      : `${to.meta.title} | Lifelytics`
  }`;
  next();
});

// Route guard for auth routes

export default router;
