import 'package:cypto_pulse/data/models/candle.dart';
import 'package:cypto_pulse/getIt/get_it.dart';
import 'package:dio/dio.dart';

abstract class MainCandleDatasoure {
  Future<List<Candle>> getCandles(String id);
}

class CandleDatasource extends MainCandleDatasoure {
  final Dio _dio = getIt.get();
  @override
  Future<List<Candle>> getCandles(String id) async {
    try {
      var response = await _dio.get('$id/ohlc?vs_currency=usd&days=7');
      List<Candle> cnadleList = response.data
          .map<Candle>((candleDtat) => Candle.fromJson(candleDtat))
          .toList();
      return cnadleList;
    } catch (e) {
      rethrow;
    }
  }
}
