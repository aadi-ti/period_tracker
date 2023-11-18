import 'package:flutter/material.dart';

class LastPage extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;

  LastPage({
    required this.startDate,
    required this.endDate,
  });

  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Last Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Selected Date Range:"),
          Text("Start Date: ${widget.startDate}"),
          Text("End Date: ${widget.endDate}"),
          // Add your content for LastPage here
        ],
      ),
    );
  }
}
