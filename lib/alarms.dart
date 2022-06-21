import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class alarms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
            body: Center(
                child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(100),
              child: TextButton(
                child: const Text(
                  'Show alarms',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  FlutterAlarmClock.showAlarms();
                },
              ),
            ),
          ],
        ))));
  }
}
