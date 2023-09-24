import 'package:bloc/bloc.dart';
import 'package:cypto_pulse/bloc/home/home_event.dart';
import 'package:cypto_pulse/bloc/home/home_state.dart';
import 'package:cypto_pulse/data/models/coin.dart';
import 'package:cypto_pulse/data/repository/coin_repository.dart';
import 'package:cypto_pulse/getIt/get_it.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final MainCoinRepository _coinRepository = getIt.get();
  CoinBloc() : super(CoinLoadingState()) {
    on<CoinResponseEvent>((event, emit) async {
      emit(CoinLoadingState());
      var coinList = await _coinRepository.getCoins();
      emit(CoinResponseState(coinList: coinList));
    });
    on<CoinSearchEvent>((event, emit) async {
      var coinlist = await _coinRepository.getCoins();
      List<Coin> coins = [];
      List<Coin> resultSearch = [];
      coinlist.fold((l) => null, (r) {
        coins = r;
      });
      resultSearch = coins.where((element) {
        return element.name.toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      emit(CoinResultSearchState(resultCoinList: resultSearch));
    });
  }
}
