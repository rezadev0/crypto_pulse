import 'dart:ui';
import 'package:cypto_pulse/screens/home_screen.dart';
import 'package:cypto_pulse/screens/market_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedBottomNav = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: IndexedStack(
          index: selectedBottomNav,
          children: getScreen(),
        ),
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
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Image.asset('assets/images/home.png'),
                activeIcon: Image.asset('assets/images/home_active.png'),
              ),
              BottomNavigationBarItem(
                label: 'Market',
                icon: Image.asset('assets/images/market.png'),
                activeIcon: Image.asset('assets/images/market_active.png'),
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
    );
  }

  List<Widget> getScreen() {
    return [
      const HomeScreen(),
      const MarketScreen(),
    ];
  }
}
