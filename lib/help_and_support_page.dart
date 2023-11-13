import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildSectionTitle('Getting Started'),
            _buildGuideTile('How to Use Our App', 'Learn the basics of our app.', context),
            _buildSectionTitle('FAQs'),
            _buildFAQTile('What is Moofarm App?', 'Moofarm app is a cow health monitoring system'),
            _buildFAQTile('How to Reset Password', 'Please contact customer care'),
            _buildSectionTitle('Troubleshooting'),
            _buildGuideTile('App Crashing', 'Tips to resolve app crashing issues.', context),
            _buildGuideTile('No Internet Connection', 'Troubleshoot internet connectivity problems.', context),
            _buildSectionTitle('Contact Us'),
            _buildContactTile('Email', 'awadh@gmail.com'),
            _buildContactTile('Phone', '+123-456-7890'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGuideTile(String title, String description, BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      onTap: () {
        // Navigate to the AppUsageGuidePage and pass the context
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppUsageGuidePage()),
        );
      },
    );
  }


  Widget _buildFAQTile(String question, String answer) {
    return ExpansionTile(
      title: Text(question),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(answer),
        ),
      ],
    );
  }

  Widget _buildContactTile(String label, String contactInfo) {
    return ListTile(
      title: Text(label),
      subtitle: Text(contactInfo),
      onTap: () {
        // Implement the action to contact support (e.g., open email or dialer).
      },
    );
  }
}

class AppUsageGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Usage Guide'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step 1: Open the App & click continue button',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Step 2: Enter your respective farmer ID & password ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Step 3: Click on the particular cow whose data is to be fetched',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Step 4: Enter the time interval',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            Text(
              'Step 5: Activity of the respective cow is shown in a tabular form, also this data can be downloaded in a csv formar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),

            Text(
              '* For any unwanted behaviour of App, restart it or maybe try reinstalling.  ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Text(
              '* Check the Wi-Fi/Ethernet connection on your device. If the issue persists check the hardware ports.  ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Add more steps as needed
          ],
        ),
      ),
    );
  }
}
