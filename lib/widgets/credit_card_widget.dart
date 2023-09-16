import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 180.w,
      decoration: BoxDecoration(
        color: const Color(0xff4054E9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.0.w, top: 20.h),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/coin.png',
                  ),
                  SizedBox(width: 8.w),
                  const Text(
                    'Reza Mohammadi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0.w, top: 24.w),
              child: Row(
                children: [
                  const Text(
                    '8279',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 35.w),
                  const Text(
                    '2353',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 35.w),
                  const Text(
                    '3452',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 35.w),
                  const Text(
                    '2364',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0.w, left: 30.w, right: 35.w),
              child: Row(
                children: [
                  const Column(
                    children: [
                      Text(
                        'EXPIRE',
                        style: TextStyle(
                          color: Color(0xFFADB5F3),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '10/18',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 25),
                  const Column(
                    children: [
                      Text(
                        'CODE',
                        style: TextStyle(
                          color: Color(0xFFADB5F3),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '***',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Image.asset('assets/images/credit_card_icon.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
