import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

// ignore: camel_case_types
class puzzle extends StatelessWidget {
  const puzzle({
    Key? key,
    required this.payload,
  }) : super(key: key);

  final String payload;

  @override
  Widget build(BuildContext context) {
    ThemeData.dark();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(0),
                child: SimpleDialog(
                  contentPadding: const EdgeInsets.only(left: 100),
                  title: const Text(
                    '2+2?',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => puzzle(
                                      payload: payload,
                                    )));
                      },
                      child: const Text(
                        '5',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        int alarmId = 1;
                        AndroidAlarmManager.oneShot(
                          alarmClock: true,
                          allowWhileIdle: true,
                          wakeup: true,
                          exact: true,
                          const Duration(seconds: 0),
                          alarmId,
                          stopAlarm,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      minute: '',
                                      hour: '',
                                    )));
                      },
                      child: const Text(
                        '4',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        stopAlarm();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => puzzle(
                                      payload: payload,
                                    )));
                      },
                      child: const Text(
                        '6',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => puzzle(
                                      payload: payload,
                                    )));
                      },
                      child: const Text(
                        '5',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                payload,
                style: const TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ));
  }

  static void stopAlarm() {
    // ignore: avoid_print
    print('Alarm stopped');
    FlutterRingtonePlayer.stop();
  }
}
