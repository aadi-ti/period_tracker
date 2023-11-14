import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoodSwingList(),
    );
  }
}

class MoodSwingList extends StatefulWidget {
  @override
  _MoodSwingListState createState() => _MoodSwingListState();
}

class _MoodSwingListState extends State<MoodSwingList> {
  List<MoodSwingItem> moodSwings = [
    MoodSwingItem("Irritability", "To reduce irritability, you may do what you like such as listening to music that will help you divert your mind. You may try doing meditation to keep yourself relaxed."),
    MoodSwingItem("Sadness", "It's common to be sad during periods. Eat something you like, watch your favourite TV show or a movie."),
    MoodSwingItem("Food Cravings", "Cut back on refined carbs, fat, salt and sugar. Eating even a small amount just makes you want to eat more and often leads to bingeing. Eat more leafy green vegetables and dairy to boost your calcium intake and rebalance your serotonin levels."),
    MoodSwingItem("Trouble focusing", "Be physically active and maintain a healthy diet. Engage in cognitive retraining."),
    MoodSwingItem("Crying", "Take some fresh air. Move out in the daylight. Reach out to your friends; play something."),
    MoodSwingItem("Fatigue", "Have some fruit juice or energy drink and try to get enough sleep."),
    MoodSwingItem("Anger", "Strictly meditate or listen to music. It is important to know that anger issues are very common during periods so try to relax."),
    MoodSwingItem("Nervousness", "Try to get enough sleep and use relaxation techniques, such as yoga and meditation."),
   
    // Add more mood swings as needed
  ];

  TextEditingController moodController = TextEditingController();
  String additionalInformation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mood Swings',
          style: TextStyle(
            fontFamily: 'Cursive',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[900], // Dark Pink
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,   
            end: Alignment.bottomCenter,
            colors: [Colors.pink[100]!, Colors.pink[200]!], // Light Pink Gradient
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Existing mood swings
              Expanded(
                child: ListView.builder(
                  itemCount: moodSwings.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: ExpansionTile(
                        title: Text(
                          moodSwings[index].name,
                          style: TextStyle(fontSize: 20, fontFamily: 'Arial'),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              moodSwings[index].description,
                              style: TextStyle(fontSize: 20, fontFamily: 'Arial'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              // User-entered mood swing and "GO" button
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: moodController,
                      decoration: InputDecoration(
                        hintText: 'Enter Mood Swing',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Set additional information for user-entered mood swing
                      setState(() {
                        additionalInformation = 'Additional Information for ${moodController.text}';
                        moodController.clear();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[900],
                      onPrimary: Colors.white,
                    ),
                    child: Text('GO'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Display additional information for user-entered mood swing
              additionalInformation.isNotEmpty
                  ? Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          additionalInformation,
                          style: TextStyle(fontSize: 20, fontFamily: 'Arial'),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(height: 16),
              // Button to navigate to the calendar page
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the calendar page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[900],
                    onPrimary: Colors.white,
                  ),
                  child: Text('Go to Calendar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoodSwingItem {
  String name;
  String description;

  MoodSwingItem(this.name, this.description);
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with the actual content of your calendar page
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Page'),
      ),
      body: Center(
        child: Text('This is the Calendar Page'),
      ),
    );
  }
}
