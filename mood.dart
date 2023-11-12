// import 'package:flutter/material.dart';

// class MoodPage extends StatefulWidget {
//   @override
//   _MoodPageState createState() => _MoodPageState();
// }

// class _MoodPageState extends State<MoodPage> {
//   String selectedMood = '';
//   String selectedSymptom = '';
//   List<String> moods = ['Happy', 'Sad', 'Excited', 'Anxious', 'Angry'];
//   List<String> symptoms = [
//     'Headache',
//     'Fatigue',
//     'Nausea',
//     'Dizziness',
//     'Insomnia'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mood Tracker'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           child: Column(
//             children: [
//               DropdownButtonFormField(
//                 value: selectedMood,
//                 hint: Text('Select Mood'),
//                 items: moods.map((mood) {
//                   return DropdownMenuItem(
//                     value: mood,
//                     child: Text(mood),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedMood = value.toString();
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               DropdownButtonFormField(
//                 value: selectedSymptom,
//                 hint: Text('Select Symptom'),
//                 items: symptoms.map((symptom) {
//                   return DropdownMenuItem(
//                     value: symptom,
//                     child: Text(symptom),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedSymptom = value.toString();
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle form submission here
//                   print('Selected Mood: $selectedMood');
//                   print('Selected Symptom: $selectedSymptom');
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //void main() => runApp(MaterialApp(home: MoodPage()));
