import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:rxdart/subjects.dart';
import 'setAlarm.dart';

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();
  final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationsettings =
        AndroidInitializationSettings('@drawable/ic_stat_access_alarm');

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );
    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationsettings,
      iOS: iosInitializationSettings,
    );

    await _localNotificationService.initialize(
      settings,
      onSelectNotification: onSelectedNotification,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id 1', 'channel_name',
            channelDescription: 'desricption',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true,
            autoCancel: false,
            enableVibration: true,
            sound: RawResourceAndroidNotificationSound(
              'pullup',
            ));

    const IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails(presentSound: false);

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details);
  }

  Future<void> showScheduledNotification({
    required int id,
    required String title,
    required String body,
    required int hours,
    required int minutes,
    required String payload,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        DateTime.now().add(Duration(hours: hours, minutes: minutes)),
        tz.local,
      ),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> showNotificationWithPayload({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details,
        payload: payload);
  }

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id');
  }

  void onSelectedNotification(String? payload) {
    print('payload $payload');
    if (payload != null && payload.isNotEmpty) {
      onNotificationClick.add(payload);
    }
  }
}



















/*
final _notifications = FlutterLocalNotificationsPlugin();
void sendNotification({String? title, String? body}) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  const AndroidNotificationChannel channel =
      AndroidNotificationChannel('lol', 'lolol');

  flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name)));

  void scheduleAlarm() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 10));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'alarm_notif', 'alarm_notif',
        icon: '@mipmap/ic_launcher');

    var platformChannelSpecifics = NotificationDetails();
    await flutterLocalNotificationsPlugin.schedule(0, 'office', 'good morning',
        scheduledNotificationDateTime, platformChannelSpecifics);
  }
}
*/