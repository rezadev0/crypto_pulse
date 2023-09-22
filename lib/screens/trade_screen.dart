import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          title: const Text(
            'Ethereum',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
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
              child: Image.asset('assets/images/coin.png'),
            ),
            const Text(
              '\$2,827.00',
              style: TextStyle(
                color: Color(0xFF232637),
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/increase.png'),
                const SizedBox(width: 5),
                const Text(
                  '8.74% (2,8%)',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF1CBF67),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.w),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('7D'),
                Text('1M'),
                Text('3M'),
                Text('6M'),
                Text('1Y'),
              ],
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
                          backgroundColor: const Color(0xffFFC0CB),
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffD0F0C0),
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
      ),
    );
  }
}
