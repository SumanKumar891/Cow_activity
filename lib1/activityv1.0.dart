

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        '/table': (context) => TablePage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  void _navigateToTable(BuildContext context) {
    Navigator.pushNamed(context, '/table');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _navigateToTable(context);
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

class TablePage extends StatelessWidget {
  final List<Map<String, dynamic>> tableData = [
    {'sno': 1, 'activity': 'Visit Google', 'url': 'https://www.google.com'},
    {'sno': 2, 'activity': 'Visit OpenAI', 'url': 'https://www.openai.com'},
    // Add more rows here
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _navigateToDetails(BuildContext context, int sno) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(sno: sno),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table')),
      body: DataTable(
        columns: [
          DataColumn(label: Text('Sno.')),
          DataColumn(label: Text('Activity')),
        ],
        rows: tableData.map((data) {
          return DataRow(
            cells: [
              DataCell(Text(data['sno'].toString())),
              DataCell(
                InkWell(
                  child: Text(data['activity']),
                  onTap: () => _navigateToDetails(context, data['sno']),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final int sno;

  DetailsPage({required this.sno});

  @override
  Widget build(BuildContext context) {
    // Replace this with the actual data for the corresponding sno.
    List<Map<String, String>> detailsData = [
      {'column1': 'Data for sno $sno', 'column2': 'Some Details'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: DataTable(
        columns: [
          DataColumn(label: Text('Column 1')),
          DataColumn(label: Text('Column 2')),
        ],
        rows: detailsData.map((data) {
          return DataRow(cells: [
            DataCell(Text(data['column1'] ?? '')),
            DataCell(Text(data['column1'] ?? '')),
          ]);
        }).toList(),
      ),
    );
  }
}
