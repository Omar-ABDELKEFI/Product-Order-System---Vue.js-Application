<template >
  <h2 v-if="user.id!==0">Daily Sales</h2>

  <div v-if="user.id!==0" id="chart"></div>
</template>

<script lang="ts">
import {computed,onMounted} from 'vue';
import axios from 'axios';
import * as c3 from 'c3';
import { useStore } from "vuex";

export default {
  name: "Dashboard",
  setup() {
    const store = useStore();
    const user = computed(() => store.state.User.user);
    console.log(user.value.id,"user")
    onMounted(async () => {
      const chart = c3.generate({
        bindto: '#chart',
        data: {
          x: 'x',
          columns: [
            ['x'],
            ['Sales']
          ],
          types: {
            Sales: 'bar'
          }
        },
        axis: {
          x: {
            type: 'timeseries',
            tick: {
              format: '%Y-%m-%d'
            }
          }
        }
      });

      const {data} = await axios.get('chart');

      chart.load({
        columns: [
          ['x', ...data.map((r: any) => r.date)],
          ['Sales', ...data.map((r: any) => r.sum)]
        ]
      })
    });

    return {
      user
    }
  }
}
</script>
