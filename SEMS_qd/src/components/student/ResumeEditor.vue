<template>
  <div class="resume-editor">
    <h1>个人简历编辑</h1>

    <!-- 新增个人信息字段 -->
    <div class="form-item">
      <label>姓名：</label>
      <input v-model="resume.name" type="text" placeholder="请输入姓名" required>
      <span class="error" v-if="errors.name">{{ errors.name }}</span>
    </div>

    <div class="form-item">
      <label>邮箱：</label>
      <input v-model="resume.email" type="email" placeholder="请输入邮箱" required>
      <span class="error" v-if="errors.email">{{ errors.email }}</span>
    </div>

    <div class="form-item">
      <label>电话：</label>
      <input v-model="resume.phone" type="tel" placeholder="请输入电话" required>
      <span class="error" v-if="errors.phone">{{ errors.phone }}</span>
    </div>

    <div class="form-item">
      <label>个人简介：</label>
      <div ref="editorContainer" class="editor-container"></div>
      <span class="error" v-if="errors.intro">{{ errors.intro }}</span>
    </div>

    <div class="form-actions">
      <button @click="submitResume" :disabled="isSubmitting">
        {{ isSubmitting ? '提交中...' : '提交简历' }}
      </button>
    </div>

    <div v-if="submitted" class="submitted-resume">
      <h2>提交的简历内容</h2>
      <div class="resume-content">
        <p><strong>姓名：</strong>{{ resume.name }}</p>
        <p><strong>邮箱：</strong>{{ resume.email }}</p>
        <p><strong>电话：</strong>{{ resume.phone }}</p>
        <div class="intro-content" v-html="resume.intro"></div>
      </div>
    </div>
  </div>
</template>

<script>
import WangEditor from 'wangeditor'

export default {
  data() {
    return {
      resume: {
        name: '',
        email: '',
        phone: '',
        intro: '',
      },
      errors: {
        name: '',
        email: '',
        phone: '',
        intro: ''
      },
      editor: null,
      submitted: false,
      isSubmitting: false
    }
  },
  mounted() {
    this.initializeEditor()
  },
  methods: {
    initializeEditor() {
      this.editor = new WangEditor(this.$refs.editorContainer)
      this.editor.config.onchange = html => {
        this.resume.intro = html
      }
      this.editor.config.zIndex = 10  // 解决可能的下拉菜单遮挡问题
      this.editor.create()
    },
    validateForm() {
      let isValid = true
      const newErrors = {name: '', email: '', phone: '', intro: ''}

      if (!this.resume.name.trim()) {
        newErrors.name = '姓名不能为空'
        isValid = false
      }

      if (!this.resume.email.trim()) {
        newErrors.email = '邮箱不能为空'
        isValid = false
      } else if (!/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/.test(this.resume.email)) {
        newErrors.email = '邮箱格式不正确'
        isValid = false
      }

      if (!this.resume.phone.trim()) {
        newErrors.phone = '电话不能为空'
        isValid = false
      } else if (!/^1[3-9]\d{9}$/.test(this.resume.phone)) {
        newErrors.phone = '电话号码格式不正确'
        isValid = false
      }

      if (!this.resume.intro.trim()) {
        newErrors.intro = '个人简介不能为空'
        isValid = false
      }

      this.errors = newErrors
      return isValid
    },
    async submitResume() {
      if (!this.validateForm()) return

      this.isSubmitting = true
      try {
        // 这里可以添加实际的API调用
        // await axios.post('/api/resume', this.resume)
        this.submitted = true
        this.$nextTick(() => {
          window.scrollTo({top: document.body.scrollHeight, behavior: 'smooth'})
        })
      } finally {
        this.isSubmitting = false
      }
    }
  },
  beforeDestroy() {
    this.editor?.destroy()
  }
}
</script>

<style scoped>
.resume-editor {
  max-width: 1000px;
  margin: 20px auto;
  padding: 30px;
  background: #f8f9fa;
  border-radius: 8px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

.form-item {
  margin-bottom: 25px;
}

label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  color: #333;
}

input[type="text"],
input[type="email"],
input[type="tel"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 14px;
}

.editor-container {
  border: 1px solid #ddd;
  border-radius: 4px;
  min-height: 400px;
  background: white;
}

.error {
  color: #dc3545;
  font-size: 12px;
  margin-top: 4px;
  display: block;
}

.form-actions {
  margin-top: 30px;
  text-align: center;
}

button {
  padding: 12px 40px;
  background-color: #88cdad;
  color: white;
  border: none;
  border-radius: 25px;
  cursor: pointer;
  font-size: 16px;
  transition: all 0.3s;
}

button:hover {
  background-color: #368d6a;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

.submitted-resume {
  margin-top: 40px;
  padding: 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.resume-content {
  line-height: 1.6;
}

.resume-content p {
  margin: 10px 0;
}

.intro-content {
  margin-top: 20px;
  padding: 15px;
  border: 1px solid #eee;
  border-radius: 4px;
}
</style>