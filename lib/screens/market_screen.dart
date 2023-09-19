import 'package:cypto_pulse/bloc/home/home_bloc.dart';
import 'package:cypto_pulse/bloc/home/home_event.dart';
import 'package:cypto_pulse/bloc/home/home_state.dart';
import 'package:cypto_pulse/widgets/coin_info_item_widget.dart';
import 'package:cypto_pulse/widgets/live_price_badge_widget.dart';
import 'package:cypto_pulse/widgets/notification_bing_widget.dart';
import 'package:cypto_pulse/widgets/search_coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeResponseEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<HomeBloc>(context).add(HomeResponseEvent());
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SearchCoin(),
                _getLivePriceTitle(),
                if (state is HomeResultSearchState) ...[
                  CoinInfoItem(
                    coinList: state.resultCoinList,
                    length: state.resultCoinList.length,
                  )
                ],
                if (state is HomeResponseState) ...[
                  state.coinList.fold(
                    (l) => SliverToBoxAdapter(
                      child: Text(l),
                    ),
                    (r) => LivePriceBadge(
                      coinList: r,
                    ),
                  ),
                ],
                if (state is HomeResponseState) ...[
                  state.coinList.fold(
                      (l) => SliverToBoxAdapter(
                            child: Text(l),
                          ),
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

  SliverToBoxAdapter _getLivePriceTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 16.w, right: 20.w, left: 20.w),
        child: const Text(
          'Live Price',
          style: TextStyle(
            color: Color(0xFF232637),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
