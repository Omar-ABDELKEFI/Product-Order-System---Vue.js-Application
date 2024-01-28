<template>
  <div :style="{ 'cursor': !hasPer ? 'not-allowed' : 'pointer' }" class="pt-3 pb-2 mb-3 border-bottom">
    <router-link :class="{ 'disabled': !hasPer }" to="/products/create" class="btn btn-sm btn-outline-secondary">Add</router-link>
  </div>

  <div class="table-responsive">
    <table class="table table-striped table-sm">
      <thead>
        <tr>
          <th>#</th>
          <th>Image</th>
          <th>Title</th>
          <th>Description</th>
          <th>Price</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="product in products" :key="product.id">
          <td>{{ product.id }}</td>
          <td><img :src="product.image" width="50" /></td>
          <td>{{ product.title }}</td>
          <td>{{ product.description }}</td>
          <td>{{ product.price }}</td>
          <td>
            <div class="btn-group mr-2">
              <div :style="{ 'cursor': !hasPer ? 'not-allowed' : 'pointer' }"><router-link  :class="{ 'disabled': !hasPer }"
                  :to="`/products/${product.id}/edit`" class="btn btn-sm btn-outline-secondary">Edit
                </router-link></div>
              <div :style="{ 'cursor': !hasPer ? 'not-allowed' : 'pointer' }"> <a  :class="{ 'disabled': !hasPer }" href="javascript:void(0)"
                  class="btn btn-sm btn-outline-secondary" @click="del(product.id)">Delete</a></div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <Paginator :last-page="lastPage" @page-changed="load($event)" />
</template>

<script lang="ts">
import { ref, onMounted, computed, watch } from 'vue';
import axios from 'axios';
import { Product } from "@/models/product";
import Paginator from "@/components/Paginator.vue";
import { hasPermission } from '@/lib/helpers'
import { useStore } from "vuex";

export default {
  name: "Products",
  components: { Paginator },
  setup() {
    const products = ref<Product[]>([]);
    const lastPage = ref(0);
    const hasPer = ref(false);
    const store = useStore();
    const user = computed(() => store.state.User.user);
    watch(user, () => {
      hasPer.value = hasPermission(user.value?.role?.permissions, "edit_products")
      console.log(hasPer.value, "hasPer")
    });

    onMounted(async () => {
      console.log(user.value, "ssssssss")

      hasPer.value = hasPermission(user.value?.role?.permissions, "edit_products")
    });
    const load = async (page = 1) => {
      const { data } = await axios.get(`products?page=${page}`);

      products.value = data.data;
      lastPage.value = data.meta.last_page;
    };

    onMounted(load);

    const del = async (id: number) => {
      if (confirm('Are you sure?')) {
        await axios.delete(`products/${id}`);

        products.value = products.value.filter((p: any) => p.id !== id);
      }
    }

    return {
      products,
      lastPage,
      del,
      load,
      hasPer
    }
  }
}
</script>
