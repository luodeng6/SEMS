<template>
  <div class="content">
    <div>
      <DwMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">学生信息管理</h1>
      </header>

      <el-form
          ref="form"
          :model="form"
          label-width="120px"
          class="p-6 bg-white rounded-lg shadow"
          :rules="rules"
          label-position="top"
      >
        <!-- 基本信息 -->
        <div class="grid grid-cols-3 gap-6 mb-8">
          <div class="col-span-1">
            <h3 class="text-lg font-medium mb-4">基本信息</h3>
            <el-form-item label="学生照片">
              <el-upload
                  action="#"
                  :show-file-list="false"
                  :before-upload="beforeAvatarUpload"
                  :on-change="handleAvatarChange"
              >
                <img v-if="form.XSZP" :src="form.XSZP" class="w-32 h-40 object-cover border rounded">
                <el-button v-else size="small" type="primary">上传照片</el-button>
              </el-upload>
            </el-form-item>
          </div>

          <div class="col-span-2 grid grid-cols-2 gap-4">
            <el-form-item label="学号" prop="XSXH">
              <el-input v-model="form.XSXH" disabled></el-input>
            </el-form-item>

            <el-form-item label="学生姓名" prop="XSXM">
              <el-input v-model="form.XSXM"></el-input>
            </el-form-item>

            <el-form-item label="性别" prop="XSXB">
              <el-select v-model="form.XSXB" class="w-full">
                <el-option label="男" value="1"></el-option>
                <el-option label="女" value="0"></el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="出生日期" prop="BIRTH">
              <el-date-picker
                  v-model="form.BIRTH"
                  type="date"
                  value-format="yyyy-MM-dd"
                  class="w-full"
              ></el-date-picker>
            </el-form-item>

            <el-form-item label="身份证号" prop="SFZH">
              <el-input v-model="form.SFZH" maxlength="18"></el-input>
            </el-form-item>

            <el-form-item label="民族" prop="MZ">
              <el-select v-model="form.MZ" class="w-full">
                <el-option
                    v-for="item in ethnicOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </div>
        </div>

        <!-- 学籍信息 -->
        <div class="grid grid-cols-3 gap-6 mb-8">
          <h3 class="text-lg font-medium col-span-full">学籍信息</h3>

          <el-form-item label="所属班级" prop="SSBJ">
            <el-input v-model="form.SSBJ"></el-input>
          </el-form-item>

          <el-form-item label="专业代码" prop="ZYDM">
            <el-select v-model="form.ZYDM" class="w-full">
              <el-option
                  v-for="major in majorOptions"
                  :key="major.dm"
                  :label="major.mc"
                  :value="major.dm"
              ></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="所属年级" prop="SSNJ">
            <el-date-picker
                v-model="form.SSNJ"
                type="year"
                value-format="yyyy"
                class="w-full"
            ></el-date-picker>
          </el-form-item>

          <el-form-item label="学制" prop="XZ">
            <el-input-number v-model="form.XZ" :min="2" :max="5"></el-input-number>
          </el-form-item>

          <el-form-item label="学历代码" prop="XLDM">
            <el-select v-model="form.XLDM" class="w-full">
              <el-option
                  v-for="item in educationOptions"
                  :key="item.dm"
                  :label="item.mc"
                  :value="item.dm"
              ></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="政治面貌" prop="ZZMM">
            <el-select v-model="form.ZZMM" class="w-full">
              <el-option label="中共党员" value="01"></el-option>
              <el-option label="共青团员" value="02"></el-option>
              <el-option label="群众" value="03"></el-option>
            </el-select>
          </el-form-item>
        </div>

        <!-- 账户信息 -->
        <div class="grid grid-cols-2 gap-6 mb-8">
          <h3 class="text-lg font-medium col-span-full">账户信息</h3>

          <el-form-item label="用户名" prop="YHM">
            <el-input v-model="form.YHM" disabled></el-input>
          </el-form-item>

          <el-form-item label="密码" prop="MM">
            <el-input v-model="form.MM" show-password></el-input>
          </el-form-item>

          <el-form-item label="就业状态" prop="JYZT">
            <el-select v-model="form.JYZT" class="w-full">
              <el-option label="已就业" value="1"></el-option>
              <el-option label="未就业" value="0"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="启用状态" prop="QYDM">
            <el-switch
                v-model="form.QYDM"
                active-value="1"
                inactive-value="0"
                active-text="启用"
                inactive-text="禁用"
            ></el-switch>
          </el-form-item>
        </div>

        <el-form-item class="mt-6">
          <el-button type="primary" @click="submitForm">保存信息</el-button>
        </el-form-item>
      </el-form>
    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";

export default {
  name: 'StudentInfo',
  components: { DwMenu },
  data() {
    return {
      form: {
        ID: '2023001',
        XSXH: '20230001',
        XSXM: '',
        XSXB: '1',
        BIRTH: '',
        YHM: 'student_2023',
        MM: '',
        SSBJ: '',
        ZYDM: '',
        SFZH: '',
        ZZMM: '03',
        SSNJ: '2023',
        XZ: 4,
        MZ: '01',
        BJMC: '',
        XLDM: '',
        JYZT: '0',
        XSZP: '',
        QYDM: '1'
      },
      rules: {
        XSXM: [{ required: true, message: '请输入学生姓名', trigger: 'blur' }],
        SFZH: [
          { required: true, message: '请输入身份证号', trigger: 'blur' },
          { pattern: /^\d{17}[\dXx]$/, message: '身份证格式不正确', trigger: 'blur' }
        ],
        MM: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 8, message: '密码长度不能小于8位', trigger: 'blur' }
        ],
        ZYDM: { required: true, message: '请选择专业', trigger: 'change' },
        XLDM: { required: true, message: '请选择学历', trigger: 'change' }
      },
      ethnicOptions: [
        { label: '汉族', value: '01' },
        { label: '蒙古族', value: '02' },
        // 其他民族选项...
      ],
      majorOptions: [
        { dm: '01', mc: '计算机科学与技术' },
        { dm: '02', mc: '软件工程' },
        // 其他专业...
      ],
      educationOptions: [
        { dm: '01', mc: '本科' },
        { dm: '02', mc: '硕士' },
        { dm: '03', mc: '博士' }
      ]
    }
  },
  methods: {
    submitForm() {
      this.$refs.form.validate(valid => {
        if (valid) {
          console.log('提交数据:', {
            ...this.form,
            BIRTH: this.formatDate(this.form.BIRTH)
          });
          this.$message.success('信息保存成功');
        } else {
          this.$message.error('请完善必填信息');
        }
      });
    },
    beforeAvatarUpload(file) {
      const isImage = file.type.startsWith('image/');
      const isLt5M = file.size / 1024 / 1024 < 5;

      if (!isImage) {
        this.$message.error('只能上传图片文件');
      }
      if (!isLt5M) {
        this.$message.error('图片大小不能超过5MB');
      }
      return isImage && isLt5M;
    },
    handleAvatarChange(file) {
      this.form.XSZP = URL.createObjectURL(file.raw);
    },
    formatDate(date) {
      // 日期格式化逻辑
    }
  }
};
</script>

<style scoped>
.el-form-item__label {
  font-weight: 500;
}
.grid div:not(.col-span-full) {
  margin-bottom: 16px;
}
</style>