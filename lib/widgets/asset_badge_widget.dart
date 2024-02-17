import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetBadgeWidget extends StatelessWidget {
  const AssetBadgeWidget({
    super.key,
    required this.symbol,
    required this.hexColor,
  });
  final String symbol;
  final int hexColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.w,
      height: 38.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(hexColor).withOpacity(0.5),
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
          )
        ],
        border: Border.all(
          color: Color(hexColor).withOpacity(0.65),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: ShapeDecoration(
                    color: Color(hexColor).withOpacity(0.2),
                    shape: const CircleBorder(),
                  ),
                ),
                Container(
                  width: 6.w,
                  height: 6.w,
                  decoration: ShapeDecoration(
                    color: Color(hexColor),
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10.w),
            Text(
              symbol,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
    );
  }
}
