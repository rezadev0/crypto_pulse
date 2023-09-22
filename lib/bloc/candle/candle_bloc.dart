import 'package:cypto_pulse/bloc/candle/candle_event.dart';
import 'package:cypto_pulse/bloc/candle/candle_state.dart';
import 'package:cypto_pulse/data/repository/candle_repository.dart';
import 'package:cypto_pulse/getIt/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CandleBloc extends Bloc<CandleEvent, CandleState> {
  CandleBloc() : super(CandleLoadingState()) {
    final MainCandleRepository repository = getIt.get();
    on<CandleInitializedDataEvent>((event, emit) async {
      emit(CandleLoadingState());
      var candleList = await repository.getCandles(event.id);
      emit(CandleResponseState(candleList: candleList));
    });
  }
}
