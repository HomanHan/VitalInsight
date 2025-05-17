<template>
  <div class="institute-page">
    <el-card shadow="hover">
      <h2>体检机构一览</h2>
      <el-table :data="institutes" style="width: 100%">
        <el-table-column prop="name" label="机构名称" width="200" />
        <el-table-column prop="location" label="所在地区" width="150" />
        <el-table-column prop="averageScore" label="综合评分" width="180">
          <template slot-scope="{ row }">
            <el-rate
              :value="row.averageScore"
              disabled
              show-score
              score-template="{value}"
              allow-half
            />
          </template>
        </el-table-column>
        <el-table-column prop="projects" label="体检项目">
          <template slot-scope="{ row }">
            <el-tag
              v-for="(item, index) in row.projects"
              :key="index"
              class="tag-item"
              type="success"
              size="small"
            >
              {{ item }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="reviews" label="热门评价">
          <template slot-scope="{ row }">
            <div v-for="(review, index) in row.reviews.slice(0, 2)" :key="index">
              <el-rate :value="review.rating" disabled allow-half />
              <p class="review-content">{{ review.comment }}</p>
            </div>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'InstitutePage',
  data() {
    return {
      institutes: [
        {
          name: '北京协和医院',
          location: '北京',
          projects: ['全身检查', '肿瘤筛查', '脑部CT'],
          reviews: [
            { rating: 5, comment: '医生权威，体验很好' },
            { rating: 4, comment: '流程清晰，就是人多' },
            { rating: 5, comment: '检查设备先进' }
          ]
        },
        {
          name: '爱康体检中心',
          location: '上海',
          projects: ['血常规', '肝功能', '心电图'],
          reviews: [
            { rating: 5, comment: '服务很好，医生很专业' },
            { rating: 4, comment: '流程清晰，环境干净' }
          ]
        },
        {
          name: '美年大健康',
          location: '北京',
          projects: ['CT检查', '超声波', '肿瘤标志物'],
          reviews: [
            { rating: 3, comment: '人有点多，等的时间长' },
            { rating: 4, comment: '项目还算全面' }
          ]
        },
        {
          name: '瑞慈体检中心',
          location: '南京',
          projects: ['基础检查', '视力检测', '内科检查'],
          reviews: [
            { rating: 4, comment: '服务好，但停车不方便' },
            { rating: 5, comment: '体检流程高效，态度好' }
          ]
        },
        {
          name: '慈铭健康体检',
          location: '广州',
          projects: ['血糖检测', '肝胆B超', '心电图'],
          reviews: [
            { rating: 3, comment: '报告出的慢' },
            { rating: 4, comment: '医生专业，值得推荐' }
          ]
        },
        {
          name: '平安好医生体检中心',
          location: '深圳',
          projects: ['妇科检查', 'HPV检测', '胸透'],
          reviews: [
            { rating: 5, comment: '环境新、服务好' },
            { rating: 5, comment: '医生讲解细致' }
          ]
        },
        {
          name: '万达健康体检中心',
          location: '杭州',
          projects: ['耳鼻喉科', '血脂分析', '骨密度测定'],
          reviews: [
            { rating: 4, comment: '检查速度快' },
            { rating: 4, comment: '体验不错，推荐' }
          ]
        }
      ]
    }
  },
  created() {
    this.institutes.forEach((institute) => {
      const total = institute.reviews.reduce((sum, r) => sum + r.rating, 0)
      institute.averageScore = institute.reviews.length
        ? parseFloat((total / institute.reviews.length).toFixed(1))
        : 0
    })
  }
}
</script>

<style scoped>
.institute-page {
  padding: 20px;
}
.tag-item {
  margin: 2px;
}
.review-content {
  margin: 4px 0 10px 0;
  font-size: 13px;
  color: #555;
}
</style>
