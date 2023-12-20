import 'package:cypto_pulse/data/models/coin.dart';
import 'package:cypto_pulse/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LivePriceBadge extends StatelessWidget {
  const LivePriceBadge({super.key, required this.coinList});
  final List<Coin> coinList;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 210.w,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(
                top: 12.w, right: 16.w, left: 20.w, bottom: 35.w),
            child: Container(
              width: 130.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFD1D7E3).withOpacity(0.65),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 17.w),
                  Row(
                    children: [
                      SizedBox(width: 16.w),
                      Image.network(
                        coinList[index].image,
                        width: 30.w,
                        height: 30.w,
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coinList[index].symbol.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            coinList[index].name,
                            style: const TextStyle(
                              color: Color(0xFF666C8F),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 45.w,
                        width: 92.w,
                        child: LineChart(
                          coinpriceList: coinList[index].filterClosePrices,
                          isIncreased:
                              coinList[index].priceChangePercentage_24h > 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          if (coinList[index].priceChangePercentage_24h >
                              0) ...[
                            Image.asset('assets/images/increase.png'),
                          ] else
                            Image.asset('assets/images/decrease.png'),
                          const SizedBox(width: 2),
                          Text(
                            '${coinList[index].priceChangePercentage_24h.toStringAsFixed(2)}%',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color:
                                  coinList[index].priceChangePercentage_24h > 0
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
                  SizedBox(height: 8.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$${coinList[index].currentPrice}',
                        style: const TextStyle(
                          color: Color(0xFF232637),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
