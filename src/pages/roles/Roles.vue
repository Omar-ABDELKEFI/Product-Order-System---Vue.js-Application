<template>
  <div class="pt-3 pb-2 mb-3 border-bottom">
    <router-link to="/roles/create" class="btn btn-sm btn-outline-secondary">Add</router-link>
  </div>

  <div class="table-responsive">
    <table class="table table-striped table-sm">
      <thead>
      <tr>
        <th>#</th>
        <th>Name</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="role in roles" :key="role.id">
        <td>{{ role.id }}</td>
        <td>{{ role.name }}</td>
        <td>
          <div class="btn-group mr-2">
            <div :style="{ 'cursor': !hasPer ? 'not-allowed' : 'pointer' }"><router-link :to="`/roles/${role.id}/edit`" class="btn btn-sm btn-outline-secondary" :class="{ 'disabled':! hasPer } " >Edit</router-link></div>
            <div :style="{ 'cursor': !hasPer ? 'not-allowed' : 'pointer' }"><a href="javascript:void(0)" class="btn btn-sm btn-outline-secondary" :class="{ 'disabled':! hasPer }"  @click="del(role.id)" >Delete</a></div>
          </div>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script lang="ts">
import {ref, onMounted,computed,watch} from 'vue';
import axios from 'axios';
import {Role} from "@/models/role";
import {useStore} from "vuex";
import {hasPermission } from '@/lib/helpers'
export default {
  name: "Roles",
  setup() {
    const store = useStore();

    const user = computed(() => store.state.User.user);

    const roles = ref([]);
    const hasPer = ref(false);
    watch(user, () => {
      hasPer.value = hasPermission(user.value?.role?.permissions,"edit_roles")
      console.log(hasPer,"hasPer")
    });
    onMounted(async () => {
      console.log(user.value,"ssssssss")
      const {data} = await axios.get('roles');

      roles.value = data;
      hasPer.value = hasPermission(user.value?.role?.permissions,"edit_roles")
    });

    const del = async (id: number) => {
      if (confirm('Are you sure?')) {
        await axios.delete(`roles/${id}`);

        roles.value = roles.value.filter((r: Role) => r.id !== id);
      }
    }

    return {
      roles,
      hasPer,
      del
    }
  }
}
</script>
