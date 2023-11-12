// // // main.dart
// // import 'package:flutter/material.dart';

// // import 'homescreen.dart';
// // import 'nextpage.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Welcome App',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: HomeScreen(),
// //       onGenerateRoute: (RouteSettings settings) {
// //         if (settings.name == '/nextPage') {
// //           return MaterialPageRoute(
// //             builder: (context) => NextPage(),
// //           );
// //         }
// //         return null;
// //       },
// //     );
// //   }
// // }

// // main.dart
// import 'package:flutter/material.dart';

// import 'homescreen.dart';
// import 'mood.dart'; // Import the MoodPage file
// import 'nextpage.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/', // Set the initial route to the HomeScreen
//       routes: {
//         '/': (context) => HomeScreen(), // Define the HomeScreen route
//         '/nextPage': (context) => NextPage(), // Define the NextPage route
//         '/mood': (context) => MoodPage(), // Define the MoodPage route
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'last.dart';
import 'nextpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Period Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/nextPage': (context) => NextPage(),
        '/lastPage': (context) => LastPage(),
      },
    );
  }
}
