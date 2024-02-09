import 'package:cypto_pulse/bloc/home/home_bloc.dart';
import 'package:cypto_pulse/bloc/home/home_event.dart';
import 'package:cypto_pulse/bloc/home/home_state.dart';
import 'package:cypto_pulse/widgets/coin_info_item_widget.dart';
import 'package:cypto_pulse/widgets/live_price_badge_widget.dart';
import 'package:cypto_pulse/widgets/notification_bing_widget.dart';
import 'package:cypto_pulse/widgets/rate_limiting_error_widget.dart';
import 'package:cypto_pulse/widgets/search_coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
          child: const Row(
            children: [
              Text(
                'Market',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Spacer(),
              NotificationBing()
            ],
          ),
        ),
      ),
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<CoinBloc>(context).add(CoinResponseEvent());
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SearchCoin(),
                _getLivePriceTitle(context),
                if (state is CoinResultSearchState) ...[
                  if (state.resultCoinList.isNotEmpty) ...[
                    CoinInfoItem(
                      coinList: state.resultCoinList,
                      length: state.resultCoinList.length,
                    ),
                  ] else ...[
                    SliverToBoxAdapter(
                      child: Center(
                        child: Column(
                          children: [
                            Lottie.asset(
                              'assets/lottie/not founding.json',
                              repeat: false,
                            ),
                            const Text(
                              'Your coin is\'nt find',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]
                ],
                if (state is CoinResponseState) ...[
                  state.coinList.fold(
                    (l) => const SliverToBoxAdapter(
                      child: Text(''),
                    ),
                    (r) => LivePriceBadge(
                      coinList: r,
                    ),
                  ),
                ],
                if (state is CoinResponseState) ...[
                  state.coinList.fold((l) {
                    if (l ==
                        'The request returned an invalid status code of 429.') {
                      return const SliverToBoxAdapter(
                        child: RateLimitingError(),
                      );
                    } else {
                      return const SliverToBoxAdapter();
                    }
                  },
                      (r) => CoinInfoItem(
                            coinList: r,
                            length: r.length - 50,
                          ))
                ],
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 45.w),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  SliverToBoxAdapter _getLivePriceTitle(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 16.w, right: 20.w, left: 20.w),
        child: Text(
          'Live Price',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
