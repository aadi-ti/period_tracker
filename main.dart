import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen.dart';
import 'package:flutter_application_1/symptoms.dart';

import 'last.dart';
import 'nextpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomeScreen(),
      title: 'Period Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/nextPage': (context) => NextPage(),
        '/lastPage': (context) => LastPage(),
        '/symptoms': (context) => Symptoms(),
      },
    );
  }
}
