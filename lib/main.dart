import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_follow_up/screens/splash/splash_screen.dart';
import 'package:hey_follow_up/widget/dismiss_keyboard.dart';
import 'package:provider/provider.dart';
import 'core/injections/locator.dart';
import 'services/navigation_service.dart';
import 'util/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  );
  await configureDependencies();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        supportedLocales: const [
          Locale('en'),
          Locale('fr'),
        ],
        localizationsDelegates: const [],
        debugShowCheckedModeBanner: false,
        title: 'Hey FollowUp',
        navigatorKey: NavigationServices.navigatorKey,
        theme: AppTheme.appTheme(),
        home: const SplashScreen(),
      ),
    );
    // return MultiProvider(
    //     providers: const [
    //
    //     ],
    //     child: DismissKeyboard(
    //       child: MaterialApp(
    //         supportedLocales: const [
    //           Locale('en'),
    //           Locale('fr'),
    //         ],
    //         localizationsDelegates: const [
    //
    //         ],
    //         debugShowCheckedModeBanner: false,
    //         title: 'Hey FollowUp',
    //         navigatorKey: NavigationServices.navigatorKey,
    //         theme: AppTheme.light(),
    //         home: const SplashScreen(),
    //       ),
    //     ));
  }
}
