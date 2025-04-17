// src/services/websocket.js
import Vue from 'vue'
import SockJS from 'sockjs-client';
import Stomp from 'webstomp-client';
import {NOWIP} from "@/NOWIP";
const WebSocketService = new Vue({
    data() {
        return {
            stompClient: null,
            connected: false,
            eventBus: new Vue()
        }
    },
    methods: {
        connect() {
            if (this.connected) return

            const socket = new SockJS(`http://${NOWIP}:83/chat`)
            this.stompClient = Stomp.over(socket)

            this.stompClient.connect({}, () => {
                this.connected = true
                this.stompClient.subscribe('/topic/messages', message => {
                    const msg = JSON.parse(message.body)
                    // 通过事件总线广播消息
                    this.eventBus.$emit('websocket-message', msg)
                })
            })
        },

        subscribe(callback) {
            this.eventBus.$on('websocket-message', callback)
        },

        unsubscribe(callback) {
            this.eventBus.$off('websocket-message', callback)
        }
    }
})

// 挂载到Vue原型
Vue.prototype.$socket = WebSocketService

export default WebSocketService