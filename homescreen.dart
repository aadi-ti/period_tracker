import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Period Tracker App'),
      ),
      body: Center(
        child: Text(
          'WELCOME BEAUTIFUL',
          style: TextStyle(fontSize: 38.0, fontFamily: 'Arial'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/nextPage');
            },
            child: Icon(Icons.arrow_forward),
          ),
          SizedBox(height: 16),
          // FloatingActionButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/lastPage');
          //   },
          //   child: Icon(Icons.calendar_today),
          // ),
        ],
      ),
    );
  }
}
