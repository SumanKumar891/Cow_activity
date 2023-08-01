
import 'package:flutter/material.dart';
import 'dart:ui';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        title: Padding(
          padding: const EdgeInsets.only(right: 350.0),
          child: Image.network(
            'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
            width:42,
            height:42 ,
          ),
        ),
        leading: IconButton(
          iconSize: 200,
          icon: Image.network(
            'https://tiimg.tistatic.com/gd/co_logos/MOOO-FARM-PRIVATE-LIMITED-v1-200524.jpeg',
            width:50,
            height:50 ,

          ),
          onPressed: (){},

        ),


        /*actions: [
          IconButton(
            icon: Image.network(
              'data:image/jpeg;base64,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',
              width: 50,
              height: 50,
            ),
            onPressed: (){

            },
          ),
        ],*/


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
  //TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    //_passwordController.dispose();
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
                  decoration: InputDecoration(labelText: 'Farmer ID'),
                ),
                SizedBox(height: 20),
                /*TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Farmer ID'),
                  obscureText: false, // Show password in plain text
                ),*/
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text.trim();
                  //String password = _passwordController.text;

                  if (username.isEmpty/* || password.isEmpty*/) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please enter FarmerID'),
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
                        builder: (context) => TablePage(username: username/*, password: password*/),
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
  //final String password;

  TablePage({required this.username/*, required this.password*/});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Nodes'),
      ),
      body: Center(
        child: FloatingTable(username: username/*, password: password*/),
      ),
    );
  }
}

class FloatingTable extends StatelessWidget {
  final String username;
  // final String password;

  FloatingTable({required this.username/*, required this.password*/});

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
              buildTableCell('Farmer ID:', fontWeight: FontWeight.bold),
              buildTableCell(username),
            ],
          ),
          /*TableRow(
            children: [
              buildTableCell('FarmerID:', fontWeight: FontWeight.bold),
              buildTableCell(password),
            ],
          ),*/
          TableRow(
            children: [
              Divider(color: Colors.black),
              Divider(color: Colors.black),
            ],
          ),
          TableRow(
            children: [
              buildTableCell('Node ID', fontWeight: FontWeight.bold),
              buildTableCell('Status', fontWeight: FontWeight.bold),
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
              buildTableCell('101'),
              buildTableCell('click here'),
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
              buildTableCell('102'),
              buildTableCell('click here'),
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

