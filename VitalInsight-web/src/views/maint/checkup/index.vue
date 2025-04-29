<template>
  <div class="app-container">
    <!--工具栏-->
    <div class="head-container">
      <div v-if="crud.props.searchToggle">
        <!-- 搜索 -->
        <label class="el-form-item-label">体检报告ID（外键，关联体检报告表）</label>
        <el-input v-model="query.reportId" clearable placeholder="体检报告ID（外键，关联体检报告表）" style="width: 185px;" class="filter-item" @keyup.enter.native="crud.toQuery" />
        <label class="el-form-item-label">体检项目名称（如身高、体重）</label>
        <el-input v-model="query.itemName" clearable placeholder="体检项目名称（如身高、体重）" style="width: 185px;" class="filter-item" @keyup.enter.native="crud.toQuery" />
        <label class="el-form-item-label">体检项目值（如175 cm）</label>
        <el-input v-model="query.itemValue" clearable placeholder="体检项目值（如175 cm）" style="width: 185px;" class="filter-item" @keyup.enter.native="crud.toQuery" />
        <label class="el-form-item-label">正常参考值范围</label>
        <el-input v-model="query.referenceRange" clearable placeholder="正常参考值范围" style="width: 185px;" class="filter-item" @keyup.enter.native="crud.toQuery" />
        <date-range-picker
          v-model="query.updatedAt"
          start-placeholder="updatedAtStart"
          end-placeholder="updatedAtStart"
          class="date-item"
        />
        <rrOperation :crud="crud" />
      </div>
      <!--如果想在工具栏加入更多按钮，可以使用插槽方式， slot = 'left' or 'right'-->
      <crudOperation :permission="permission" />
      <!--表单组件-->
      <el-dialog :close-on-click-modal="false" :before-close="crud.cancelCU" :visible.sync="crud.status.cu > 0" :title="crud.status.title" width="500px">
        <el-form ref="form" :model="form" :rules="rules" size="small" label-width="80px">
          <el-form-item label="体检报告ID（外键，关联体检报告表）" prop="reportId">
            <el-input v-model="form.reportId" style="width: 370px;" />
          </el-form-item>
          <el-form-item label="体检项目名称（如身高、体重）" prop="itemName">
            <el-select v-model="form.itemName" filterable placeholder="请选择">
              <el-option
                v-for="item in dict.体检项目"
                :key="item.id"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="体检项目值（如175 cm）" prop="itemValue">
            <el-input v-model="form.itemValue" style="width: 370px;" />
          </el-form-item>
          <el-form-item label="正常参考值范围" prop="referenceRange">
            <el-input v-model="form.referenceRange" style="width: 370px;" />
          </el-form-item>
          <el-form-item label="记录最后更新时间">
            <el-date-picker v-model="form.updatedAt" type="datetime" style="width: 370px;" />
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button type="text" @click="crud.cancelCU">取消</el-button>
          <el-button :loading="crud.status.cu === 2" type="primary" @click="crud.submitCU">确认</el-button>
        </div>
      </el-dialog>
      <!--表格渲染-->
      <el-table ref="table" v-loading="crud.loading" :data="crud.data" size="small" style="width: 100%;" @selection-change="crud.selectionChangeHandler">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="reportId" label="体检报告ID（外键，关联体检报告表）" />
        <el-table-column prop="itemName" label="体检项目名称（如身高、体重）">
          <template slot-scope="scope">
            {{ dict.label.体检项目[scope.row.itemName] }}
          </template>
        </el-table-column>
        <el-table-column prop="itemValue" label="体检项目值（如175 cm）" />
        <el-table-column prop="referenceRange" label="正常参考值范围" />
        <el-table-column prop="updatedAt" label="记录最后更新时间" />
        <el-table-column v-if="checkPer(['admin','checkupItems:edit','checkupItems:del'])" label="操作" width="150px" align="center">
          <template slot-scope="scope">
            <udOperation
              :data="scope.row"
              :permission="permission"
            />
          </template>
        </el-table-column>
      </el-table>
      <!--分页组件-->
      <pagination />
    </div>
  </div>
</template>

<script>
import crudCheckupItems from '@/api/checkupItems'
import CRUD, { presenter, header, form, crud } from '@crud/crud'
import rrOperation from '@crud/RR.operation'
import crudOperation from '@crud/CRUD.operation'
import udOperation from '@crud/UD.operation'
import pagination from '@crud/Pagination'

const defaultForm = { itemId: null, reportId: null, itemName: null, itemValue: null, referenceRange: null, createdAt: null, updatedAt: null }
export default {
  name: 'CheckupItems',
  components: { pagination, crudOperation, rrOperation, udOperation },
  mixins: [presenter(), header(), form(defaultForm), crud()],
  dicts: ['体检项目'],
  cruds() {
    return CRUD({ title: 'view_checkup_items', url: 'api/checkupItems', idField: 'itemId', sort: 'itemId,desc', crudMethod: { ...crudCheckupItems }})
  },
  data() {
    return {
      permission: {
        add: ['admin', 'checkupItems:add'],
        edit: ['admin', 'checkupItems:edit'],
        del: ['admin', 'checkupItems:del']
      },
      rules: {
        reportId: [
          { required: true, message: '体检报告ID（外键，关联体检报告表）不能为空', trigger: 'blur' }
        ],
        itemName: [
          { required: true, message: '体检项目名称（如身高、体重）不能为空', trigger: 'blur' }
        ],
        itemValue: [
          { required: true, message: '体检项目值（如175 cm）不能为空', trigger: 'blur' }
        ],
        referenceRange: [
          { required: true, message: '正常参考值范围不能为空', trigger: 'blur' }
        ]
      },
      queryTypeOptions: [
        { key: 'reportId', display_name: '体检报告ID（外键，关联体检报告表）' },
        { key: 'itemName', display_name: '体检项目名称（如身高、体重）' },
        { key: 'itemValue', display_name: '体检项目值（如175 cm）' },
        { key: 'referenceRange', display_name: '正常参考值范围' }
      ]
    }
  },
  methods: {
    // 钩子：在获取表格数据之前执行，false 则代表不获取数据
    [CRUD.HOOK.beforeRefresh]() {
      return true
    }
  }
}
</script>

<style scoped>

</style>
