// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class HomeEvent {}

class HomeResponseEvent extends HomeEvent {}

class HomeSearchEvent extends HomeEvent {
  final String query;
  HomeSearchEvent({
    required this.query,
  });
  
}
