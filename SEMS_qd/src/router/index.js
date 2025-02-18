import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/views/login.vue'
import axios from "axios";
import index from "@/Index.vue";

import {ServerIP} from "@/SystemConfig";

Vue.use(VueRouter)

// 页面类型分为：管理员、学生、教师、单位、public   ；对应为meta.style，所有用户都能访问public页面,即：style表示只能哪种用户可以访问
// canRunUser: 表示访问时检查是否登录，如果登录，canRunUser属性值必须与登录用户的角色一致，才会触发跳转，
// runTo: 表示登录成功后跳转的页面


const routes = [
    {
        //全用户首页
        path: "/",
        name: "index",
        component: index,
        meta: {style: 'public',title: '学生就业信息系统-欢迎广大师生用人单位^-^!!'} // 不需要认证的路由
    },
    {
        // 登录页面管理员
        path: '/Login',
        name: 'Login',
        component: Login,
        meta: {style: 'public', canRunUser: "管理员", runTo: "AdminIndex"} // 不需要认证的路由
    },
    {
        // 管理员首页
        path: '/admin/index',
        name: 'AdminIndex',
        //懒加载
        component: () => import('@/views/admin/Admin_index.vue'),
        // component: AdminIndex,
        meta: {style: "管理员"}
    },
    {
        //```学生管理```
        path: '/admin/stu',
        name: 'AdminStu',
        //懒加载
        component: () => import('@/views/admin/Admin_stu.vue'),
        meta: {style: '管理员'}
    },
    {
        // 岗位管理管理
        path: '/admin/job',
        name: 'AdminJob',
        //懒加载
        component: () => import('@/views/admin/Admin_Job.vue'),
        meta: {style: '管理员'} // 需要认证的路由
    },
    {
        //·教师管理·
        path: '/admin/teacher',
        name: 'AdminTeacher',
        component: () => import('@/views/admin/Admin_teacher.vue'),
        meta: {style: '管理员'} // 需要认证的路由
    },
    {
        // 基础数据管理
        path: '/admin/jcsj',
        name: 'AdminJcsj',

        component: () => import('@/views/admin/Admin_JCSJ.vue'),
        meta: {style: '管理员'} // 需要认证的路由
    },
    {
        //单位管理
        path: '/admin/dwgl',
        name: 'AdminDwgl',
        component: () => import('@/views/admin/Admin_DWGL.vue'),
        meta: {style: '管理员'} // 需要认证的路由
    },
    {
        // 招聘会管理
        path: '/admin/Zph',
        name: 'AdminZph',
        component: () => import('@/views/admin/Admin_ZPH.vue'),
        meta: {style: '管理员'}
    }, {
        // 学生简历管理
        path: '/admin/xsjl',
        name: 'AdminXsjl',
        component: () => import('@/views/admin/Admin_XsJl.vue'),
        meta: {style: '管理员'}
    }, {
        // 学生登录页面
        path: '/stu/Login',
        name: 'StudentLoginView',
        component: () => import('@/views/student/StudentLoginView.vue'),
        meta: {style: 'public', canRunUser: "学生", runTo: "StudentIndexView"}
    },
    {
        // 学生首页
        path: '/stu/index',
        name: 'StudentIndexView',
        component: () => import('@/views/student/StudentIndexView.vue'),
        meta: {style: '学生'}
    }, {
        path: '/stu/xsjl',
        name: 'StudentJlView',
        component: () => import('@/views/student/StudentJlView.vue'),
        meta: {style: '学生'}
    },
    {
        path: '/stu/job',
        name: 'StudentJobView',
        component: () => import('@/views/student/StudentJobView.vue'),
        meta: {style: '学生',title: '学生端-岗位'}
    },
    {   //职位详情-学生
        path: '/stu/jobDetail',
        name: 'StudentJobDetailView',
        component: () => import('@/views/student/StudentJobDetailView.vue'),
        meta: {style: '学生'}
    },
    {
        // 教师登录页面
        path: '/teacher/login',
        name: 'TeacherLoginView',
        component: () => import('@/views/teacher/TeacherLoginView.vue'),
        meta: {style: 'public', canRunUser: "教师", runTo: "TeacherIndexView"}
    },
    {
        // 教师首页
        path: '/teacher/index',
        name: 'TeacherIndexView',
        component: () => import('@/views/teacher/TeacherIndexView.vue'),
        meta: {style: '教师'}
    },
    {
        // 单位登录
        path: '/dw/login',
        name: 'DwLoginView',
        component: () => import('@/views/dw/DwLoginView.vue'),
        meta: {style: 'public', canRunUser: "单位", runTo: "DwIndexView"}
    },
    {  //单位首页
        path: '/dw/index',
        name: 'DwIndexView',
        component: () => import('@/views/dw/DwIndexView.vue'),
        meta: {style: '单位'}
    },
    {
        // 岗位管理
        path: '/dw/job',
        name: 'DwJob',
        component: () => import('@/views/dw/DwJob.vue'),
        meta: {style: '单位'}
    },
    {
        path: '/dw/csJob',
        name: 'csJob',
        component: () => import('@/views/dw/测试岗位管理view.vue'),
        meta: {style: '单位'}
    },
    {
        path: '/dw/AI',
        name: 'AI',
        component: () => import('@/views/dw/AI.vue'),
        meta: {style: '单位'}
    },
    {
        // 新增岗位页面
        path: '/dw/addJob',
        name: 'addJob',
        component: () =>import('@/views/dw/DwAddJobView.vue'),
        meta: {style: '单位'}
    },
    {
        // 单位用户岗位详情
        path: '/dw/jobDetail',
        name: 'dwJobDetail',
        component: () => import('@/views/dw/DwJobDetailView.vue'),
        meta: {style: '单位'}
    },
    {
        // 图片上传测试网页
        path: '/upload',
        name: 'upload',
        component: () => import('@/views/cs/ImgCsView.vue'),
        meta: {style: 'public'}
    },
    {
        // 岗位环境管理
        path: '/dw/gwhjgl',
        name : 'gwhjgl',
        component: () => import('@/views/dw/DwGwhjView.vue'),
        meta: {style: '单位'}
    },
   {
        // 系统用户管理
        path: '/admin/sysUseradmin',
        name : 'AdminUser',
        component: () => import('@/views/admin/Admin_User.vue'),
        meta: {style: '管理员'}
    },
    {
        // 管理员查看岗位详情
        path: '/admin/jobDetail',
        name: 'AdminJobDetail',
        component: () => import('@/views/admin/AdminJobDetailView.vue'),
        meta: {style: '管理员'}
    },
    {
        path: '/stu/Jlai',
        name: 'Jlai',
        component: () => import('@/components/student/JlAi.vue'),
        meta: {style: '学生'}
    },
    {
        path: '/stu/info',
        name: 'Info',
        component: () => import('@/views/student/StudentInfoView.vue'),
        meta: {style: '学生',title: '学生-个人信息'}
    },
    {
        path: '/stu/tdjl',
        name: 'StudentTdjlView',
        component: () => import('@/views/student/StudentTdjlView.vue'),
        meta: {style: '学生',title: '学生-我的投递'}
    },
    {
        path: '/dw/sqzmd',
        name : 'Sqzmd',
        component: () => import('@/views/dw/DwSQZmdView.vue'),
        meta: {style: '单位',title: '单位-学生申请名单'}
    },
    {
        path: '/dw/zhgl',
        name: 'dwzhgl',
        component: () => import('@/views/dw/DwZHGLView.vue'),
        meta: {style: '单位',title: '单位-个人信息管理'}
    },
    {
        path: '/dw/xtqqview',
        name: 'dwxqqview',
        component: () => import('@/views/dw/DwXtqqView.vue'),
        meta: {style: '单位',title: '单位-系统请求'}
    },
    {
        path: '/stu/zhgl',
        name: 'StudentZhglView',
        component: () => import('@/views/student/StudentZhglView.vue'),
        meta: {style: '学生',title: '学生-个人信息管理'}
    },
    {
        path: '/dw/msap',
        name: 'DwMsApView',
        component: () => import('@/views/dw/DwMsApView.vue'),
        meta: {style: '单位',title: '单位-面试安排'}
    }
]


const router = new VueRouter({
    mode: 'hash', // 用于去掉 URL 中的哈希(#)
    routes
})


// 在 router/index.js 或相似的文件中
import {EventBus} from '@/event-bus';
// 路由守卫
router.beforeEach((to, from, next) => {
    console.log('路由守卫检查会话开始:');
    console.log("这是要去的页面to:");
    console.log(to);
    console.log("这是从哪里来的页面from:");
    console.log(from);
    console.log("这是下一步的页面next:");
    console.log(next);

    let paths = [];
    // 提取所有 routes 的 path 并存入数组 paths
    for (let i = 0; i < routes.length; i++) {
        paths.push(routes[i].path);
    }

 /*   let paths = [
        "/",
        "/Login",
        "/admin/index",
        "/admin/stu",
        "/admin/job",
        "/admin/teacher",
        "/admin/jcsj",
        "/admin/dwgl",
        "/admin/Zph",
        "/admin/xsjl",
        "/stu/Login",
        "/stu/index",
        "/stu/xsjl",
        "/stu/job",
        "/stu/jobDetail",
        "/teacher/login",
        "/teacher/index",
        "/dw/login",
        "/dw/index",
        "/dw/job",
        "/dw/csJob",
        "/dw/AI",
        "/dw/addJob"
    ]*/

    //  routes.map(route => route.path);
   /* console.log("所有路由path:");
    console.log(paths);*/


    if (!paths.includes(to.path)) {
        window.location.href = ServerIP + '/page/page2/404.html'; // 跳转到静态的 404.html 页面
        return;
    }

    // 这里使用Axios检测Session状态
    axios.get('/user/checkSession').then(response => {
            console.log("登录状态：")
            console.log(response.data)

            if (to.meta.style === "public") {
                console.log("-----访问类型为public")
                //用户已经登录，且可以跳转
                if (response.data.result && response.data.role === to.meta.canRunUser) {
                    console.log("-----用户已经登录，且可以跳转")
                    next({name: to.meta.runTo})
                } else {
                    // 用户一登录，且不能跳转
                    console.log("-----用户访问public页面,不跳转")
                    next();
                }
            } else {
                // 用户已经登录
                if (response.data.result) {
                    if (to.meta.style !== response.data.role) {
                        console.log("----- 用户已经登录，但不能访问此页面")
                        // 用户已经登录，但不能访问此页面
                        next({name: 'index'});
                    } else {
                        console.log("-----  用户已经登录，且可以访问此页面")
                        // 用户已经登录，且可以访问此页面
                        next();
                    }
                } else {
                    // 用户未登录，都是无法访问
                    if (to.meta.style === '学生') {
                        console.log("----- 学生未登录，跳转到学生登录页面")
                        // 学生未登录，跳转到学生登录页面
                        next({name: 'StudentLoginView'});
                    } else if (to.meta.style === '管理员') {
                        console.log("----- 管理员未登录，跳转到管理员登录页面")
                        // 其他角色未登录，跳转到管理员登录页面
                        next({name: 'Login'});
                    }else if (to.meta.style === '单位') {
                        console.log("----- 单位未登录，跳转到单位登录页面")
                        // 其他角色未登录，跳转到单位登录页面
                        next({name: 'DwLoginView'});
                    }
                }
            }

            // 设置当前页面的title
            document.title = to.meta.title===undefined? '学生就业管理系统':to.meta.title;

        }
    ).catch(error => {
        // 触发弹窗显示事件/ 触发主组件的弹窗显示
        EventBus.$emit('show-auth-popup');
        next({name: 'index'}); // 检查失败，回到首页
        setTimeout(() => {
            console.error('路由守卫检查会话失败', error);
        }, 1000);
    });
})
;


export default router
