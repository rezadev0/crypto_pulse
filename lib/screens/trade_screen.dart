import 'package:cypto_pulse/bloc/candle/candle_bloc.dart';
import 'package:cypto_pulse/bloc/candle/candle_event.dart';
import 'package:cypto_pulse/bloc/candle/candle_state.dart';
import 'package:cypto_pulse/data/models/candle.dart';
import 'package:cypto_pulse/widgets/cached_image_widget.dart';
import 'package:cypto_pulse/widgets/candle_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({
    super.key,
    required this.imageAddress,
    required this.id,
    required this.coinName,
    required this.currentPrice,
    required this.changePerDay,
    required this.isIncreased,
  });
  final String imageAddress;
  final String id;
  final String coinName;
  final num currentPrice;
  final double changePerDay;
  final bool isIncreased;

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  @override
  void initState() {
    BlocProvider.of<CandleBloc>(context)
        .add(CandleInitializedDataEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          widget.coinName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          SizedBox(
            height: 96.w,
            width: 96.w,
            child: CachedImage(url: widget.imageAddress),
          ),
          SizedBox(height: 10.w),
          Text(
            '\$${widget.currentPrice}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.isIncreased
                    ? 'assets/images/increase.png'
                    : 'assets/images/decrease.png',
              ),
              const SizedBox(width: 5),
              Text(
                '${widget.changePerDay}%',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: widget.isIncreased
                      ? const Color(0xFF1CBF67)
                      : const Color(0xFFD52424),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Color(0xFF3F53E8),
                ),
                child: const Text(
                  '7D',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              const Text('1M'),
              const Text('3M'),
              const Text('6M'),
              const Text('1Y'),
            ],
          ),
          const Spacer(),
          BlocBuilder<CandleBloc, CandleState>(
            builder: (context, state) {
              if (state is CandleLoadingState) {
                return const CircularProgressIndicator();
              }
              if (state is CandleResponseState) {
                late String errorMessage;
                late List<Candle> candleList;
                state.candleList.fold((l) {
                  errorMessage = l;
                  return Text(errorMessage);
                }, (r) {
                  candleList = r;
                });
                return CandleChart(candleList: candleList);
              }
              return const Text('');
            },
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.w),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? onPrimaryColor
                                : const Color(0xffFFC0CB),
                        minimumSize: Size(160.w, 56.w)),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset('assets/images/arrow-down.png'),
                          const SizedBox(width: 10),
                          const Text(
                            'Sell',
                            style: TextStyle(
                              color: Color(0xFFE04F4F),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? onPrimaryColor
                                : const Color(0xffD0F0C0),
                        minimumSize: Size(160.w, 56.w)),
                    child: Row(
                      children: [
                        Image.asset('assets/images/arrow-up.png'),
                        const SizedBox(width: 10),
                        const Text(
                          'Buy',
                          style: TextStyle(
                            color: Color(0xFF42CE93),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
