import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'alarms.dart';

class setAlarm extends StatelessWidget {
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
            body: Center(
                child: Column(children: <Widget>[
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(11)),
                child: Center(
                  child: TextField(
                    controller: hourController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(11)),
                child: Center(
                  child: TextField(
                      controller: minuteController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black, fontSize: 25.0)),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(100),
            child: TextButton(
              child: const Text(
                "Create alarm",
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                int hour;
                int minutes;
                hour = int.parse(hourController.text);
                minutes = int.parse(minuteController.text);
                FlutterAlarmClock.createAlarm(hour, minutes);
              },
            ),
          )
        ]))));
  }
}



/*body: Center(
                child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.all(100),
            child: TextButton(
              child: const Text(
                'Create alarm at 23:59',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                FlutterAlarmClock.createAlarm(21, 10);
              },
            ),
          ),
        ]))*/