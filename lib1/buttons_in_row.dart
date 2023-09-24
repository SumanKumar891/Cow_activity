
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Row Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ButtonRowPage(),
    );
  }
}

class ButtonRowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Row'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle button 1 press
              },
              child: Text('Button 1'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // Handle button 2 press
              },
              child: Text('Button 2'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // Handle button 3 press
              },
              child: Text('Button 3'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // Handle button 4 press
              },
              child: Text('Button 4'),
            ),
          ],
        ),
      ),
    );
  }
}
