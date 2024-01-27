import {createApp} from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios';

axios.defaults.baseURL = 'https://8000-antoniopapa-backend-4gzeloqrmro.ws-eu107.gitpod.io/api/';
axios.defaults.withCredentials = true;

createApp(App).use(store).use(router).mount('#app')
