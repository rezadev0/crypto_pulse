import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class RateLimitingError extends StatelessWidget {
  const RateLimitingError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200.w,
        width: 300.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orangeAccent,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 5.w),
              Image.asset('assets/images/lock.png'),
              SizedBox(height: 15.w),
              const Text(
                'The number of requests exceeds the limit.',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.w),
              const Text(
                'Please try again in a few minutes.',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
