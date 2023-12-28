import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({super.key});

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  List<_ChartData>? chartData;

  @override
  Widget build(BuildContext context) {
    return _buildDefaultLineChart();
  }

  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
        borderColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(.8),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        interval: 1,
        majorGridLines: const MajorGridLines(width: .5, color: Colors.white),
        majorTickLines:
            const MajorTickLines(width: .5, color: Colors.white, size: 10),
      ),
      primaryYAxis: NumericAxis(
        interval: 10,
        maximum: 50,
        minimum: 10,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(.8),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        borderColor: Colors.white,
        majorGridLines: const MajorGridLines(width: .5, color: Colors.white),
        majorTickLines:
            const MajorTickLines(width: .5, color: Colors.white, size: 20),
      ),
      series: _getDefaultLineSeries(),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<_ChartData, dynamic>> _getDefaultLineSeries() {
    return <LineSeries<_ChartData, dynamic>>[
      LineSeries<_ChartData, dynamic>(
        color: Colors.white,
        width: 10,
        dataSource: [
          _ChartData(1, 21),
          _ChartData(2, 15),
          _ChartData(3, 18),
          _ChartData(4, 30),
          _ChartData(5, 35),
          _ChartData(6, 32),
          _ChartData(7, 48),
        ],
        xValueMapper: (_ChartData sales, _) => sales.x,
        enableTooltip: true,
        yValueMapper: (_ChartData sales, _) => sales.y,
        markerSettings: const MarkerSettings(
          isVisible: true,
          borderColor: Colors.white,
          borderWidth: 4,
          width: 15,
          height: 15,
          color: Colors.orange,
        ),
      ),
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final dynamic x;
  final double y;
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
