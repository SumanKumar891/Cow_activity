import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Acceptance of Terms',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'By using Mooofarm, you agree to abide by these Terms and Conditions. If you do not agree to these terms, please do not use the app.',
            ),
            SizedBox(height: 16.0),
            Text(
              '2. Cow Health Monitoring System',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Mooofarm is a cow health monitoring system designed to help users track and manage the health of their cows. The app provides information and data related to cow health and is not a substitute for professional veterinary advice.',
            ),
            SizedBox(height: 16.0),
            // Add more sections as needed

            Text(
              '3. User Responsibilities',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Users are responsible for the accuracy of the information provided in Mooofarm. It is essential to follow proper veterinary advice and seek professional help in case of health concerns for the cows.',
            ),
            SizedBox(height: 16.0),

            Text(
              '4. Privacy Policy',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Please review our Privacy Policy to understand how we collect, use, and disclose information about our users.',
            ),
            SizedBox(height: 16.0),

            Text(
              '5. Changes to Terms and Conditions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'We reserve the right to modify these Terms and Conditions at any time. Users will be notified of changes, and continued use of Mooofarm after such modifications constitutes acceptance of the updated terms.',
            ),
            SizedBox(height: 16.0),

            Text(
              '6. Copyright Notice',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'All content and materials available on Mooofarm, including but not limited to text, graphics, logos, button icons, images, audio clips, digital downloads, and data compilations, is the property of Mooofarm and is protected by international copyright laws. The compilation of all content on this app is the exclusive property of Mooofarm and is protected by international copyright laws. All rights reserved @2023.',
            ),
            SizedBox(height: 16.0),

            Text(
              '7. Developed and Maintained by',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Mooofarm is developed and maintained by Awadh, IIT Ropar, Punjab, India.',
            ),
            SizedBox(height: 16.0),

            Text(
              '8. Contact Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'For any questions or concerns regarding these Terms and Conditions, please contact us at support@mooofarm.com.',
            ),
          ],
        ),
      ),
    );
  }
}
