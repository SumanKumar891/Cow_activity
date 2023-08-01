import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void fetchData() async {
  final url = Uri.parse('https://wcelyqvyi7.execute-api.us-east-1.amazonaws.com/deployment/cow?deviceId=120&starttime=1688132921&endtime=1688133222');  // Replace with your API endpoint

  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonData = response.body;
    // Process the JSON data here
    print(jsonData);
  } else {
    print('Error: ${response.statusCode}');
  }
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('API Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: fetchData,
            child: Text('Fetch Data'),
          ),
        ),
      ),
    );
  }
}