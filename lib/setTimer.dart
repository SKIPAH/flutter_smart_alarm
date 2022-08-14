// ignore_for_file: file_names

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
            margin: EdgeInsets.only(left: 120, top: 100),
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
            margin: const EdgeInsets.only(left: 120, top: 50),
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
                final snackBar = SnackBar(
                  content: Text('Timer set for $seconds'),
                  action: SnackBarAction(
                    label: '',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ),
        ],
      ),
    );
  }
}
