import 'package:cypto_pulse/data/models/coin.dart';
import 'package:cypto_pulse/getIt/get_it.dart';
import 'package:dio/dio.dart';

abstract class MainCoinDatasource {
  Future<List<Coin>> getCoins();
}

class CoinDatasource extends MainCoinDatasource {
  final Dio _dio = getIt.get();
  @override
  Future<List<Coin>> getCoins() async {
    try {
      var response = await _dio.get(
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
