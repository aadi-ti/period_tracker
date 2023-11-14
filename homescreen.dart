// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/moodtrack.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Period Tracker App'),
//       ),
//       body: Center(
//         child: Text(
//           'WELCOME BEAUTIFUL',
//           style: TextStyle(fontSize: 38.0, fontFamily: 'Arial'),
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/nextPage');
//             },
//             child: Icon(Icons.arrow_forward),
//           ),
//           SizedBox(height: 16),
//           FloatingActionButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MoodSwingList()),
//               );
//             },
//             child: Icon(Icons.mood),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/moodtrack.dart';
import 'package:flutter_application_1/nextpage.dart';
import 'package:flutter_application_1/symptoms.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Period Tracker App'),
          backgroundColor: Colors.blue[900], // Dark Pink
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Color.fromARGB(255, 251, 210, 224),
                // Color.fromARGB(255, 249, 164, 192)
                Color.fromARGB(255, 210, 233, 251),
                Color.fromARGB(255, 55, 116, 142)
              ],
            ),
          ),
          child: Column(
            children: [
              // Add SizedBox to push the text below the app bar
              SizedBox(height: AppBar().preferredSize.height),
              Center(
                child: Text(
                  'WELCOME BEAUTIFUL',
                  style: TextStyle(
                    fontSize: 38.0,
                    fontFamily: 'Brush Script',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900], // Dark Pink
                  ),
                ),
              ),
              SizedBox(height: 20), // Adjust the spacing

              // List of options
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    buildOption(context, 'My Calendar', Icons.calendar_today,
                        '/nextpage'),
                    buildOption(context, 'Help Me with My Moods', Icons.mood,
                        '/moodtrack'),
                    buildOption(
                        context, 'My Symptoms', Icons.healing, '/mySymptoms'),
                    buildOption(
                        context,
                        'How Much Do You Know About Periods and Menstrual Cycle?',
                        Icons.info,
                        '/knowledge'),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Helper function to create options as buttons
  Widget buildOption(
      BuildContext context, String title, IconData icon, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the corresponding route/page
          if (route == '/nextpage') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NextPage()),
            );
          } else if (route == '/moodtrack') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MoodSwingList()),
            );
          } else if (route == '/mySymptoms') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Symptoms()),
            );
          }
          //else if (route == '/knowledge') {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => KnowledgePage()),
          //   );
          // }
          // Add more conditions as needed for other routes/pages
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue[900], // Dark Pink
          padding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Opacity(
              opacity: 0.0,
              child: Icon(icon),
            ),
          ],
        ),
      ),
    );
  }
}
