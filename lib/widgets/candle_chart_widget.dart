import 'package:cypto_pulse/data/models/candle.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CandleChart extends StatelessWidget {
  const CandleChart({super.key, required this.candleList});
  final List<Candle> candleList;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      series: [
        CandleSeries(
          dataSource: candleList,
          xValueMapper: (candleList, _) => candleList.time,
          lowValueMapper: (candleList, _) => candleList.lowValue,
          highValueMapper: (candleList, _) => candleList.highValue,
          openValueMapper: (candleList, _) => candleList.openValue,
          closeValueMapper: (candleList, _) => candleList.closeValue,
        )
      ],
    );
  }
}
