import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Period Tracker App'),
          backgroundColor: Colors.pink[700], // Dark Pink
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 251, 210, 224), Color.fromARGB(255, 249, 164, 192)],
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
                    color: Colors.pink[700], // Dark Pink
                  ),
                ),
              ),
              SizedBox(height: 20), // Adjust the spacing

              // List of options
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    buildOption(context, 'My Calendar', Icons.calendar_today, '/myCalendar'),
                    buildOption(context, 'Help Me with My Moods', Icons.mood, '/moodHelp'),
                    buildOption(context, 'My Symptoms', Icons.healing, '/mySymptoms'),
                    buildOption(context, 'How Much Do You Know About Periods and Menstrual Cycle?', Icons.info, '/knowledge'),
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
  Widget buildOption(BuildContext context, String title, IconData icon, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.pink[700], // Dark Pink
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
