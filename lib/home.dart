import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_smart_alarm/alarms.dart';
import 'package:flutter_smart_alarm/main.dart';
import 'package:flutter_smart_alarm/setTimer.dart';
import 'setAlarm.dart';
import 'alarms.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    listenToNotification();
    super.initState();
  }

  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Alarm"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: 'Scp',
          fontSize: 18.0,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Scp',
                ),
              ),
              Text(
                formattedTime,
                style: const TextStyle(
                  fontFamily: 'Scp',
                  fontSize: 50.0,
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(350, 350, 50, 0)),
                    OutlinedButton(
                      child: const Icon(
                        (Icons.alarm),
                        size: 50.0,
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        // FlutterAlarmClock.showAlarms();
                        //     Navigator.push(context,
                        //    MaterialPageRoute(builder: (context) => alarms()));
                      },
                    ),
                    OutlinedButton(
                      child: const Icon(
                        (Icons.notification_add),
                        size: 50.0,
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () async {
                        //await service.showNotification(
                        //     id: 0, title: 'lol', body: 'loloo');
                        await service.showNotificationWithPayload(
                            id: 1,
                            title: 'OK ',
                            body: 'Hälytys',
                            payload: 'Herätys');
                      },
                    ),
                    OutlinedButton(
                      child: const Icon(
                        (Icons.timer),
                        size: 50.0,
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => setTimer()));

                        // FlutterAlarmClock.showAlarms();
                        //Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => alarms()));
                      },
                    ),
                  ]),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_alert),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => setAlarm()));
        },
      ),
    );

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
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => alarms(
                    payload: payload,
                  )));
    }
  }
}
