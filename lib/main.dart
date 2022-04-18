import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var counter = 0;

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: colorList[counter],
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${counter / 1000}'.padLeft(2, '0'),
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (timer == null) {
                  timer ??= Timer.periodic(
                    Duration(seconds: 1),
                    (timer) {
                      counter++;
                      print(counter);
                      setState(() {});
                    },
                  );
                }
              },
              child: Text('start'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  timer?.cancel();
                });
              },
              child: Text('stop'),
            ),
          ],
        ),
      ],
    )));
  }
}

final colorList = [
  Colors.purple,
  Colors.blue,
  Colors.grey,
  Colors.amber,
  Color.fromARGB(255, 65, 94, 107),
  Color.fromARGB(255, 124, 112, 112),
  Colors.yellow,
  Colors.amberAccent,
];
