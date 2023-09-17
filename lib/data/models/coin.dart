class Coin {
  String id;
  String symbol;
  String image;
  String name;
  num currentPrice;
  double priceChangePercentage_24h;
  List price;
  int rank;

  List<double> get filterClosePrices {
    //! result list is a list that contain of price coin without closeprice and duplicate valuse//!

    List<double> result = [];
    List<double> priceDiffrences = [];

    //* this loop result to a list of price diffrences:

    for (var i = 1; i < price.length; i++) {
      priceDiffrences.add((price[i] - price[i - 1]).abs());
    }

    //? use reduse method to get average telorance:

    double averageTolerance =
        priceDiffrences.reduce((value, element) => (value + element)) /
            priceDiffrences.length;
    // add first price to list
    result.add(price[0].toDouble());

    //! add prices that diffrences greater than average tolerance:

    for (int i = 1; i < price.length; i++) {
      double diff = (price[i] - result.last).abs();
      if (diff >= averageTolerance && !result.contains(price[i])) {
        result.add(price[i].toDouble());
      }
    }
    return result;
  }

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
