//feca8b5bd2a71f721eb5f877c90e2e72

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String locationData = 'Fetching location...';

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    final apiKey = 'feca8b5bd2a71f721eb5f877c90e2e72'; 
    final response = await http.get(Uri.parse('http://api.ipstack.com/check?access_key=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final city = data['city'];
      final region = data['region_name'];
      final country = data['country_name'];
      final latitude = data['latitude'];
      final longitude = data['longitude'];

      setState(() {
        locationData = 'City: $city\nRegion: $region\nCountry: $country\nCoordinates: ($latitude, $longitude)';
      });
    } else {
      setState(() {
        locationData = 'Failed to fetch location';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Location App'),
        ),
        body: Center(
          child: Text(
            locationData,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
