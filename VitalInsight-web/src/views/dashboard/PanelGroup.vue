<template>
  <el-row :gutter="40" class="panel-group">
    <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
      <div class="card-panel" @click="handleSetLineChartData('height')">
        <div class="card-panel-icon-wrapper icon-height">
          <svg t="1746629851115" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2864" width="48" height="48"><path d="M552.865733 412.342256c-24.826432-27.662013-60.311621-43.545772-97.342002-43.545772l-73.890894 0c-37.030381 0-72.516594 15.883759-97.357352 43.545772L165.250648 545.056883c-5.943362 6.637164-5.661953 16.788361 0.581238 23.076578l40.530089 40.770566c3.272533 3.27765 7.605212 5.202489 12.32163 4.88424 4.603855-0.152473 8.93551-2.208295 11.95631-5.702885l85.415368-98.331539 0 433.44283c0 9.267061 7.442506 16.756639 16.624632 16.756639l57.305147 0c9.163707 0 16.620539-7.490601 16.620539-16.756639L406.605601 690.713264l24.028253 0 0 252.484432c0 9.267061 7.438413 16.756639 16.620539 16.756639l57.256028 0c9.182127 0 16.604166-7.490601 16.570397-16.756639L521.080819 509.770216l85.435835 98.31619c3.054569 3.494591 7.40669 5.550413 12.004405 5.702885 4.451382 0.347924 9.05012-1.62194 12.287861-4.88424l40.485063-40.770566c6.293333-6.303566 6.510274-16.439414 0.562818-23.076578L552.865733 412.342256zM852.849992 65.044412l-85.636403 0c-10.289344 0-18.643616 8.351202-18.643616 18.682501 0 10.29139 8.337899 18.661012 18.643616 18.661012l66.976414 0 0 177.061648L788.66618 279.449573c-10.326183 0-18.642592 8.372691-18.642592 18.681478 0 10.292414 8.316409 18.665105 18.642592 18.665105l45.5228 0 0 177.041182L788.66618 493.837338c-10.326183 0-18.642592 8.355295-18.642592 18.665105 0 10.308787 8.316409 18.676361 18.642592 18.676361l45.5228 0 0 177.027879L788.66618 708.206684c-10.326183 0-18.642592 8.311293-18.642592 18.661012 0 10.347672 8.316409 18.681478 18.642592 18.681478l45.5228 0 0 177.061648-66.976414 0c-10.305717 0-18.643616 8.350179-18.643616 18.659989 0 10.331299 8.337899 18.681478 18.643616 18.681478l85.619006 0c10.288321 0 18.60473-8.351202 18.622126-18.681478L871.453698 83.705424C871.453698 73.395614 863.138312 65.044412 852.849992 65.044412zM418.593634 344.597339c51.277874 0 93.02365-42.042535 93.02365-93.684706 0-51.642171-41.745776-93.665263-93.02365-93.665263-51.293223 0-93.02058 42.023092-93.02058 93.665263C325.573053 302.570153 367.30041 344.597339 418.593634 344.597339z" p-id="2865" /></svg>
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            身高
          </div>
          <count-to :start-val="0" :end-val="data.height" :duration="2600" class="card-panel-num" />
        </div>
      </div>
    </el-col>
    <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
      <div class="card-panel" @click="handleSetLineChartData('weights')">
        <div class="card-panel-icon-wrapper icon-weight">
          <svg t="1746630400923" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5129" width="48" height="48"><path d="M987.52 846.08l-101.44-405.12A117.44 117.44 0 0 0 772.48 352h-83.84a208 208 0 1 0-352 0H251.52a117.44 117.44 0 0 0-113.92 88.96L36.48 846.08A117.44 117.44 0 0 0 150.4 992h723.2a117.44 117.44 0 0 0 113.92-145.92zM512 162.56a80 80 0 1 1-80 80 80 80 0 0 1 80-80z m-80 640l-72.32-105.28-20.48 16.32v64c-1.6 32-16.96 45.12-41.28 45.12A39.36 39.36 0 0 1 256 780.16v-217.6c0-27.84 11.52-47.04 42.24-47.04a41.6 41.6 0 0 1 40.96 46.4v68.48l82.88-98.24a38.4 38.4 0 1 1 55.68 51.2l-56.96 62.4 79.04 109.76c30.72 46.4-27.52 93.76-67.84 46.08z m363.52 0a29.12 29.12 0 0 1-27.84 18.88c-16 0-27.52-9.6-29.76-32a106.88 106.88 0 0 1-87.04 34.56c-80.64 0-140.16-57.28-140.16-153.92S568.32 512 661.44 512c72.96 0 122.88 37.12 122.88 75.84a35.84 35.84 0 0 1-37.12 35.52c-22.4 0-41.92-44.16-81.6-44.16-49.6 0-71.68 40-71.68 87.68 0 57.6 27.52 89.28 65.6 89.28a74.56 74.56 0 0 0 36.16-9.28 49.28 49.28 0 0 0 26.24-37.76 156.8 156.8 0 0 1-55.04-5.12 32 32 0 0 1-2.88-53.12 352 352 0 0 1 99.2-5.76c30.08 0 34.88 12.48 35.84 40a770.88 770.88 0 0 1-3.84 117.44z" fill="#1296db" p-id="5130" /></svg>        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            体重
          </div>
          <count-to :start-val="0" :end-val="data.weights" :duration="3000" class="card-panel-num" />
        </div>
      </div>
    </el-col>
    <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
      <div class="card-panel" @click="handleSetLineChartData('bloodpressure')">
        <div class="card-panel-icon-wrapper icon-blood-pressure">
          <svg t="1746630682850" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6238" width="48" height="48"><path d="M546.204774 729.333856H103.703401a70.502942 70.502942 0 0 1-70.30208-70.302079V70.302079A70.302079 70.302079 0 0 1 103.703401 0h441.898783A70.302079 70.302079 0 0 1 615.904264 70.302079v588.729698a70.502942 70.502942 0 0 1-69.69949 70.302079zM103.703401 40.172617A30.129463 30.129463 0 0 0 73.573938 70.302079v588.729698a30.129463 30.129463 0 0 0 30.129463 30.129463h441.898783a30.330326 30.330326 0 0 0 30.129463-30.129463V70.302079A30.129463 30.129463 0 0 0 546.204774 40.172617zM905.749693 703.020792h-92.397018a20.086308 20.086308 0 0 1-20.086309-20.086308v-40.172617a177.562966 177.562966 0 0 1-64.677912-140.604158 180.776775 180.776775 0 0 1 64.677912-144.018831V319.372303a20.086308 20.086308 0 0 1 20.086309-20.086308h92.397018a20.086308 20.086308 0 0 1 20.086309 20.086308v40.172617a177.562966 177.562966 0 0 1 64.677912 142.612789 177.562966 177.562966 0 0 1-64.677912 140.604158v40.172617a20.086308 20.086308 0 0 1-20.086309 20.086308z m-72.31071-40.172616h52.224402v-30.129463a20.086308 20.086308 0 0 1 9.842291-17.274225A132.569635 132.569635 0 0 0 950.341298 502.157709a132.770498 132.770498 0 0 0-54.835622-114.291095 20.086308 20.086308 0 0 1-9.842291-17.073362V339.458611h-52.224402v28.321695a20.086308 20.086308 0 0 1-9.641428 17.274225c-32.941546 20.086308-55.036485 66.284818-55.036485 116.098862a132.368772 132.368772 0 0 0 55.036485 114.090232 20.086308 20.086308 0 0 1 9.641428 17.274225z" p-id="6239" fill="#d4237a" /><path d="M878.633177 701.815614v183.588858a98.422911 98.422911 0 0 1-98.422911 98.422911H404.395437a98.422911 98.422911 0 0 1-98.422911-98.422911v-157.275794h37.963122v138.193801a80.345233 80.345233 0 0 0 79.340918 79.340918h337.851707a80.345233 80.345233 0 0 0 80.345233-79.340918v-164.506865h38.163986m0-40.172617h-38.163986a40.172617 40.172617 0 0 0-40.172616 40.172617v164.506865a40.172617 40.172617 0 0 1-40.172617 39.168302H423.276566a40.172617 40.172617 0 0 1-39.168301-39.168302v-138.193801a40.172617 40.172617 0 0 0-40.172617-40.172617h-37.963122a40.172617 40.172617 0 0 0-40.172617 40.172617v157.275794a138.595528 138.595528 0 0 0 138.595528 138.595528h375.814829a138.796391 138.796391 0 0 0 138.595528-138.595528v-183.588858a40.172617 40.172617 0 0 0-40.172617-40.172617z" p-id="6240" fill="#d4237a" /><path d="M241.09375 631.312672a30.531189 30.531189 0 0 1-23.099255-10.244018l-78.537466-85.567673a78.13574 78.13574 0 0 1 0-106.457435 79.140055 79.140055 0 0 1 58.049432-25.710474 80.345233 80.345233 0 0 1 43.587289 13.256963 78.738329 78.738329 0 0 1 43.386426-13.256963 78.939192 78.939192 0 0 1 58.250294 132.167909l-78.537466 85.567673a30.531189 30.531189 0 0 1-23.099254 10.244018z m-43.587289-187.806983a38.766575 38.766575 0 0 0-28.522558 12.654374 38.364849 38.364849 0 0 0 0 52.224401l72.109847 78.537466 71.908984-78.537466a38.364849 38.364849 0 0 0 0-52.224401 38.565712 38.565712 0 0 0-28.522558-12.654374 38.766575 38.766575 0 0 0-28.522558 12.654374 20.086308 20.086308 0 0 1-14.462142 6.628482 20.086308 20.086308 0 0 1-14.663005-5.82503 40.172617 40.172617 0 0 0-29.32601-13.457826zM503.420937 186.400942H279.458599a20.086308 20.086308 0 0 1 0-40.172617H503.420937a20.086308 20.086308 0 1 1 0 40.172617zM503.420937 325.799922H279.458599a20.086308 20.086308 0 0 1 0-40.172617H503.420937a20.086308 20.086308 0 0 1 0 40.172617z" fill="#d4237a" p-id="6241" /></svg>
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            血压
          </div>
          <div class="card-panel-num">{{ formattedBloodPressure }}</div>
        </div>
      </div>
    </el-col>
    <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
      <div class="card-panel" @click="handleSetLineChartData('bloodsugars')">
        <div class="card-panel-icon-wrapper icon-blood-sugar">
          <svg t="1746630784124" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="10553" width="48" height="48"><path d="M734.522 655.334C707.802 785.96 618.405 879.26 471.578 879.26c-157.217 0-253.682-106.88-259.19-254.508-5.499-147.347 149.467-348.011 256.326-455.823 34.741 34.57 66.686 73.536 106.41 123.864 9.207-16.138 30.914-54.205 41.466-68.133-49.66-62.233-101.394-118.31-145.01-161.826-126.301 127.776-336.44 375.754-336.44 561.101 0 185.358 150.637 335.607 336.44 335.607 176.489 0 321.143-135.606 335.213-308.033-34.038 10.154-97.95 0.093-72.271 3.826z m27.45-553.218c-67.992 67.872-181.159 232.707-181.159 331.171 0 98.466 81.109 178.304 181.16 178.304 100.056 0 181.164-79.838 181.164-178.304 0-98.464-110.41-261.548-181.165-331.171zM452.005 737.74h31.685c17.5 0 31.685-14.186 31.685-31.685v-47.529h50.698c17.5 0 31.684-14.186 31.684-31.685v-31.686c0-17.5-14.186-31.686-31.684-31.686h-50.698v-47.528c0-17.5-14.186-31.686-31.685-31.686h-31.685c-17.5 0-31.686 14.186-31.686 31.686v47.528h-44.36c-17.499 0-31.685 14.186-31.685 31.686v31.686c0 17.5 14.186 31.685 31.686 31.685h44.359v47.529c0 17.5 14.186 31.685 31.686 31.685z" fill="#1de7b5" p-id="10554" /></svg>        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            血糖
          </div>
          <count-to :start-val="0" :end-val="data.bloodsugars" :duration="3600" class="card-panel-num" />
        </div>
      </div>
    </el-col>
  </el-row>
</template>

<script>
import axios from 'axios'
import CountTo from 'vue-count-to'
import jwt_decode from 'jwt-decode'
import { getToken } from '@/utils/auth'

export default {
  components: {
    CountTo
  },
  data() {
    return {
      data: {
        height: 0,
        weights: 0,
        bloodpressure: { systolic: 0, diastolic: 0 },
        bloodsugars: 0
      },
      userId: null
    }
  },
  computed: {
    formattedBloodPressure() {
      const { systolic, diastolic } = this.data.bloodpressure
      return `${systolic}/${diastolic}`
    }
  },
  mounted() {
    this.setUserId()
    this.fetchData()
  },
  methods: {
    setUserId() {
      const token = getToken()
      if (token) {
        try {
          const decoded = jwt_decode(token)
          this.userId = decoded.userId || decoded.id || decoded.user_id
        } catch (error) {
          console.error('JWT 解码失败:', error)
        }
      }
    },
    async fetchData() {
      if (!this.userId) return

      try {
        const token = getToken()
        const response = await axios.get('/api/checkupItems/latest', {
          params: { userId: this.userId },
          headers: {
            Authorization: `Bearer ${token}`
          }
        })

        const items = response.data

        const dataMap = {
          身高: 'height',
          体重: 'weights',
          血压: 'bloodpressure',
          血糖: 'bloodsugars'
        }

        items.forEach((item) => {
          const key = dataMap[item.itemName]

          if (key) {
            if (key === 'bloodpressure' && item.itemValue.includes('/')) {
              const [systolic, diastolic] = item.itemValue.split('/').map(Number)
              this.data.bloodpressure = { systolic, diastolic }
            } else if (!isNaN(item.itemValue)) {
              this.data[key] = Number(item.itemValue)
            }
          }
        })
      } catch (error) {
        console.error('数据获取失败:', error)
      }
    },
    handleSetLineChartData(type) {
      this.$emit('handleSetLineChartData', type)
    }
  }
}
</script>

<style lang="scss" scoped>
.panel-group {
  margin-top: 18px;

  .card-panel-col {
    margin-bottom: 32px;
  }

  .card-panel {
    height: 108px;
    cursor: pointer;
    font-size: 12px;
    position: relative;
    overflow: hidden;
    color: #666;
    background: #fff;
    box-shadow: 4px 4px 40px rgba(0, 0, 0, .05);
    border-color: rgba(0, 0, 0, .05);

    &:hover {
      .card-panel-icon-wrapper {
        color: #fff;
      }

      .icon-height {
        background: #40c9c6;
      }

      .icon-weight {
        background: #36a3f7;
      }

      .icon-blood-pressure {
        background: #f4516c;
      }

      .icon-blood-sugar {
        background: #34bfa3
      }
    }

    .icon-height {
      color: #40c9c6;
    }

    .icon-weight {
      color: #36a3f7;
    }

    .icon-blood-pressure {
      color: #f4516c;
    }

    .icon-blood-sugar {
      color: #34bfa3
    }

    .card-panel-icon-wrapper {
      float: left;
      margin: 14px 0 0 14px;
      padding: 16px;
      transition: all 0.38s ease-out;
      border-radius: 6px;
    }

    .card-panel-icon {
      float: left;
      font-size: 48px;
    }

    .card-panel-description {
      float: right;
      font-weight: bold;
      margin: 26px;
      margin-left: 0px;

      .card-panel-text {
        line-height: 18px;
        color: rgba(0, 0, 0, 0.45);
        font-size: 16px;
        margin-bottom: 12px;
      }

      .card-panel-num {
        font-size: 20px;
      }
    }
  }
}

@media (max-width:550px) {
  .card-panel-description {
    display: none;
  }

  .card-panel-icon-wrapper {
    float: none !important;
    width: 100%;
    height: 100%;
    margin: 0 !important;

    .svg-icon {
      display: block;
      margin: 14px auto !important;
      float: none !important;
    }
  }
}
</style>
