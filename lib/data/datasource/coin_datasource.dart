// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:cypto_pulse/data/models/coin.dart';

abstract class MainCoinDatasource {
  Future<List<Coin>> getCoins();
}

class CoinDatasource extends MainCoinDatasource {
  final Dio dio ;
  CoinDatasource({
    required this.dio,
  });
  @override
  Future<List<Coin>> getCoins() async {
    try {
      var response = await dio.get(
          'markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true');
      List<Coin> coinList = response.data
          .map<Coin>((jsonMapObject) => Coin.fromJson(jsonMapObject))
          .toList();
      return coinList;
    } catch (e) {
      rethrow;
    }
  }
}
