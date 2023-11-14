import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  DateTime? startDate;
  DateTime? endDate;
  Set<DateTime> selectedDates = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showDateInputDialog(context);
          },
          child: Text('Enter Dates of Previous Periods'),
        ),
      ),
    );
  }

  Future<void> _showDateInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Dates of Previous Periods'),
          content: Column(
            children: [
              Text('Start Date:'),
              Container(
                child: InkWell(
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        startDate = picked;
                        selectedDates.add(startDate!);
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: selectedDates.contains(startDate)
                          ? Colors.blue[200]
                          : null,
                    ),
                    child: Text(
                      startDate?.toLocal().toString().split(' ')[0] ?? 'Select',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('End Date:'),
              Container(
                child: InkWell(
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        endDate = picked;
                        selectedDates.add(endDate!);
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: selectedDates.contains(endDate)
                          ? Colors.blue[200]
                          : null,
                    ),
                    child: Text(
                      endDate?.toLocal().toString().split(' ')[0] ?? 'Select',
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Pass the selected dates back to the previous page
                Navigator.of(context)
                    .pop({'startDate': startDate, 'endDate': endDate});
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

