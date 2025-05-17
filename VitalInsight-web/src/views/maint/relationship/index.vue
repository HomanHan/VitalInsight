<template>
  <div class="app-container">
    <!--工具栏-->
    <div class="head-container">
      <div v-if="crud.props.searchToggle">
        <!-- 搜索 -->
        <label class="el-form-item-label">亲友用户ID</label>
        <el-input v-model="query.relatedUserId" clearable placeholder="亲友用户ID" style="width: 185px;" class="filter-item" @keyup.enter.native="crud.toQuery" />
        <label class="el-form-item-label">关系类型</label>
        <el-input v-model="query.relationshipType" clearable placeholder="关系类型" style="width: 185px;" class="filter-item" @keyup.enter.native="crud.toQuery" />
        <rrOperation :crud="crud" />
      </div>
      <!--如果想在工具栏加入更多按钮，可以使用插槽方式， slot = 'left' or 'right'-->
      <crudOperation :permission="permission" />
      <!--表单组件-->
      <el-dialog :close-on-click-modal="false" :before-close="crud.cancelCU" :visible.sync="crud.status.cu > 0" :title="crud.status.title" width="500px">
        <el-form ref="form" :model="form" :rules="rules" size="small" label-width="80px">
          <el-form-item label="亲友用户ID" prop="relatedUserId">
            <el-input v-model="form.relatedUserId" style="width: 370px;" />
          </el-form-item>
          <el-form-item label="关系类型" prop="relationshipType">
            <el-input v-model="form.relationshipType" style="width: 370px;" />
          </el-form-item>
          <el-form-item label="关系创建时间">
            <el-date-picker v-model="form.createdAt" type="datetime" style="width: 370px;" />
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
        <el-table-column prop="userId" label="用户ID" />
        <el-table-column prop="relatedUserId" label="亲友用户ID" />
        <el-table-column prop="relationshipType" label="关系类型" />
        <el-table-column prop="createdAt" label="关系创建时间" />
        <el-table-column v-if="checkPer(['admin','sysRelationships:edit','sysRelationships:del'])" label="操作" width="150px" align="center">
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
import crudSysRelationships from '@/api/sysRelationships'
import CRUD, { presenter, header, form, crud } from '@crud/crud'
import rrOperation from '@crud/RR.operation'
import crudOperation from '@crud/CRUD.operation'
import udOperation from '@crud/UD.operation'
import pagination from '@crud/Pagination'

const defaultForm = { id: null, userId: null, relatedUserId: null, relationshipType: null, createdAt: null }
export default {
  name: 'SysRelationships',
  components: { pagination, crudOperation, rrOperation, udOperation },
  mixins: [presenter(), header(), form(defaultForm), crud()],
  cruds() {
    return CRUD({ title: 'relationship', url: 'api/sysRelationships', idField: 'id', sort: 'id,desc', crudMethod: { ...crudSysRelationships }})
  },
  data() {
    return {
      permission: {
        add: ['admin', 'sysRelationships:add'],
        edit: ['admin', 'sysRelationships:edit'],
        del: ['admin', 'sysRelationships:del']
      },
      rules: {
        relatedUserId: [
          { required: true, message: '亲友用户ID不能为空', trigger: 'blur' }
        ],
        relationshipType: [
          { required: true, message: '关系类型不能为空', trigger: 'blur' }
        ]
      },
      queryTypeOptions: [
        { key: 'relatedUserId', display_name: '亲友用户ID' },
        { key: 'relationshipType', display_name: '关系类型' }
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
