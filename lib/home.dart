import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
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
  String hour, minute;
  HomeScreen({Key? key, required this.hour, required this.minute})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final LocalNotificationService service;
  bool isOn = false;
  int alarmId = 1;

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
        padding: EdgeInsets.only(left: 10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${widget.hour}', style: TextStyle(fontSize: 20)),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    '${widget.minute}',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 500)),
                    OutlinedButton(
                      //  child: const Text("alarms"),
                      child: const Icon(
                        (Icons.alarm),
                        size: 60.0,
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        FlutterAlarmClock.showAlarms();
                      },
                    ),
                    OutlinedButton(
                      // child: const Text('häly testi'),
                      child: const Icon(
                        (Icons.notification_add),
                        size: 60.0,
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
                            title: 'HERÄTYS ',
                            body: '',
                            payload: 'Herätys');
                      },
                    ),
                    OutlinedButton(
                      // child: const Text('timeri'),
                      child: const Icon(
                        (Icons.timer),
                        size: 60.0,
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
                      },
                    ),
                    OutlinedButton(
                      //  child: const Text('alarmmanagertest'),
                      child: const Icon(
                        (Icons.looks_5),
                        size: 60.0,
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () async {
                        AndroidAlarmManager.oneShot(
                          alarmClock: true,
                          allowWhileIdle: true,
                          wakeup: true,
                          exact: true,
                          Duration(seconds: 5),
                          alarmId,
                          fireAlarm,
                        );
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

  static void fireAlarm() {
    print('Alarm Fired at');
  }
}
