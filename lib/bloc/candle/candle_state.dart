// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:cypto_pulse/data/models/candle.dart';

abstract class CandleState {}

class CandleLoadingState extends CandleState {}

class CandleResponseState extends CandleState {
Either<String,List<Candle>> candleList;
  CandleResponseState({
    required this.candleList,
  });
  
}
