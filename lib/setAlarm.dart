// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'home.dart';

class setAlarm extends StatelessWidget {
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();

  int alarmId = 1;

  @override
  Widget build(BuildContext context) {
    ThemeData.dark();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(children: <Widget>[
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(0),
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(11),
                    backgroundBlendMode: BlendMode.softLight),
                child: Center(
                  child: TextField(
                    controller: hourController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(11),
                    backgroundBlendMode: BlendMode.softLight),
                child: Center(
                  child: TextField(
                      controller: minuteController,
                      keyboardType: TextInputType.number,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 25.0)),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(50),
                child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                      side: const BorderSide(color: Colors.black, width: 2)),
                  onPressed: () async {
                    int hour;
                    int minutes;
                    hour = int.parse(hourController.text);
                    minutes = int.parse(minuteController.text);
                    FlutterAlarmClock.createAlarm(hour, minutes);

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AboutDialog(
                            children: [
                              Center(
                                child: Text('Alarm set for $hour $minutes',
                                    style: const TextStyle(fontSize: 20)),
                              )
                            ],
                          );
                        });
                  },
                  child: const Text(
                    "Create alarm",
                    style: TextStyle(fontSize: 20.0, fontFamily: 'Scp'),
                  ),
                ),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                      side: const BorderSide(color: Colors.black, width: 2)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => HomeScreen(
                            hour: hourController.text,
                            minute: minuteController.text))));
                  },
                  child: const Text(
                    "Frontpage",
                    style: TextStyle(fontSize: 20.0, fontFamily: 'Scp'),
                  ))
            ],
          )
        ])));
  }
}
