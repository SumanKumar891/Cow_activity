
//final url = Uri.parse('https://wcelyqvyi7.execute-api.us-east-1.amazonaws.com/deployment/cow?deviceId=$deviceId&starttime=$starttime&endtime=$endtime'); // Replace with your API endpoint
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: MyWidget(),
  ));
}

class ApiService {
  static Future<String> fetchData(String deviceId) async {
    if (deviceId.isEmpty) {
      throw Exception('Device ID is empty');
    }

    // Replace 'your-api-endpoint' with the actual API endpoint
    final response = await http.get(Uri.parse('https://wcelyqvyi7.execute-api.us-east-1.amazonaws.com/deployment/cow?deviceId=$deviceId'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _textFieldController = TextEditingController();
  String _inputData = '';

  void _storeInputData() {
    setState(() {
      _inputData = _textFieldController.text;
    });
  }

  Future<void> _fetchDataFromApi(String deviceId) async {
    try {
      String apiData = await ApiService.fetchData(deviceId);
      // Process the fetched data as needed
      print(apiData);
    } catch (e) {
      print('Error fetching data: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to fetch data from API. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                labelText: 'Enter device ID',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _storeInputData();
                _fetchDataFromApi(_textFieldController.text);
              },
              child: Text('Fetch Data'),
            ),
            SizedBox(height: 16.0),
            Text('Stored Input Data: $_inputData'),
          ],
        ),
      ),
    );
  }
}
