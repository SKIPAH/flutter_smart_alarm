import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class setTimer extends StatelessWidget {
  final TextEditingController secondsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(160),
            height: 40,
            width: 80,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey,
                borderRadius: BorderRadius.circular(11),
                backgroundBlendMode: BlendMode.softLight),
            child: Center(
              child: TextField(
                controller: secondsController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            margin: const EdgeInsets.only(left: 0.0, top: 0),
            child: TextButton(
              child: const Text(
                'Create a timer',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Scp',
                ),
              ),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  side: BorderSide(color: Colors.black, width: 2)),
              onPressed: () {
                int seconds;
                seconds = int.parse(secondsController.text);
                FlutterAlarmClock.createTimer(seconds);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AboutDialog(
                        children: [
                          Center(
                            child: Text('Ajastin asetettu $seconds sekunniksi!',
                                style: TextStyle(fontSize: 20)),
                          )
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
