// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CandleEvent {}

class CandleInitializedDataEvent extends CandleEvent {
  String id;
  CandleInitializedDataEvent({
    required this.id,
  });
}
