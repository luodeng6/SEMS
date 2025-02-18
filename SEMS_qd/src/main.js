import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'


import 'element-ui/lib/theme-chalk/index.css'


// 引入 Bootstrap CSS
import 'bootstrap/dist/css/bootstrap.css';
// 引入 Bootstrap JS (需使用 jQuery 和 Popper.js)
import 'bootstrap/dist/js/bootstrap.bundle.min.js'; // 引入 Bootstrap 的 JS（包含 Popper.js）
import 'bootstrap-icons/font/bootstrap-icons.css'; // 引入 Bootstrap 图标
import 'bootstrap';
import Popper from 'popper.js';

import 'bootstrap/dist/css/bootstrap.min.css'; // 引入 Bootstrap 样式
import 'bootstrap/dist/js/bootstrap.bundle.min.js'; // 引入 Bootstrap JS和 Popper.js
import { Modal } from 'bootstrap';
import 'element-ui/lib/theme-chalk/index.css';


// 全局引入 Font Awesome：
import '@fortawesome/fontawesome-free/css/all.min.css'


import jQuery from 'jquery';
import 'jquery-confirm';
import 'jquery-confirm/css/jquery-confirm.css'; // 引入 jQuery Confirm 的 CSS
window.$ = window.jQuery = jQuery; // 将 jQuery 赋值给全局变量


import VTooltip from 'v-tooltip';
Vue.use(VTooltip);

// 全局引入 Element UI：
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
Vue.use(ElementUI)

// 引入 Tailwind CSS 样式文件
import '@/index.css'; // 导入 styles


// 导入 创建的 Chart.js 插件
import Chart from '@/chart.js';

// 如果需要设置 Chart.js 的全局选项（可选）
Chart.defaults.global = {
  responsive: true,
  maintainAspectRatio: false,
};

//使用状态管理器Vuex
import Vuex from 'vuex'
Vue.use(Vuex)

// import Chart from 'chart.js/auto'
// Vue.prototype.$chart = Chart
import $ from 'jquery'; // 引入 jQuery



// 将 jQuery 绑定到 Vue 原型，这样在每个组件中都可以使用
Vue.prototype.$ = $;
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')


