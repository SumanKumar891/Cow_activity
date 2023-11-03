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
            'The people who work at MoooFarm are driven by the idea that the optimum results are born out of perseverance, determination and strong team-connection. A group of young, dynamic and optimistic individuals coming from diverse range of backgrounds and experience, but with the Mutual goal - to empower the Dairy Farmers. This is team MoooFarm, a lot of smiling happy people who work hard to put a smile on the face of our Farmers.'

                '\n \n IIT Ropar Technology and Innovation Foundation (iHub – AWaDH) for Agriculture and Water Technology Development Hub is established by the Department of Science & Technology (DST), Government of India, at the Indian Institute of Technology Ropar in the framework of National Mission on Interdisciplinary Cyber Physical Systems (NM – ICPS) with time-bound predefined deliverables. With a funding support of 110 Cr through the DST Govt of India, IIT Ropar Technology & Innovation Foundation supports deep-tech research ideas, startups, innovators. The hub supports R&D in the domain of Agriculture, Water, IoT, ICPS, provides incubation & acceleration resources and support to technology-based start-ups towards sustainable agriculture.',
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
