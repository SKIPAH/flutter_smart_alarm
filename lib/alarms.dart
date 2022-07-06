import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'home.dart';

class alarms extends StatelessWidget {
  const alarms({
    Key? key,
    required this.payload,
  }) : super(key: key);

  final String payload;
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
                child: SimpleDialog(
                  title: const Text('lolol'),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () {},
                      child: const Text('Option 1'),
                    ),
                    SimpleDialogOption(
                      onPressed: () {},
                      child: const Text('Option 2'),
                    ),
                  ],
                ),
              ),
              Text(
                payload,
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ));
  }
}
