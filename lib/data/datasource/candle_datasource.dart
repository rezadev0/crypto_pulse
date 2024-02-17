// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:cypto_pulse/data/models/candle.dart';
abstract class MainCandleDatasoure {
  Future<List<Candle>> getCandles(String id);
}

class CandleDatasource extends MainCandleDatasoure {
  final Dio dio;
  CandleDatasource({
    required this.dio,
  });
  @override
  Future<List<Candle>> getCandles(String id) async {
    try {
      var response = await dio.get('$id/ohlc?vs_currency=usd&days=7');
      List<Candle> cnadleList = response.data
          .map<Candle>((candleDtat) => Candle.fromJson(candleDtat))
          .toList();
      return cnadleList;
    } catch (e) {
      rethrow;
    }
  }
}
