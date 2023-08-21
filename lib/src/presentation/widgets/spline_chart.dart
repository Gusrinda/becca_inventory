import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SplineChartTemplate extends StatelessWidget {
  const SplineChartTemplate({
    Key? key,
    required this.daftarData, required this.yString, required this.xString,
  }) : super(key: key);

  final String yString;
  final String xString;
  final List<SplineSeries<ChartData, num>> daftarData;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
          title: AxisTitle(text: xString, alignment: ChartAlignment.far),
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(width: 0),
          axisLine: AxisLine(width: 6),
          interval: 1,
          minimum: 1,
          maximum: 12),
      primaryYAxis: NumericAxis(
          title: AxisTitle(
              text: yString, alignment: ChartAlignment.center),
          axisLine: AxisLine(width: 6),
          minimum: 0,
          interval: 5,
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(width: 0)),
      series: daftarData,
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}
