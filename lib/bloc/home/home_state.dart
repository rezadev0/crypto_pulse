// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:cypto_pulse/data/models/coin.dart';

abstract class CoinState {}

class CoinLoadingState extends CoinState {}

class CoinResponseState extends CoinState {
  Either<String, List<Coin>> coinList;
  CoinResponseState({
    required this.coinList,
  });
}

class CoinResultSearchState extends CoinState {
  List<Coin> resultCoinList;
  CoinResultSearchState({
    required this.resultCoinList,
  });
}
