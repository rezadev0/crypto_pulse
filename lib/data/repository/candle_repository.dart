import 'package:cypto_pulse/data/datasource/candle_datasource.dart';
import 'package:cypto_pulse/data/models/candle.dart';
import 'package:cypto_pulse/getIt/get_it.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class MainCandleRepository {
  Future<Either<String, List<Candle>>> getCandles(String id);
}

class CandleRepository extends MainCandleRepository {
  final MainCandleDatasoure _coinDatasource = getIt.get();
  @override
  Future<Either<String, List<Candle>>> getCandles(id) async {
    try {
      var response = await _coinDatasource.getCandles(id);
      return right(response);
    } on DioException catch (ex) {
      return left(ex.message!);
    }
  }
}
