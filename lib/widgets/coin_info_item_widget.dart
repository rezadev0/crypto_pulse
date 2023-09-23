import 'package:cypto_pulse/bloc/candle/candle_bloc.dart';
import 'package:cypto_pulse/data/models/coin.dart';
import 'package:cypto_pulse/screens/trade_screen.dart';
import 'package:cypto_pulse/widgets/cached_image_widget.dart';
import 'package:cypto_pulse/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinInfoItem extends StatelessWidget {
  const CoinInfoItem({
    super.key,
    required this.coinList,
    required this.length,
  });
  final List<Coin> coinList;
  final int length;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => _goToTradescreen(context, index),
        child: Padding(
          padding: EdgeInsets.only(
              left: 21.0.w, top: 10.w, right: 20.w, bottom: 10.w),
          child: Container(
            padding: EdgeInsets.all(10.w),
            height: 70,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: coinList[index].priceChangePercentage_24h > 0
                      ? const Color(0xffA6FF96)
                      : const Color(0xffF94C10),
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                )
              ],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFD1D7E3).withOpacity(0.65),
              ),
            ),
            child: Row(
              children: [
                CachedImage(url: coinList[index].image),
                SizedBox(width: 11.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coinList[index].name,
                      style: const TextStyle(
                        color: Color(0xFF232637),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${coinList[index].rank} ${coinList[index].symbol}',
                      style: const TextStyle(
                        color: Color(0xFF666C8F),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: LineChart(
                    coinpriceList: coinList[index].filterClosePrices,
                    isIncreased: coinList[index].priceChangePercentage_24h > 0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$${coinList[index].currentPrice.toStringAsFixed(6)}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF232637),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        if (coinList[index].priceChangePercentage_24h > 0) ...[
                          Image.asset('assets/images/increase.png'),
                        ] else
                          Image.asset('assets/images/decrease.png'),
                        const SizedBox(width: 2),
                        Text(
                          '${coinList[index].priceChangePercentage_24h.toStringAsFixed(2)}%',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: coinList[index].priceChangePercentage_24h > 0
                                ? Colors.green
                                : Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToTradescreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CandleBloc(),
          child: TradeScreen(
            id: coinList[index].id,
            imageAddress: coinList[index].image,
            coinName: coinList[index].name,
            currentPrice: coinList[index].currentPrice,
            changePerDay: coinList[index].priceChangePercentage_24h,
            isIncreased: coinList[index].priceChangePercentage_24h>0,
          ),
        ),
      ),
    );
  }
}
