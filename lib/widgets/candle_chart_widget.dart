import 'package:cypto_pulse/data/models/candle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CandleChart extends StatefulWidget {
  const CandleChart({super.key, required this.candleList});
  final List<Candle> candleList;

  @override
  State<CandleChart> createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  late TrackballBehavior _trackballBehavior;
  late ZoomPanBehavior _zoomPanBehavior;
  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enablePanning: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      trackballBehavior: _trackballBehavior,
      zoomPanBehavior: _zoomPanBehavior,
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat.simpleCurrency(),
      ),
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat.EEEE(),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      series: [
        CandleSeries(
          bullColor: const Color(0xff16C59B),
          bearColor: const Color(0xffD95353),
          dataSource: widget.candleList,
          xValueMapper: (candleList, _) {
            DateTime dateTime =
                DateTime.fromMicrosecondsSinceEpoch(candleList.time);
            return dateTime;
          },
          lowValueMapper: (candleList, _) => candleList.lowValue,
          highValueMapper: (candleList, _) => candleList.highValue,
          openValueMapper: (candleList, _) => candleList.openValue,
          closeValueMapper: (candleList, _) => candleList.closeValue,
        )
      ],
    );
  }
}
