// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CoinEvent {}

class CoinResponseEvent extends CoinEvent {}

class CoinSearchEvent extends CoinEvent {
  final String query;
  CoinSearchEvent({
    required this.query,
  });
}
