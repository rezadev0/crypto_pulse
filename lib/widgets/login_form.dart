import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Wellcome',
          style: TextStyle(
            color: Color(0xFF252525),
            fontSize: 36,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Text(
          'Sign in to access your acount',
          style: TextStyle(
            color: Color(0xFF252525),
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 50.w,
              width: 300.w,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Your email',
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
                  hintText: 'Password',
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
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'I don\'t have an account',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
            const Icon(Icons.arrow_back_ios_new)
          ],
        ),
      ],
    );
  }
}
