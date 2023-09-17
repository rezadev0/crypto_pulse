import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12.withOpacity(0.03),
      highlightColor: Colors.white,
      child: Padding(
        padding:
            EdgeInsets.only(left: 21.0.w, top: 10.w, right: 20.w, bottom: 10.w),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFD1D7E3).withOpacity(0.65),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 48,
                height: 48,
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 11.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 20,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Container(
                  height: 40,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 24,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
