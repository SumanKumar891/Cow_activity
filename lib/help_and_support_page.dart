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
            _buildGuideTile('How to Use Our App', 'Learn the basics of our app.'),
            _buildSectionTitle('FAQs'),
            _buildFAQTile('What is Moofarm?', 'Moofarm is a cow health tracking agency'),
            _buildFAQTile('How to Reset Password', 'Follow these steps to reset your password.'),
            _buildSectionTitle('Troubleshooting'),
            _buildGuideTile('App Crashing', 'Tips to resolve app crashing issues.'),
            _buildGuideTile('No Internet Connection', 'Troubleshoot internet connectivity problems.'),
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

  Widget _buildGuideTile(String title, String description) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      onTap: () {
        // Add navigation to the respective guide or tutorial.
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
