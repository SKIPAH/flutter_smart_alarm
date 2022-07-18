import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'home.dart';
import 'package:audioplayers/audioplayers.dart';

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(0),
                child: SimpleDialog(
                  contentPadding: EdgeInsets.only(left: 100),
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
                                builder: (context) => alarms(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => alarms(
                                      payload: payload,
                                    )));
                      },
                      child: const Text(
                        '6',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      padding: EdgeInsets.all(0),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => alarms(
                                      payload: payload,
                                    )));
                      },
                      child: const Text(
                        '5',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      padding: EdgeInsets.all(50),
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
