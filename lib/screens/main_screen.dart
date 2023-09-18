import 'dart:ui';
import 'package:cypto_pulse/bloc/home/home_bloc.dart';
import 'package:cypto_pulse/screens/home_screen.dart';
import 'package:cypto_pulse/screens/market_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedBottomNav = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: IndexedStack(
          index: selectedBottomNav,
          children: getScreen(),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedBottomNav,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Market',
                  icon: Icon(Icons.account_balance_wallet),
                ),
              ],
              onTap: (value) {
                setState(() {
                  selectedBottomNav = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScreen() {
    return [
      BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
      BlocProvider(
        create: (context) => HomeBloc(),
        child: const MarketScreen(),
      ),
    ];
  }
}
