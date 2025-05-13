<template>
  <div :class="className" :style="{ height: '100%', width: '100%' }" />
</template>

<script>
import echarts from 'echarts'

export default {
  props: {
    className: {
      type: String,
      default: 'chart'
    },
    chartData: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      chart: null
    }
  },
  watch: {
    chartData: {
      handler(newData) {
        this.setOptions(newData)
      },
      deep: true
    }
  },
  mounted() {
    this.initChart()
    window.addEventListener('resize', this.resizeChart)
  },
  beforeDestroy() {
    if (this.chart) {
      this.chart.dispose()
    }
    window.removeEventListener('resize', this.resizeChart)
  },
  methods: {
    initChart() {
      this.chart = echarts.init(this.$el)
      this.setOptions(this.chartData)
    },
    resizeChart() {
      if (this.chart) {
        this.chart.resize()
      }
    },
    setOptions({ dates, values, systolicValues, diastolicValues, title, legend }) {
      if (!this.chart) return

      const isBloodPressure = title.includes('血压')

      const series = isBloodPressure
        ? [
          {
            name: '收缩压',
            type: 'line',
            smooth: true,
            data: systolicValues,
            itemStyle: {
              color: '#ff6347'
            },
            areaStyle: {
              color: '#ffe4e1'
            }
          },
          {
            name: '舒张压',
            type: 'line',
            smooth: true,
            data: diastolicValues,
            itemStyle: {
              color: '#4682b4'
            },
            areaStyle: {
              color: '#b0c4de'
            }
          }
        ]
        : [
          {
            name: legend[0],
            type: 'line',
            smooth: true,
            data: values,
            itemStyle: {
              color: '#3888fa'
            },
            areaStyle: {
              color: '#f3f8ff'
            }
          }
        ]

      this.chart.setOption({
        title: {
          text: title,
          left: 'center',
          top: '10px',
          textStyle: {
            fontSize: 18,
            fontWeight: 'bold'
          }
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: { type: 'line' }
        },
        legend: {
          data: isBloodPressure ? ['收缩压', '舒张压'] : legend,
          top: '50px',
          left: 'center'
        },
        grid: {
          top: '80px',
          left: '5%',
          right: '5%',
          bottom: '5%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: dates,
          boundaryGap: false,
          axisLabel: {
            rotate: 45,
            interval: 0
          }
        },
        yAxis: {
          type: 'value'
        },
        series
      })
    }
  }
}
</script>

<style scoped>
.chart {
  width: 100%;
  height: 100%;
}
</style>
