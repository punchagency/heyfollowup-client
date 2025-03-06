import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hey_follow_up/screens/splash/splash_screen.dart';
import 'package:hey_follow_up/widget/dismiss_keyboard.dart';
import 'package:provider/provider.dart';
import 'core/injections/locator.dart';
import 'services/navigation_service.dart';
import 'util/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Assign publishable key to flutter_stripe
  Stripe.publishableKey = "pk_test_51QJwe4DFcxVAxBLHvOLnZDV9ZLuQY1ANVlzqzBztc2hYmD17wcocxRqpOsDAeZ9ZGhjcyKAVZTCsGbWJ0m4CzXex00ygH8oXAL";

  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");

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
        darkTheme: AppTheme.darkTheme(),
        themeMode: ThemeMode.system,
        home: const SplashScreen(),
      ),
    );
  }
}
