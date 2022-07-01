import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_smart_alarm/alarms.dart';
import 'package:flutter_smart_alarm/main.dart';
import 'setAlarm.dart';
import 'alarms.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  static final List<Widget> _widgetOptions = <Widget>[
    alarms(),
  ];

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    pageController.jumpToPage(index);
  }

  @override
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
        actions: <Widget>[
          //IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
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
                    Padding(padding: EdgeInsets.fromLTRB(350, 450, 50, 0)),
                    TextButton(
                      child: const Icon((Icons.alarm), size: 50.0),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        // FlutterAlarmClock.showAlarms();
                        //Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => alarms()));
                      },
                    ),
                  ]),
            ]),
      ),

      /*  bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.alarm_add), label: 'Alarms'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onTapped),
          */
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_alert),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => setAlarm()));
        },
      ),
    );

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
  }
}
