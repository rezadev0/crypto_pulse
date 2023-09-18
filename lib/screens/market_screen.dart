import 'package:cypto_pulse/widgets/notification_bing_widget.dart';
import 'package:cypto_pulse/widgets/search_coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

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
      body: CustomScrollView(
        slivers: [
          const SearchCoin(),
          _getLivePriceTitle(),
        ],
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
