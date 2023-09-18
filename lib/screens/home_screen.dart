import 'package:cypto_pulse/bloc/home/home_bloc.dart';
import 'package:cypto_pulse/bloc/home/home_event.dart';
import 'package:cypto_pulse/bloc/home/home_state.dart';
import 'package:cypto_pulse/widgets/asset_badge_widget.dart';
import 'package:cypto_pulse/widgets/coin_info_item_widget.dart';
import 'package:cypto_pulse/widgets/credit_card_widget.dart';
import 'package:cypto_pulse/widgets/notification_bing_widget.dart';
import 'package:cypto_pulse/widgets/shimmer_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          child: Row(
            children: [
              Image.asset(
                'assets/images/security-card.png',
              ),
              const SizedBox(width: 5),
              const Text(
                'Crypto Pulse',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Spacer(),
              const NotificationBing()
            ],
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 19.w),
                  child: _getAllAssetWidgets(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 23.0.h,
                    left: 21.0.w,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                      ),
                      Text(
                        '\$21,271.00',
                        style: TextStyle(
                          color: Color(0xFF232637),
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '+173% all time',
                        style: TextStyle(
                          color: Color(0xFF03B78C),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                  child: const CreditCard(),
                ),
              ),
              SliverAppBar(
                backgroundColor: Colors.white,
                pinned: true,
                elevation: 0,
                toolbarHeight: 35.h,
                flexibleSpace: Padding(
                  padding: EdgeInsets.only(left: 21.w, right: 20.w),
                  child: Row(
                    children: [
                      const Text(
                        'Crypto Assets',
                        style: TextStyle(
                          color: Color(0xFF232637),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Spacer(),
                      Image.asset('assets/images/add_icon.png'),
                    ],
                  ),
                ),
              ),
              if (state is HomeLoadingState) ...[
                SliverList.builder(
                  itemBuilder: (context, index) => const ShimmerCard(),
                ),
              ],
              if (state is HomeResponseState) ...[
                state.coinList.fold(
                  (l) => SliverToBoxAdapter(
                    child: Text(l),
                  ),
                  (r) => CoinInfoItem(
                    coinList: r,
                    length: r.length - 95,
                  ),
                )
              ],
              SliverPadding(
                padding: EdgeInsets.only(bottom: 45.w),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding _getAllAssetWidgets() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Row(
        children: [
          const AssetBadgeWidget(symbol: 'BTC: 32%', hexColor: 0xffFF8E25),
          SizedBox(width: 11.w),
          const AssetBadgeWidget(symbol: 'ETH: 26%', hexColor: 0xff707D91),
          SizedBox(width: 11.w),
          const AssetBadgeWidget(symbol: 'LTC: 19%', hexColor: 0xff5261EC),
        ],
      ),
    );
  }
}
