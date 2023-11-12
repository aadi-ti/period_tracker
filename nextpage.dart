import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'last.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  CalendarFormat format = CalendarFormat.month;
  DateTime? selectedDate;
  DateTime? highlightedStartDate;
  DateTime? highlightedEndDate;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.date_range),
            onPressed: () async {
              await _selectDate(context);
            },
          ),
        ],
      ),
      body: TableCalendar(
        firstDay: DateTime.now().subtract(Duration(days: 365)),
        lastDay: DateTime.now().add(Duration(days: 365)),
        focusedDay: focusedDay,
        selectedDayPredicate: (DateTime date) {
          return selectedDate != null &&
              date.isAfter(highlightedStartDate ??
                  selectedDate!.subtract(Duration(days: 2))) &&
              date.isBefore(
                  highlightedEndDate ?? selectedDate!.add(Duration(days: 2)));
        },
        calendarFormat: format,
        onDaySelected: (day, focusedDay) {
          setState(() {
            selectedDate = day;
            _updateHighlightedRange();
          });
        },
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: Colors.blue[300],
          ),
          todayDecoration: BoxDecoration(
            color: Colors.blue[100],
          ),
          selectedTextStyle: TextStyle(color: Colors.blue[600]),
          todayTextStyle: TextStyle(color: Colors.blue[800]),
          outsideTextStyle: TextStyle(color: Colors.grey),
        ),
        headerStyle: HeaderStyle(
          titleTextStyle: TextStyle(fontSize: 18.0, color: Colors.blue[900]),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    Map<String, DateTime?>? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LastPage(),
      ),
    );

    if (result != null && result['startDate'] != null) {
      setState(() {
        selectedDate = result['startDate'];
        _updateHighlightedRange();
        focusedDay = result['startDate']!;
      });
    }
  }

  void _updateHighlightedRange() {
    if (selectedDate != null) {
      highlightedStartDate = selectedDate;
      highlightedEndDate = selectedDate!.add(Duration(days: 8));
    } else {
      highlightedStartDate = null;
      highlightedEndDate = null;
    }
  }
}
