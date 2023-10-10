import 'package:cypto_pulse/bloc/home/home_bloc.dart';
import 'package:cypto_pulse/screens/home_screen.dart';
import 'package:cypto_pulse/screens/main_screen.dart';
import 'package:cypto_pulse/widgets/login_form.dart';
import 'package:cypto_pulse/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  late PageController _pageController;
  // double _progress;
  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        _pageController.hasClients ? (_pageController.page ?? 0) : 0;

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 400 + progress * 140,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: const [
                      LoginForm(),
                      RegisterForm(),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 50.w,
                    width: 300.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => CoinBloc(),
                                child: const MainScreen(),
                              ),
                            ));
                      },
                      style: ElevatedButton.styleFrom(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Next'),
                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
