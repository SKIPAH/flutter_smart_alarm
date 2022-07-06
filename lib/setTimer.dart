import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class setTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(0),
        margin: const EdgeInsets.all(100),
        child: TextButton(
          child: const Text(
            'Create timer for 42 seconds',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
            FlutterAlarmClock.createTimer(42);
          },
        ),
      ),
    );
  }
}
