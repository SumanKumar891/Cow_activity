
import 'package:flutter/material.dart';
import 'dart:ui';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Homepage'),
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the app bar shadow
      ),
      body: Stack(
        children: [
          // Background image for the homepage
          Image.network(
            'https://png.pngtree.com/thumb_back/fh260/background/20210910/pngtree-a-herd-of-cows-on-the-grass-in-the-afternoon-image_838492.jpg', // Replace this with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          /*Center(
            child: Image.network(
              'https://png.pngtree.com/thumb_back/fh260/background/20210910/pngtree-a-herd-of-cows-on-the-grass-in-the-afternoon-image_838492.jpg', // Replace this with your image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),*/
          Center(
            child: LoginWindow(),
          ),
        ],
      ),
    );
  }
}






class LoginWindow extends StatefulWidget {
  @override
  _LoginWindowState createState() => _LoginWindowState();
}

class _LoginWindowState extends State<LoginWindow> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Material(
          color: Colors.transparent, // Set transparent background for the AlertDialog
          child: AlertDialog(
            elevation: 8.0, // Add elevation for shadow effect
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            title: Text('Login'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: false, // Show password in plain text
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text.trim();
                  String password = _passwordController.text;

                  if (username.isEmpty || password.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please enter both username and password.'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Navigate to the new page with the table
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TablePage(username: username, password: password),
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






/*
class FloatingTable extends StatelessWidget {
  final String username;
  final String password;

  FloatingTable({required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username: $username', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Password: $password', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Table(
              //border: TableBorder.all(horizontalInside: BorderSide(width: 1, color: Colors.blue, style: BorderStyle.solid),
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  TableCell(child: Center(child: Text('Column 1'))),
                  TableCell(child: Center(child: Text('Column 2'))),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Center(child: Text('Data 1'))),
                  TableCell(child: Center(child: Text('Data 2'))),
                ],
              ),
              // Add more rows here as needed
            ],
          ),
        ],
      ),
    );
  }
}
*/










class TablePage extends StatelessWidget {
  final String username;
  final String password;

  TablePage({required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Page'),
      ),
      body: Center(
        child: FloatingTable(username: username, password: password),
      ),
    );
  }
}

class FloatingTable extends StatelessWidget {
  final String username;
  final String password;

  FloatingTable({required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FlexColumnWidth(0.5),
          1: FlexColumnWidth(0.5),
        },
        children: [
          TableRow(
            children: [
              buildTableCell('Username:', fontWeight: FontWeight.bold),
              buildTableCell(username),
            ],
          ),
          TableRow(
            children: [
              buildTableCell('Password:', fontWeight: FontWeight.bold),
              buildTableCell(password),
            ],
          ),
          TableRow(
            children: [
              Divider(color: Colors.black),
              Divider(color: Colors.black),
            ],
          ),
          TableRow(
            children: [
              buildTableCell('Column 1:', fontWeight: FontWeight.bold),
              buildTableCell('Column 2:', fontWeight: FontWeight.bold),
            ],
          ),

          //solid line
          TableRow(
            children: [
              Divider(color: Colors.black),
              Divider(color: Colors.black),
            ],
          ),
          TableRow(
            children: [
              buildTableCell('Data 1'),
              buildTableCell('Data 2'),
            ],
          ),
          //solid line
          TableRow(
            children: [
              Divider(color: Colors.black),
              Divider(color: Colors.black),
            ],
          ),
          TableRow(
            children: [
              buildTableCell('Data 3'),
              buildTableCell('Data 4'),
            ],
          ),
          //solid line
          TableRow(
            children: [
              Divider(color: Colors.black),
              Divider(color: Colors.black),
            ],
          ),
          // Add more rows here as needed
        ],
      ),
    );
  }

  Widget buildTableCell(String text, {FontWeight? fontWeight}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: fontWeight),
        ),
      ),
    );
  }
}
