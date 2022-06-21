import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_smart_alarm/setAlarm.dart';
import 'alarms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Smart Alarm"),
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 18.0,
            ),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_alert),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => setAlarm()));
              }),
          bottomNavigationBar:
              BottomNavigationBar(items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm_add),
              label: 'Alarms',
            ),
          ]),

          /* 
            *** CREATE ALARM AT GIVEN TIME***
            body: Center(
                child: Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.all(25),
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
              */
          /*
              *** SHOW ALARMS SET ON PHONE ***
              Container(
                margin: const EdgeInsets.all(25),
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
              */
          /*

              *** CREATE TIMER ***
              Container(
                margin: const EdgeInsets.all(25),
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
              )
              )
              ]
              */
        ));
  }
}
