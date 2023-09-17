// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cypto_pulse/data/models/coin.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState{}
class HomeLoadingState extends HomeState{

}
class HomeResponseState extends HomeState {
  Either<String,List<Coin>> coinList;
  HomeResponseState({
    required this.coinList,
  });
}