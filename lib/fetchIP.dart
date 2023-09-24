import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String ipAddress = 'Fetching IP...';

  @override
  void initState() {
    super.initState();
    getIpAddress();
  }

  Future<void> getIpAddress() async {
    final response = await http.get(Uri.parse('https://api.ipify.org?format=json'));

    if (response.statusCode == 200) {
      setState(() {
        ipAddress = response.body;
      });
    } else {
      setState(() {
        ipAddress = 'Failed to fetch IP';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IP Address App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your IP Address:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                ipAddress,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
