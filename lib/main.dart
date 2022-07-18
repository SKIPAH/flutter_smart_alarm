import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_smart_alarm/setAlarm.dart';
import 'alarms.dart';
import 'home.dart';
import 'package:audioplayers/audioplayers.dart';
import 'notification.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        minute: '',
        hour: '',
      ),
    );
  }
}
