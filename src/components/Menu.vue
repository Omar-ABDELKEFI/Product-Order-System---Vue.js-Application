<template>
  <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
    <div class="position-sticky pt-3">
      <ul class="nav flex-column">
        <li class="nav-item">
          <router-link to="/" exact-active-class="active" class="nav-link">
            Dashboard
          </router-link>
        </li>
        <li v-if="hasPermission(user?.role?.permissions||[], 'view_users')" class="nav-item">
          <router-link to="/users" active-class="active" class="nav-link">
            Users
          </router-link>
        </li>
        <li v-if="hasPermission(user?.role?.permissions||[], 'view_roles')" class="nav-item">
          <router-link to="/roles" active-class="active" class="nav-link">
            Roles
          </router-link>
        </li>
        <li v-if="hasPermission(user?.role?.permissions||[], 'view_products')" class="nav-item">
          <router-link to="/products" active-class="active" class="nav-link">
            Products
          </router-link>
        </li>
        <li v-if="hasPermission(user?.role?.permissions||[], 'view_orders')" class="nav-item">
          <router-link to="/orders" active-class="active" class="nav-link">
            Orders
          </router-link>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
import {  computed, watch } from 'vue';
import { hasPermission } from '@/lib/helpers';
import { useStore } from "vuex";

export default {
  name: "Menu",
  setup() {
    const store = useStore();
    const user = computed(() => store.state.User.user);

    watch(user ,() => {
      console.log(user?.value?.role?.permissions,"user")
    });


    return {
      user,
      hasPermission,
    };
  },
};
</script>
