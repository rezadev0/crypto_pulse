import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationBing extends StatelessWidget {
  const NotificationBing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset('assets/images/notification-bing.png'),
            Container(
              height: 9.h,
              width: 9.h,
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
