import 'package:cypto_pulse/bloc/home/home_bloc.dart';
import 'package:cypto_pulse/bloc/home/home_event.dart';
import 'package:cypto_pulse/getIt/get_it.dart';
import 'package:cypto_pulse/screens/main_screen.dart';
import 'package:cypto_pulse/theme.dart';
import 'package:cypto_pulse/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  getItInit();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(BlocProvider(
    create: (context) => CoinBloc(),
    child: ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    BlocProvider.of<CoinBloc>(context).add(CoinResponseEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(375, 812),
      child: Consumer<ThemeService>(builder: (context, themeService, child) {
        return MaterialApp(
          themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          title: 'Crypto Pulse',
          home: const MainScreen(),
        );
      }),
    );
  }
}
