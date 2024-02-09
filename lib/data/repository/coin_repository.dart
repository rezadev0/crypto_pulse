// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:cypto_pulse/data/datasource/coin_datasource.dart';
import 'package:cypto_pulse/data/models/coin.dart';

abstract class MainCoinRepository {
  Future<Either<String, List<Coin>>> getCoins();
}

class CoinRepository extends MainCoinRepository {
  final MainCoinDatasource coinDatasource;
  CoinRepository({
    required this.coinDatasource,
  });
  @override
  Future<Either<String, List<Coin>>> getCoins() async {
    try {
      var response = await coinDatasource.getCoins();
      return right(response);
    } on DioException catch (ex) {
      return left(ex.message!);
    }
  }
}
