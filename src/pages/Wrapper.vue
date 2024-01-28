<template>
  <Nav v-if="user.id!==0" />

  <div  class="container-fluid">
    <div class="row">
      <Menu v-if="user.id!==0"/>

      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <router-view/>
      </main>
    </div>
  </div>
</template>

<script>
import Nav from '@/components/Nav';
import Menu from '@/components/Menu';
import axios from "axios";
import {computed, onMounted} from 'vue';
import {useRouter} from "vue-router";
import {useStore} from "vuex";

export default {
  name: "Wrapper",
  components: {
    Nav,
    Menu
  },
  setup() {
    const router = useRouter();
    const store = useStore();
    const user = computed(() => store.state.User.user);

    onMounted(async () => {
      try {
        console.log('rrrrrrrr')
        const {data} = await axios.get('user');
         
        await store.dispatch('User/setUser', data);
      } catch (e) {
        await router.push('/login');
      }
    });

    return {
      user
    }
  }
}
</script>
