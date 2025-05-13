<template>
  <div class="dashboard-container">
    <div class="dashboard-editor-container">
      <panel-group @handleSetLineChartData="handleSetLineChartData" />

      <el-row
        class="chart-container"
        style="background:#fff; padding: 16px; margin-bottom: 32px; height: 70vh;"
      >
        <!-- Loading 状态显示 -->
        <line-chart v-if="!loading" :chart-data="lineChartData" />
        <div v-else class="loading-indicator">加载中...</div>
      </el-row>
    </div>
  </div>
</template>

<script>
import PanelGroup from './dashboard/PanelGroup'
import LineChart from './dashboard/LineChart'
import axios from 'axios'
import { getToken } from '@/utils/auth'

export default {
  name: 'Dashboard',
  components: {
    PanelGroup,
    LineChart
  },
  data() {
    return {
      lineChartData: {
        dates: [],
        values: [],
        systolicValues: [],
        diastolicValues: [],
        title: '',
        legend: []
      },
      userId: 1,
      loading: false,
      cachedData: {}
    }
  },
  mounted() {
    this.handleSetLineChartData('height') // 初始化为身高曲线
  },
  methods: {
    async handleSetLineChartData(type) {
      if (this.cachedData[type]) {
        this.updateChartData(this.cachedData[type])
        return
      }

      try {
        this.loading = true
        const token = getToken()
        const response = await axios.get('/api/checkupItems/latest', {
          params: { userId: this.userId },
          headers: {
            Authorization: `Bearer ${token}`
          }
        })

        const data = response.data
        const typeMap = {
          height: '身高',
          weights: '体重',
          bloodpressure: '血压',
          bloodsugars: '血糖'
        }

        const targetItemName = typeMap[type]
        const isBloodPressure = targetItemName === '血压'

        const dates = []
        const values = []
        const systolicValues = []
        const diastolicValues = []

        data.forEach(item => {
          if (item.itemName === targetItemName) {
            const date = this.formatDate(item.updatedAt)
            dates.push(date)

            if (isBloodPressure) {
              const [systolic, diastolic] = item.itemValue.split('/').map(Number)
              systolicValues.push(systolic)
              diastolicValues.push(diastolic)
            } else {
              values.push(parseFloat(item.itemValue))
            }
          }
        })

        const chartData = {
          dates,
          values: isBloodPressure ? [] : values,
          systolicValues: isBloodPressure ? systolicValues : [],
          diastolicValues: isBloodPressure ? diastolicValues : [],
          title: `${targetItemName}变化`,
          legend: isBloodPressure ? ['收缩压', '舒张压'] : [targetItemName]
        }

        this.cachedData[type] = chartData
        this.updateChartData(chartData)
      } catch (error) {
        console.error('数据获取失败:', error)
      } finally {
        this.loading = false
      }
    },
    updateChartData(chartData) {
      this.lineChartData = chartData
    },
    formatDate(dateStr) {
      const date = new Date(dateStr)
      const month = (date.getMonth() + 1).toString().padStart(2, '0')
      const day = date.getDate().toString().padStart(2, '0')
      return `${month}-${day}`
    }
  }
}
</script>

<style scoped>
.dashboard-editor-container {
  padding: 24px;
  background-color: #f0f2f5;
  height: 100vh;
  box-sizing: border-box;
}

.chart-container {
  height: 70vh; /* 调整为 70vh */
}

.loading-indicator {
  text-align: center;
  font-size: 16px;
  color: #999;
}
</style>
