import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/views/login.vue'
import axios from "axios";
import index from "@/Index.vue";

import {ServerIP} from "@/SystemConfig";


Vue.use(VueRouter)

// 页面类型分为：管理员、学生、老师、单位、public   ；对应为meta.style，所有用户都能访问public页面,即：style表示只能哪种用户可以访问
// canRunUser: 表示访问时检查是否登录，如果登录，canRunUser属性值必须与登录用户的角色一致，才会触发跳转，
// runTo: 表示登录成功后跳转的页面


const routes = [
    {
        //全用户首页
        path: "/",
        name: "index",
        component: index,
        meta: {style: 'public', title: '学生就业信息系统-欢迎广大师生用人单位^-^!!'} // 不需要认证的路由
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
        //·老师管理·
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
        meta: {style: '学生', title: '学生端-岗位'}
    },
    {   //职位详情-学生
        path: '/stu/jobDetail',
        name: 'StudentJobDetailView',
        component: () => import('@/views/student/StudentJobDetailView.vue'),
        meta: {style: '学生'}
    },
    {
        // 老师登录页面
        path: '/teacher/login',
        name: 'TeacherLoginView',
        component: () => import('@/views/teacher/TeacherLoginView.vue'),
        meta: {style: 'public', canRunUser: "老师", runTo: "TeacherIndexView"}
    },
    {
        // 老师首页
        path: '/teacher/index',
        name: 'TeacherIndexView',
        component: () => import('@/views/teacher/TeacherIndexView.vue'),
        meta: {style: '老师', title: '老师-首页'}
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
        component: () => import('@/views/dw/DwAddJobView.vue'),
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
        name: 'gwhjgl',
        component: () => import('@/views/dw/DwGwhjView.vue'),
        meta: {style: '单位'}
    },
    {
        // 系统用户管理
        path: '/admin/sysUseradmin',
        name: 'AdminUser',
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
        meta: {style: '学生', title: '学生-个人信息'}
    },
    {
        path: '/stu/tdjl',
        name: 'StudentTdjlView',
        component: () => import('@/views/student/StudentTdjlView.vue'),
        meta: {style: '学生', title: '学生-我的投递'}
    },
    {
        path: '/dw/sqzmd',
        name: 'Sqzmd',
        component: () => import('@/views/dw/DwSQZmdView.vue'),
        meta: {style: '单位', title: '单位-学生申请名单'}
    },
    {
        path: '/dw/zhgl',
        name: 'dwzhgl',
        component: () => import('@/views/dw/DwZHGLView.vue'),
        meta: {style: '单位', title: '单位-个人信息管理'}
    },
    {
        path: '/dw/xtqqview',
        name: 'dwxqqview',
        component: () => import('@/views/dw/DwXtqqView.vue'),
        meta: {style: '单位', title: '单位-系统请求'}
    },
    {
        path: '/stu/zhgl',
        name: 'StudentZhglView',
        component: () => import('@/views/student/StudentZhglView.vue'),
        meta: {style: '学生', title: '学生-个人信息管理'}
    },
    {
        // 面试安排
        path: '/dw/msap',
        name: 'DwMsApView',
        component: () => import('@/views/dw/DwMsApView.vue'),
        meta: {style: '单位', title: '单位-面试安排'}
    },
    {
        //  就业咨询助手
        path: '/stu/JobHelper',
        name: 'StudentJobHelperView',
        component: () => import('@/views/student/StudentJobHelperView.vue'),
        meta: {style: '学生', title: '学生-就业咨询助手'}
    },
    {
        //单位用户岗位编辑
        path: '/dw/DwJobEditView',
        name: 'DwJobEditView',
        component: () => import('@/views/dw/DwJobEditView.vue'),
        meta: {style: '单位', title: '单位-岗位编辑'}
    }, {
        path: '/admin/xtgg',
        name: 'AdminXtgg',
        component: () => import('@/views/admin/Admin_Xtgg.vue'),
        meta: {style: '管理员', title: '管理员-系统公告'}
    }, {
        path: '/stu/jyzd',
        name: 'StudentJyzdView',
        component: () => import('@/views/student/StudentJyzdView.vue'),
        meta: {style: '学生', title: '学生-就业指导'}
    }, {
        // 面试复盘
        path: '/stu/msfp',
        name: 'DwJyzdView',
        component: () => import('@/views/student/StudentMsfpView.vue'),
        meta: {style: '学生', title: '学生-面试复盘'}
    },
    {
        // 面试确认
        path: '/stu/msqr',
        name: 'StudentMsqrView',
        component: () => import('@/views/student/StudentMsqrView.vue'),
        meta: {style: '学生', title: '学生-面试确认'}
    },
    {
        // 单位信息管理
        path: '/dw/dwxxgl',
        name: 'DwDwXXGLView',
        component: () => import('@/views/dw/DwDwXXGLView.vue'),
        meta: {style: '单位', title: '单位-单位信息管理'}
    }, {
        // 单位用户信息管理
        path: '/dw/dwjobs',
        name: 'StudentDwjobsView',
        component: () => import('@/views/student/StudentDwJobsView.vue'),
        meta: {style: '学生', title: '学生-单位岗位'}
    },
    {
        path: '/public/gonggaoDetail',
        name: 'PublicGongGaoDetail',
        component: () => import('@/views/publicView/PublicGongGaoDetailView.vue'),
        meta: {style: 'public', title: '公告详情'}
    },
    {
        path: '/stu/msfpDetail',
        name: 'StudentMsfpDetailView',
        component: () => import('@/views/student/StudentMsfpDetailView.vue'),
        meta: {style: '学生', title: '学生-历史面试复盘'}
    }, {
        // 学生工作经历管理
        path: '/stu/ggjl',
        name: 'StudentGgjlView',
        component: () => import('@/views/student/StudentGzjlView.vue'),
        meta: {style: '学生', title: '学生-工作经历管理'}
    },
    {
        path: '/stu/xmcg',
        name: "StudentXmcgView",
        component: () => import('@/views/student/StudentXmcgView.vue'),
        meta: {style: '学生', title: '学生-项目成果管理'}
    }, {
        path: '/dw/zpgggl',
        name: "DwZpggglView",
        component: () => import('@/views/dw/DwZpGgglView.vue'),
        meta: {style: '单位', title: '单位-招聘公告管理'}
    }, {
        path: "/dw/ggzs",
        name: "DwGgZsView",
        component: () => import('@/views/dw/DwGgzsView.vue'),
        meta: {style: '单位', title: '单位-公告展示'}
    },
    {
        path: "/admin/zpgggl",
        name: "AdminZpggView",
        component: () => import('@/views/admin/AdminZpggView.vue'),
        meta: {style: '管理员', title: '管理员-招聘公告管理'}
    },
    {
        path: "/dw/studentInfo",
        name: "DwStudentInfoView",
        component: () => import('@/views/dw/DwStudentInfoView.vue'),
        meta: {style: '单位', title: '单位-学生主页'}
    },
    {
        path: "/stu/zsgl",
        name: "StudentZSGLview",
        component: () => import('@/views/student/StudentZSGLview.vue'),
        meta: {style: '学生', title: '学生-证书管理'}
    },
    {
        path: "/dw/dwjs",
        name: "DwDwJsView",
        component: () => import('@/views/dw/DwDwJsView.vue'),
        meta: {style: '单位', title: '单位-单位简介'}
    },
    {
        path: "/stu/StudentDwInfoDetailView",
        name: "StudentDwInfoDetailView",
        component: () => import('@/views/student/StudentDwInfoDetailView.vue'),
        meta: {style: '学生', title: '学生-单位信息详情'}
    },
    {
        path: "/public/jobDetail",
        name: "PublicJobDetailView",
        component: () => import('@/views/publicView/PublicJobDetailView.vue'),
        meta: {style: 'public', title: '岗位详情'}
    },
    {
        path: "/stu/cjdgl",
        name: "StudentCjdglView",
        component: () => import('@/views/student/StudentCjdglView.vue'),
        meta: {style: '学生', title: '学生-成绩单管理'}
    },
    {
        path: "/teacher/Xscjdgl",
        name: "TeacherXscjdView",
        component: () => import('@/views/teacher/TeacherXscjdView.vue'),
        meta: {style: '老师', title: '老师-成绩单管理'}
    },

    {
        path: "/admin/ggzs",
        name: "AdminXtggdetailView",
        component: () => import('@/views/admin/AdminXtggdetailView.vue'),
        meta: {style: '管理员', title: '管理员-公告展示'}

    },
    {
        path: "/public/PublicXtggView"
        , name: "PublicXtggView"
        , component: () => import('@/views/publicView/PublicXtggView.vue')
        , meta: {style: 'public', title: '系统公告'}

    },
    {
        path: "/public/StudentXxlView"
        , name: "StudentXxlView"
        , component: () => import('@/views/student/StudentXxlView.vue')
        , meta: {style: '学生', title: '消息栏'}
    },
    {
        path: "/teacher/mystudents"
        , name: "TechaerMyStudentView"
        , component: () => import('@/views/teacher/TechaerMyStudentView.vue')
        , meta: {style: '老师', title: '学生管理'}
    },
    {
        path: "/teacher/TeacherZpggView"
        , name: "TeacherZpggView"
        , component: () => import('@/views/teacher/TeacherZpggView.vue')
        , meta: {style: '老师', title: '招聘公告管理'}
    },
    {
        path: "/teacher/TeacherZpggDetailView"
        , name: "TeacherZpggDetailView"
        , component: () => import('@/views/teacher/TeacherZpggDetailView.vue')
        , meta: {style: '老师', title: '公告详情'}
    },
    {
        path: "/teacher/TeacherZphView"
        , name: "TeacherZphView"
        , component: () => import('@/views/teacher/TeacherZphView.vue')
        , meta: {style: '老师', title: '招聘会管理'}
    },
    {
        path: "/dw/dwxxl"
        , name: "DwXxlView"
        , component: () => import('@/views/dw/DwXxlView.vue')
        , meta: {style: '单位', title: '消息栏'}
    },
    {
        path: "/dw/zphsq"
        , name: "DwZphsqView"
        , component: () => import('@/views/dw/DwZphsqView.vue')
        , meta: {style: '单位', title: '招聘会申请'}
    }
    ,
    {
        path: "/teacher/zphsh"
        , name: "TeacherZphshView"
        , component: () => import('@/views/teacher/TeacherZphshView.vue')
        , meta: {style: '老师', title: '招聘会审核核对'}
    }
    ,
    {
        path: "/teacher/msgl"
        , name: "TeacherMsglView"
        , component: () => import('@/views/teacher/TeacherMSGLView.vue')
        , meta: {style: '老师', title: '面试管理'}
    } ,
    {
        path: "/dw/zpjz"
        , name: "DwZpjzView"
        , component: () => import('@/views/dw/DwZpjzView.vue')
        , meta: {style: '单位', title: '招聘简章管理'}
    },
    {
        path: "/dw/zpjzDetail"
        , name: "DwZpjzDetailView"
        , component: () => import('@/views/dw/DwZpjzDetail.vue')
        , meta: {style: '单位', title: '招聘简章详情'}
    },
    {
        path: "/stu/zpjzDetail"
        , name: "StudentZpjzDetail"
        , component: () => import('@/views/student/StudentZpjzDetail.vue')
        , meta: {style: '学生', title: '单位招聘简章详情'}
    }
]


const router = new VueRouter({
    mode: 'hash', // 用于去掉 URL 中的哈希(#)
    routes
})


// 在 router/index.js 或相似的文件中
import {EventBus} from '@/event-bus';


router.beforeEach((to, from, next) => {
    if (to.path == "/") {
        console.log("这是首页，不做任何操作");
        return next();
    }

    if (to.path === from.path && to.fullPath === from.fullPath) {
        console.warn("⚠️ 已经在当前页面，无需跳转:", to.fullPath);
        return;
    }


    axios.get('/user/checkSession')
        .then(response => {
            console.log("登录状态：", response.data);
            let paths = [];
            // 提取所有 routes 的 path 并存入数组 paths
            for (let i = 0; i < routes.length; i++) {
                paths.push(routes[i].path);
            }

            if (!paths.includes(to.path)) {
                window.location.href = ServerIP + '/page/page2/404.html'; // 跳转到静态的 404.html 页面
                return;
            }

            if (to.meta.style === "public") {
                console.log("----- 访问类型为 public");

                if (response.data.result && response.data.role === to.meta.canRunUser) {
                    console.log("----- 用户已登录，可以跳转");
                    next({name: to.meta.runTo, params: {from: 'index'}});
                } else {
                    console.log("----- 用户访问 public 页面，不跳转");
                    next();
                }
                return; // ✅ 防止多次执行
            }

            if (response.data.result) {
                if (to.meta.style !== response.data.role) {
                    console.log("----- 用户已登录，但无权限访问");
                    next({name: 'index'});
                } else {
                    console.log("----- 用户已登录，且可以访问");
                    next();
                }
                return; // ✅ 防止多次执行
            }

            // 用户未登录
            const redirectMap = {
                '学生': 'StudentLoginView',
                '管理员': 'Login',
                '单位': 'DwLoginView',
                '老师': 'TeacherLoginView',
            };

            if (redirectMap[to.meta.style]) {
                console.log(`----- ${to.meta.style} 未登录，跳转到 ${redirectMap[to.meta.style]}`);
                next({name: redirectMap[to.meta.style]});
            } else {
                console.warn("----- 未知角色，回到首页");
                next({name: 'index'});
            }
        })
        .catch(error => {
            console.error('❌ 路由守卫检查会话失败', error);
            EventBus.$emit('show-auth-popup');
            next({name: 'index'});
        });
});


/*// 路由守卫
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

    if (!paths.includes(to.path)) {
        window.location.href = ServerIP + '/page/page2/404.html'; // 跳转到静态的 404.html 页面
        return;
    }

    axios.get('/user/checkSession').then(response => {
        console.log("登录状态：", response.data);

        if (to.meta.style === "public") {
            console.log("-----访问类型为public");

            if (response.data.result && response.data.role === to.meta.canRunUser) {
                console.log("-----用户已经登录，且可以跳转");
                return next({ name: to.meta.runTo, params: { from: 'index' } }); // 🔹 这里 return，防止 next() 被多次调用
            } else {
                console.log("-----用户访问public页面,不跳转");
                return next(); // 🔹 这里也 return
            }
        }

        if (response.data.result) {
            if (to.meta.style !== response.data.role) {
                console.log("----- 用户已经登录，但不能访问此页面");
                return next({ name: 'index' }); // 🔹 return，防止后面继续执行
            } else {
                console.log("-----  用户已经登录，且可以访问此页面");
                return next();
            }
        }

        // 用户未登录
        switch (to.meta.style) {
            case '学生':
                console.log("----- 学生未登录，跳转到学生登录页面");
                return next({ name: 'StudentLoginView' });

            case '管理员':
                console.log("----- 管理员未登录，跳转到管理员登录页面");
                return next({ name: 'Login' });

            case '单位':
                console.log("----- 单位未登录，跳转到单位登录页面");
                return next({ name: 'DwLoginView' });

            case '老师':
                console.log("----- 老师未登录，跳转到老师登录页面");
                return next({ name: 'TeacherLoginView' });

            default:
                console.log("----- 未知角色未登录!!!!!!!!!!!!!!!!");
                return next({ name: 'index' });
        }

        // 设置当前页面标题
        document.title = to.meta.title || '学生就业管理系统';

    }).catch(error => {
        // 触发弹窗事件
        EventBus.$emit('show-auth-popup');
        console.error('路由守卫检查会话失败', error);

        return next({ name: 'index' }); // 🔹 return，确保 next() 只执行一次
    });

});*/


export default router
