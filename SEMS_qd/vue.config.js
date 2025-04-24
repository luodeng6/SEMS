const { defineConfig } = require('@vue/cli-service')
//导入webpack
const webpack = require('webpack');
const NOWIP='localhost'


module.exports = defineConfig({
  transpileDependencies: true,
  publicPath: './',

  // 手动更新webpack配置以确保正确引入gsap

  /*/!*配置代理 开发环境下可以！*!/*/
  devServer: {
    proxy:`http://localhost:83/` // 后端接口地
  }



})
/*
const { defineConfig } = require('@vue/cli-service')
// 导入 webpack（如果需要使用）
const webpack = require('webpack')

const NOWIP = 'localhost'

module.exports = defineConfig({
    transpileDependencies: true,

    // 生产环境部署路径，根据实际部署目录修改
    // 如果是根目录部署，则用 '/'
    publicPath: process.env.NODE_ENV === 'production' ? '/' : './',

    // 仅在开发环境启用代理
    devServer: process.env.NODE_ENV === 'development' ? {
        proxy: {
            '/api': {
                target: `http://${NOWIP}:83/`,
                changeOrigin: true,
                pathRewrite: { '^/api': '' }
            }
        }
    } : undefined,

    // 你可以根据需要配置 webpack 插件等
    configureWebpack: {
        plugins: [
            // 可选插件示例：全局变量等
            new webpack.DefinePlugin({
                __VUE_OPTIONS_API__: true,
                __VUE_PROD_DEVTOOLS__: false
            })
        ]
    }
})
*/
