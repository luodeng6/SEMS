import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

//状态->对象
const state = sessionStorage.getItem("state") ? JSON.parse(sessionStorage.getItem("state")) : {
    user: {
        username: '',
        name: '',
        age: 20
    }
};
//获取状态
const getters = {
    //获取user
    getUser(state) {
        return state.user
    }
};
//修改状态
const mutations = {
    //修改user
    updateUser(state, user) {
        state.user = user
    }
};
//触发状态修改--异步操作。异步执行mutations里的方法
const actions = {
    //异步操作--修改user
    async updateUserAction(context, user) {
        //...
        context.commit('updateUser', user)
    }
};
//模块化
const modules = {}


export default new Vuex.Store(
    state,
    getters,
    mutations,
    actions,
    modules
)
