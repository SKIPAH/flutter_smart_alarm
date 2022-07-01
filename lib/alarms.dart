import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'home.dart';

class alarms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    theme:
    ThemeData.dark();
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(100),
                child: TextButton(
                  child: const Icon(Icons.alarm),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
