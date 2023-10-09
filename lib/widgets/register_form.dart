import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Get Started',
          style: TextStyle(
            color: Color(0xFF252525),
            fontSize: 36,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Text(
          'by craeting a free account',
          style: TextStyle(
            color: Color(0xFF252525),
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 50.w,
              width: 300.w,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Full name',
                  filled: true,
                  fillColor: Color(0x33C4C4C4),
                  suffixIcon: Icon(Icons.person_outline_rounded),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 50.w,
              width: 300.w,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Valid email',
                  filled: true,
                  fillColor: Color(0x33C4C4C4),
                  suffixIcon: Icon(Icons.mail_outline_rounded),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 50.w,
              width: 300.w,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Strong password',
                  filled: true,
                  fillColor: Color(0x33C4C4C4),
                  suffixIcon: Icon(Icons.lock_outline_rounded),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 50.w,
              width: 300.w,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  filled: true,
                  fillColor: Color(0x33C4C4C4),
                  suffixIcon: Icon(Icons.phone_android_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
