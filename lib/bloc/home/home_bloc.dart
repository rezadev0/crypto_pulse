import 'package:bloc/bloc.dart';
import 'package:cypto_pulse/bloc/home/home_event.dart';
import 'package:cypto_pulse/bloc/home/home_state.dart';
import 'package:cypto_pulse/data/repository/coin_repository.dart';
import 'package:cypto_pulse/getIt/get_it.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MainCoinRepository _coinRepository = getIt.get();
  HomeBloc() : super(HomeLoadingState()) {
    on<HomeResponseEvent>((event, emit) async {
      emit(HomeLoadingState());
      var coinList = await _coinRepository.getCoins();
      emit(HomeResponseState(coinList: coinList));
    });
  }
}
