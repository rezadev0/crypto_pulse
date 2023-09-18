import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  const LineChart(
      {super.key, required this.coinpriceList, required this.isIncreased});
  final List<double> coinpriceList;
  final bool isIncreased;
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
        isVisible: false,
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
        maximum: coinpriceList.reduce(
          (value, element) => max(value, element),
        ),
        minimum: coinpriceList.reduce(
          (value, element) => min(value, element),
        ),
      ),
      series: [
        SplineSeries(
          dataSource: coinpriceList,
          xValueMapper: (value, index) => index,
          yValueMapper: (value, index) => value,
          pointColorMapper: (datum, index) {
            if (isIncreased) {
              if (index >= 10 && index <= coinpriceList.length - 10) {
                return const Color(0xff16FF00);
              } else {
                return const Color(0xffA6FF96);
              }
            } else {
              if (index >= 10 && index <= coinpriceList.length - 10) {
                return const Color(0xffF94C10);
              } else {
                return const Color(0xffFFCAC8);
              }
            }
          },
          splineType: SplineType.clamped,
        )
      ],
    );
  }
}
