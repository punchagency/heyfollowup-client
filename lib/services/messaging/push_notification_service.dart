import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../firebase_options.dart';

class PushNotificationService {
  Future<void> setupInteractedMessage() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    requestForPermission();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('app opened through ntf');
      try {
        // rootNavigatorKey.currentState?.push(
        //   MaterialPageRouteWithBarrier(
        //     builder: (context) => const NotificationScreen(),
        //   ),
        // );
      } catch (e) {
        print(e);
      }
      // Get.to(() => const NotificationPage(), arguments: message.data);
    });
    await enableIOSNotifications();
    await registerNotificationListeners();
  }

  registerNotificationListeners() async {
    AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var androidSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSSettings = const DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    var initSettings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: (message) async {
      try {
        // rootNavigatorKey.currentState?.push(
        //   MaterialPageRouteWithBarrier(
        //     builder: (context) => const NotificationScreen(),
        //   ),
        // );
      } catch (e) {
        print(e);
      }
      //     Get.to(() => const NotificationPage(), arguments: message);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('foreground ntf ${message.notification?.body}');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                icon: android.smallIcon,
                playSound: true,
                enableVibration: true,
                priority: Priority.high,
                importance: Importance.high),
          ),
        );
      }
    });
  }

  enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  androidNotificationChannel() => const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
      enableVibration: true,
      playSound: true);

  requestForPermission() {
    if (Platform.isIOS) {
      FirebaseMessaging.instance.requestPermission();
    }
  }
}
