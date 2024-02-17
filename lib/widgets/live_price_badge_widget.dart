import 'package:cypto_pulse/data/models/coin.dart';
import 'package:cypto_pulse/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

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
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(20),
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: coinList[index].priceChangePercentage_24h > 0
                        ? [
                            const Color(0xff38E54D),
                            const Color(0xffC1F2B0),
                            const Color(0xffFBF6EE),
                            const Color(0xffFBF6EE),
                            const Color(0xffFBF6EE),
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white
                          ]
                        : [
                            const Color(0xffFF2442),
                            const Color(0xffFBF6EE),
                            const Color(0xffFBF6EE),
                            const Color(0xffFBF6EE),
                            const Color(0xffFBF6EE),
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white
                          ],
                  ),
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
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            coinList[index].name,
                            style: const TextStyle(
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
                  SizedBox(height: 5.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$${coinList[index].currentPrice}',
                        style: const TextStyle(
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
