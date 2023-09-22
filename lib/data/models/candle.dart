// ignore_for_file: public_member_api_docs, sort_constructors_first
class Candle {
  int time;
  double openValue;
  double highValue;
  double lowValue;
  double closeValue;
  Candle({
    required this.time,
    required this.openValue,
    required this.highValue,
    required this.lowValue,
    required this.closeValue,
  });
  factory Candle.fromJson(List<dynamic> candleList) {
    return Candle(
      time: candleList[0],
      openValue: candleList[1],
      highValue: candleList[2],
      lowValue: candleList[3],
      closeValue: candleList[4],
    );
  }
}
