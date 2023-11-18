import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'last.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Page"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _selectDateRange(context),
            child: Text("Select Date Range"),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.month,
            selectedDayPredicate: (day) => _isDateSelected(day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                selectedStartDate = selectedDay;
                // For simplicity, don't schedule notifications in this example
              });
            },
          ),
        ],
      ),
    );
  }

  bool _isDateSelected(DateTime day) {
    if (selectedStartDate != null && selectedEndDate != null) {
      return (day.isAfter(selectedStartDate!.subtract(Duration(days: 1))) &&
              day.isBefore(selectedEndDate!.add(Duration(days: 1)))) ||
          (day.month == selectedStartDate!.month + 1 &&
              day.day == selectedStartDate!.day);
    }
    return false;
  }

  _selectDateRange(BuildContext context) async {
    DateTime? startDate = await _selectDate(context, selectedStartDate);
    if (startDate != null) {
      DateTime? endDate = await _selectDate(context, selectedEndDate);
      if (endDate != null) {
        setState(() {
          selectedStartDate = startDate;
          selectedEndDate = endDate;
        });

        // Navigate to LastPage and pass selected dates
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LastPage(
              startDate: selectedStartDate!,
              endDate: selectedEndDate!,
            ),
          ),
        );
      }
    }
  }

  Future<DateTime?> _selectDate(
      BuildContext context, DateTime? initialDate) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );

    return selectedDate;
  }
}
