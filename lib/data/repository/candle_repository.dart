// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:cypto_pulse/data/datasource/candle_datasource.dart';
import 'package:cypto_pulse/data/models/candle.dart';

abstract class MainCandleRepository {
  Future<Either<String, List<Candle>>> getCandles(String id);
}

class CandleRepository extends MainCandleRepository {
  final MainCandleDatasoure candleDatasource;
  CandleRepository({
    required this.candleDatasource,
  });
  @override
  Future<Either<String, List<Candle>>> getCandles(id) async {
    try {
      var response = await candleDatasource.getCandles(id);
      return right(response);
    } on DioException catch (ex) {
      return left(ex.message!);
    }
  }
}
