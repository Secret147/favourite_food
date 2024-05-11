import 'package:dishsapp/page/my_app.dart';
import 'package:dishsapp/local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'firebase_options.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  var initialNotification =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (initialNotification?.didNotificationLaunchApp == true) {
    Future.delayed(const Duration(seconds: 1), () {
      navigatorKey.currentState!.pushNamed('/another',
          arguments: initialNotification?.notificationResponse?.payload);
    });
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
