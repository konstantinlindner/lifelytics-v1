import { createRouter, createWebHistory } from "vue-router";
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
  },
  {
    path: "/sign-in",
    name: "SignIn",
    component: SignIn,
  },
  {
    path: "/sign-up",
    name: "SignUp",
    component: SignUp,
  },

  {
    path: "/profile",
    name: "Profile",
    component: Profile,
  },
  {
    path: "/settings",
    name: "Settings",
    component: Settings,
  },
  {
    path: "/transactions",
    name: "Transactions",
    component: Transactions,
  },
  {
    path: "/flights",
    name: "Flights",
    component: Flights,
  },
  {
    path: "/accommodation",
    name: "Accommodation",
    component: Accommodation,
  },
  {
    path: "/add-transaction",
    name: "AddTransaction",
    component: AddTransaction,
  },
  {
    path: "/add-record",
    name: "AddRecord",
    component: AddRecord,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// Change document titles

// Route guard for auth routes

export default router;
