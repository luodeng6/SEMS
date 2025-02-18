// src/plugins/chart.js
import { Chart, registerables } from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';

// 注册所有 Chart.js 的注册项和数据标签插件
Chart.register(...registerables);
Chart.register(ChartDataLabels);

// 导出 Chart 对象以供整个应用程序使用
export default Chart;
