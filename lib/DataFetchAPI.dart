/*
Sarthak@2023
 */

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dataTablePage.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPage extends StatelessWidget {
  final AppLocalizations appLocalizations;
  final String nodeId;
  final String email;
  NewPage({
    required this.nodeId,
    required this.appLocalizations,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text(' '),
      ),

      body: Center(
        child: Container(
          width: 500, // Set the width of the container
          height: 400, // Set the height of the container
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              // Add rounded corners to the Card
              borderRadius:
                  BorderRadius.circular(20), // Adjust the radius as needed
            ),
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: TableWidget(
                      nodeId: nodeId,
                      appLocalizations: appLocalizations,
                      email: email,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TableWidget extends StatefulWidget {
  final String nodeId;
  final AppLocalizations appLocalizations;
  final String email;
  TableWidget({
    required this.nodeId,
    required this.appLocalizations,
    required this.email
  });
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int?
      epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int?
      epochTime2; // Variable to save the EPOCH time for the second selected date and time
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }

  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 =
          DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch ~/ 1000;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 =
          DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch ~/ 1000;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  Future<void> _callApiAndNavigate(
      BuildContext context, AppLocalizations appLocalizations) async {
    setState(() {
      _isLoading = true; // Start loading
    });
    if (epochTime1 != null && epochTime2 != null) {
      try {
        final response = await apiCallFunction(epochTime1!, epochTime2!);
        print(response);
        // Navigate to the DataTablePage and pass the API response data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataTablePage(
                response: response,
                appLocalizations: appLocalizations,
                nodeId: widget.nodeId),
          ),
        );
      } catch (error) {
        print('API Error: $error');
      } finally {
        setState(() {
          _isLoading = false; // End loading
        });
      }
    } else {
      print('Please select both Date and Time first.');
      setState(() {
        _isLoading = false; // End loading
      });
    }
  }

  Future<List<dynamic>> apiCallFunction(int epochTime1, int epochTime2) async {
    // Example: Making a simple GET request to an API endpoint
    print(widget.nodeId);
    final response = await http.get(
      Uri.https(
        'iwkdqlzs8c.execute-api.us-east-1.amazonaws.com',
        '/${widget.email}',
        {
          'startTime': epochTime1.toString(), // Convert to String
          'endTime': epochTime2.toString(), // Convert to String
          'nodeId': widget.nodeId,
        },
      ),
    );
    if (response.statusCode == 200) {
      // If the API call is successful, parse the response data (assuming it's JSON)
      final jsonData = json.decode(response.body);
      return jsonData;
    } else if (response.statusCode == 404) {
      final jsonData = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(jsonData['message'])),
      );
      throw Exception(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          TextFormField(
            controller: _dateTimeController1,
            style: GoogleFonts.kalam(
                textStyle: TextStyle(
              fontSize: 16.0,
              //color: Colors.white,
            )),
            onTap: () => _selectDateTime(context, _dateTimeController1),
            readOnly: true,
            decoration: InputDecoration(
              labelText:
                  widget.appLocalizations.localizedValues['select_start_epoch'],

              //suffixIcon: Icon(Icons.calendar_today),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _dateTimeController2,
            style: GoogleFonts.kalam(
                textStyle: TextStyle(
              fontSize: 16.0,
              //color: Colors.white,
            )),
            onTap: () => _selectDateTime(context, _dateTimeController2),
            readOnly: true,
            decoration: InputDecoration(
              labelText:
                  widget.appLocalizations.localizedValues['select_end_epoch'],
              //suffixIcon: Icon(Icons.calendar_today),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                _callApiAndNavigate(context, widget.appLocalizations),
            child: _isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                : Text(
                    widget.appLocalizations.localizedValues['submit'],
                    style: GoogleFonts.kalam(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        //color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    ]);
  }

  Future<void> _selectDateTime(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}
