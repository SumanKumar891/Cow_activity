import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Welcome to MoooFarm, where our dedicated team is fueled by the belief that optimal results stem from a potent blend of perseverance, determination, and a robust team spirit. Our dynamic and optimistic group comprises individuals with diverse backgrounds and experiences, all united by a shared goal—to empower dairy farmers. Meet Team MoooFarm: a vibrant collective of young minds working harmoniously to bring smiles to the faces of our invaluable farmers.'
            '\n \n At the heart of our innovation and progress lies the IIT Ropar Technology and Innovation Foundation (iHub – AWaDH), a pioneering initiative established by the Department of Science & Technology (DST), Government of India. Nestled within the Indian Institute of Technology Ropar, iHub operates within the framework of the National Mission on Interdisciplinary Cyber Physical Systems (NM – ICPS), with well-defined, time-bound deliverables. Bolstered by a generous funding support of 110 Cr from the DST, Government of India, IIT Ropar Technology & Innovation Foundation is a driving force behind deep-tech research ideas, startups, and innovators.'
                '\n \n With a keen focus on Agriculture and Water, the Internet of Things (IoT), and Interdisciplinary Cyber Physical Systems (ICPS), our hub serves as a dynamic ecosystem fostering R&D. We not only provide incubation and acceleration resources but also offer unwavering support to technology-based startups, propelling them towards the realm of sustainable agriculture. Join us on this transformative journey, where innovation meets impact, and together, we cultivate a future of prosperity for our agricultural communities.',
            style: TextStyle(
              fontSize: 20, // Adjust the font size as needed
              //fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
        ),
      ),
    );
  }
}
