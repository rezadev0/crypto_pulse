import 'package:cypto_pulse/data/datasource/coin_datasource.dart';
import 'package:cypto_pulse/data/models/coin.dart';
import 'package:cypto_pulse/getIt/get_it.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class MainCoinRepository {
  Future<Either<String, List<Coin>>> getCoins();
}

class CoinRepository extends MainCoinRepository {
  final MainCoinDatasource _coinDatasource = getIt.get();
  @override
  Future<Either<String, List<Coin>>> getCoins() async {
    try {
      var response = await _coinDatasource.getCoins();
      return right(response);
    } on DioException catch (ex) {
      return left(ex.message!);
    }
  }
}
