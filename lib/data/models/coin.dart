class Coin{
  String id;
  String symbol;
  String image;
  String name;
  var currentPrice;
  double priceChangePercentage_24h;
  List price;
  int rank;
  Coin({
    required this.id,
    required this.symbol,
    required this.image,
    required this.name,
    required this.currentPrice,
    required this.priceChangePercentage_24h,
    required this.price,
    required this.rank,
  });
  factory Coin.fromJson(Map<String, dynamic> jsonMapObject) {
    return Coin(
      id: jsonMapObject['id'],
      symbol: jsonMapObject['symbol'],
      image: jsonMapObject['image'],
      name: jsonMapObject['name'],
      currentPrice: jsonMapObject['current_price'],
      priceChangePercentage_24h: jsonMapObject['price_change_percentage_24h'],
      price: jsonMapObject['sparkline_in_7d']['price'],
      rank: jsonMapObject['market_cap_rank'],
    );
  }
}