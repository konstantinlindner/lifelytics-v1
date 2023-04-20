import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/Home.vue";
import Login from "../views/Login.vue";
import Register from "../views/Register.vue";
import AddTransaction from "../views/AddTransaction.vue";
import Profile from "../views/Profile.vue";
import Transactions from "../views/Transactions.vue";
import Flights from "../views/Flights.vue";
import Accommodation from "../views/Accommodation.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
  },
  {
    path: "/register",
    name: "Register",
    component: Register,
  },
  {
    path: "/add-transaction",
    name: "AddTransaction",
    component: AddTransaction,
  },
  {
    path: "/profile",
    name: "Profile",
    component: Profile,
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
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// Change document titles

// Route guard for auth routes

export default router;
