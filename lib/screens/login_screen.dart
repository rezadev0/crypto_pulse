import 'package:cypto_pulse/widgets/login_bottomsheet.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(42),
              topRight: Radius.circular(42),
            ),
          ),
          builder: (_) => const LoginBottomSheet());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.jpg'),
        ),
      ),
      child: const Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
