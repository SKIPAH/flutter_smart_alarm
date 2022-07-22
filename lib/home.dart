import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_alarm/alarms.dart';
import 'package:flutter_smart_alarm/setTimer.dart';
import 'alarms.dart';
import 'package:intl/intl.dart';
import 'notification.dart';
import 'setAlarm.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String hour, minute;
  HomeScreen({Key? key, required this.hour, required this.minute})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final LocalNotificationService service;
  int alarmId = 1;

  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    listenToNotification();
    super.initState();
  }

  Widget build(BuildContext context) {
    var now = DateTime.now();
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
          padding: const EdgeInsets.only(left: 10),
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
                const ClockWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.hour, style: const TextStyle(fontSize: 20)),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      widget.minute,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    OutlinedButton(
                      child: const Text("stopalarmM"),
                      onPressed: () {
                        AndroidAlarmManager.oneShot(
                          alarmClock: true,
                          allowWhileIdle: true,
                          wakeup: true,
                          exact: true,
                          const Duration(seconds: 0),
                          alarmId,
                          stopAlarm,
                        );
                      },
                    ),
                    OutlinedButton(
                      child: const Text("cancel all alarms"),
                      onPressed: () {
                        service.cancelAllNotification();
                      },
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.only(top: 500)),
                      OutlinedButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => setAlarm()));
                        },
                        child: const Icon(
                          (Icons.android),
                          size: 60.0,
                        ),
                      ),
                      OutlinedButton(
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
                        child: const Icon(
                          (Icons.timer),
                          size: 60.0,
                        ),
                      ),
                      OutlinedButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                        ),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  actions: [
                                    TextField(
                                      controller: hourController,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 25.0),
                                    ),
                                    TextField(
                                      controller: minuteController,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 25.0),
                                    ),
                                    TextButton(
                                        onPressed: () async {
                                          int hour;
                                          int minute;
                                          hour = int.parse(hourController.text);
                                          minute =
                                              int.parse(minuteController.text);
                                          AndroidAlarmManager.oneShotAt(
                                            DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day,
                                              hour,
                                              minute,
                                            ),
                                            alarmClock: true,
                                            allowWhileIdle: true,
                                            wakeup: true,
                                            exact: true,
                                            alarmId,
                                            fireAlarm,
                                          );
                                        },
                                        child: const Text("Set alarm"))
                                  ],
                                );
                              });
                        },
                        child: const Icon(
                          (Icons.looks_5),
                          size: 60.0,
                        ),
                      ),
                    ]),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_alert),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actions: [
                      TextField(
                        controller: hourController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 25.0),
                      ),
                      TextField(
                        controller: minuteController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 25.0),
                      ),
                      TextButton(
                          onPressed: () async {
                            int hour;
                            int minute;
                            hour = int.parse(hourController.text);
                            minute = int.parse(minuteController.text);
                            await service.showScheduledNotification(
                              id: 2,
                              title: 'Alarm',
                              body: 'Time to wake up!',
                              payload: 'Solve the puzzle to cancel the alarm',
                              when: DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                hour,
                                minute,
                              ),
                            );
                            final snackBar = SnackBar(
                              content: Text('Alarm set for $hour $minute'),
                              action: SnackBarAction(
                                label: '',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: const Text("Set alarm"))
                    ],
                  );
                },
              );
            }));
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
    print('Alarm Fired at ${DateTime.now()}');
    FlutterRingtonePlayer.play(
      fromAsset: "sounds/pullup.mp3",
      looping: true,
      volume: 1,
      asAlarm: false,
    );
  }

  static void stopAlarm() {
    // ignore: avoid_print
    print('Alarm stopped');
    FlutterRingtonePlayer.stop();
  }
}

class ClockWidget extends StatefulWidget {
  const ClockWidget({
    Key? key,
    //  required this.formattedTime,
  }) : super(key: key);

  // final String formattedTime;

  @override
  State<StatefulWidget> createState() {
    return ClockWidgetState();
  }
}

class ClockWidgetState extends State<ClockWidget> {
  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var previousMinute =
          DateTime.now().add(const Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;
      if (previousMinute != currentMinute) {
        setState(() {
          formattedTime = DateFormat('HH:mm').format(DateTime.now());
        });
      }
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formattedTime,
      style: const TextStyle(
        fontFamily: 'Scp',
        fontSize: 50.0,
      ),
    );
  }
}
