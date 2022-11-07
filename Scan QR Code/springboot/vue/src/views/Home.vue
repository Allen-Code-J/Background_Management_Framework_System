<template>
  <div>

    <div id = "main" style = "width: 500px; height: 400px"></div>
  </div>
</template>

<script>
import * as echarts from 'echarts'

export default {
  name: "Home",
  data() {
    return {

    }
  },
  mounted() { //页面元素渲染之后再触发


    var chartDom = document.getElementById('main');
    var myChart = echarts.init(chartDom);
    var option = {
      xAxis: {
        type: 'category',
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          data: [150, 230, 224, 218, 135, 147, 260],
          type: 'bar'
        },
        {
          data: [150, 230, 224, 218, 135, 147, 260],
          type: 'line'
        }
      ]
    };

    myChart.setOption(option);

  }
}
</script>

<style scoped>

</style>