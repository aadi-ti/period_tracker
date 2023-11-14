import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> symptoms = [
    'Cramps',
    'Headache',
    'Fatigue',
    'Mood Swings',
    'Bloating',
  ];

  final Map<String, List<String>> remedies = {
    'Cramps': ['Avoid caffeine drinks and exercise. Avoid using medicine as long as the pain is bearable.'],
    'Headache': ['add for headache'],
    'Bloating': ['Keep your body hydrated and avoid salty foods. Gentle exercise would also help.'],
    'Vomiting': ['add for vomiting'],
    'Mild fever':['add for fever'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text(
            'COMMON SYMPTOMS',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Cursive',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.pink[700],
          elevation: 10.0,
          centerTitle: true,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color.fromARGB(255, 251, 204, 221), const Color.fromARGB(255, 249, 172, 198)],
          ),
        ),
        child: ListView.builder(
          itemCount: symptoms.length,
          itemBuilder: (context, index) {
            String symptom = symptoms[index];
            return Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ExpansionTile(
                title: Text(
                  symptom,
                  style: TextStyle(fontSize: 20, fontFamily: 'Arial'),
                ),
                children: _buildRemediesList(symptom),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildRemediesList(String symptom) {
    List<String> remedyList = remedies[symptom] ?? [];
    return remedyList
        .map(
          (remedy) => ListTile(
            title: Text(
              remedy,
              style: TextStyle(fontSize: 20, fontFamily: 'Arial'),
            ),
          ),
        )
        .toList();
  }
}
