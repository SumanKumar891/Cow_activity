/*

    Sarthak @2023

 */

/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DataFetchAPI.dart';

class Cow {
  final String nodeId;
  final String imagePath;
  Cow({required this.nodeId, required this.imagePath});
}

class ThirdPage extends StatefulWidget {
  final String email;
  ThirdPage({required this.email});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class CustomFloatingWindow extends StatelessWidget {
  final String nodeId;
  final String imagePath;
  final String buttonText;
  final VoidCallback onButtonPressed;

  CustomFloatingWindow({
    required this.nodeId,
    required this.imagePath,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imagePath),
          ListTile(
            title: Text('Cow ID: $nodeId'),
            trailing: ElevatedButton(
              onPressed: onButtonPressed,
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}


class _ThirdPageState extends State<ThirdPage> {
  List<int> nodeIds = []; // List to store node IDs
  int currentPage = 0; // Current page index
  List<int> displayedCowIds = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    print(widget.email);
    final response = await http.get(Uri.parse(
        'https://l5i2o65d2i.execute-api.us-east-1.amazonaws.com/fetch_nodeIds?farmerId=${widget.email}')); // Replace with actual API URL
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final firstItem = data.first as Map<String, dynamic>;
      final nodeIdsList = firstItem['nodeId'] as List<dynamic>;
      setState(() {
        nodeIds = nodeIdsList.cast<int>(); // Convert nodeId List to List<int>
      });
    } else if (response.statusCode == 404) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.body)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.body)),
      );
    }
  }

  List<int> getCurrentPageNodeIds() {
    final startIndex = currentPage * 10;
    final endIndex = (currentPage + 1) * 10;

    final lastPageIndex = (nodeIds.length / 10).ceil() - 1;
    final adjustedEndIndex = endIndex.clamp(0, nodeIds.length);

    return nodeIds.sublist(startIndex, adjustedEndIndex);
  }

  void nextPage() {
    if (currentPage < (nodeIds.length / 10).ceil() - 1) {
      setState(() {
        currentPage++;
      });
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  void updateDisplayedCowIds() {
    displayedCowIds.clear(); // Clear the list
    final currentPageNodeIds = getCurrentPageNodeIds();

    for (var i = 0; i < currentPageNodeIds.length; i++) {
      final displayedCowId =
          i + (currentPage * 10) + 1; // Displayed cow ID (1, 2, 3, etc.)
      displayedCowIds.add(displayedCowId); // Add to the displayed cow IDs list
    }
  }

  @override
  /*
  Widget build(BuildContext context) {
    updateDisplayedCowIds(); // Update the displayed cow IDs

    return Scaffold(
      appBar: AppBar(
        title: Text('MY ALL COWS'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: displayedCowIds.map((displayedCowId) {
          final originalCowId =
              (displayedCowId - 1) + 101; // Original cow ID (101, 102, etc.)

          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CustomFloatingWindow(

              nodeId: displayedCowId.toString(), // Use displayed cow ID
              imagePath:
                  'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
              buttonText: 'Click Here',
              onButtonPressed: () {
                print(
                    'Clicked on Displayed Cow ID: $displayedCowId'); // Print displayed cow ID
                print(
                    'Original Cow ID: $originalCowId'); // Print original cow ID
                navigateToNewPage(context, originalCowId.toString());
              },
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: previousPage,
            ),
            Text('Page ${currentPage + 1}'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: nextPage,
            ),
          ],
        ),
      ),
    );
  }
  */
  /*
  Widget build(BuildContext context) {
    updateDisplayedCowIds(); // Update the displayed cow IDs

    double screenWidth = MediaQuery.of(context).size.width;
    double windowWidth = screenWidth * 0.6; // Set desired width percentage

    return Scaffold(
      appBar: AppBar(
        title: Text('MY ALL COWS'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: displayedCowIds.map((displayedCowId) {
          final originalCowId =
              (displayedCowId - 1) + 101; // Original cow ID (101, 102, etc.)

          return Container(
            width: windowWidth * 0.4,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),

            child: CustomFloatingWindow(
              nodeId: displayedCowId.toString(), // Use displayed cow ID
              imagePath:
              'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
              buttonText: 'Click Here',
              onButtonPressed: () {
                print(
                    'Clicked on Displayed Cow ID: $displayedCowId'); // Print displayed cow ID
                print(
                    'Original Cow ID: $originalCowId'); // Print original cow ID
                navigateToNewPage(context, originalCowId.toString());
              },

            ),

          );

        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: previousPage,
            ),
            Text('Page ${currentPage + 1}'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: nextPage,
            ),
          ],
        ),
      ),
    );
  }
  */

  Widget build(BuildContext context) {
    updateDisplayedCowIds(); // Update the displayed cow IDs

    double screenWidth = MediaQuery.of(context).size.width;
    double windowWidth = screenWidth * 0.4; // Set desired width percentage
    double paddingRatio = 0.1; // Set your desired padding ratio (10% in this example)
    //double screenWidth = MediaQuery.of(context).size.width;
    double paddingValue = screenWidth * 0.9;


    return Scaffold(
      appBar: AppBar(
        title: Text('MY ALL COWS'),
      ),
      body: ListView(

        padding: EdgeInsets.all(65),
        //padding: EdgeInsets.all(paddingValue),
        children: displayedCowIds.map((displayedCowId) {
          final originalCowId =
              (displayedCowId - 1) + 101; // Original cow ID (101, 102, etc.)

          return buildCustomFloatingWindow(
            displayedCowId: displayedCowId,
            originalCowId: originalCowId,
            context: context,
            windowWidth: windowWidth,
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: previousPage,
            ),
            Text('Page ${currentPage + 1}'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: nextPage,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomFloatingWindow({
    required int displayedCowId,
    required int originalCowId,
    required BuildContext context,
    required double windowWidth,
  }) {
    return Card(
      elevation: 3.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        //side: BorderSide(color: Colors.grey, width: 1.0),
      ),
      child: Container(
        width: windowWidth * 0.4,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomFloatingWindow(
              nodeId: displayedCowId.toString(),
              imagePath:
              'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
              buttonText: 'Click Here',
              onButtonPressed: () {
                print('Clicked on Displayed Cow ID: $displayedCowId');
                print('Original Cow ID: $originalCowId');
                navigateToNewPage(context, originalCowId.toString());
              },
            ),
          ],
        ),
      ),
    );
  }



  void navigateToNewPage(BuildContext context, String originalCowId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage(nodeId: originalCowId)),
    );
  }
}

*/

/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DataFetchAPI.dart';

class Cow {
  final String nodeId;
  final String imagePath;
  Cow({required this.nodeId, required this.imagePath});
}

class ThirdPage extends StatefulWidget {
  final String email;
  ThirdPage({required this.email});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class CustomFloatingWindow extends StatelessWidget {
  final String nodeId;
  final String imagePath;
  final String buttonText;
  final VoidCallback onButtonPressed;

  CustomFloatingWindow({
    required this.nodeId,
    required this.imagePath,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imagePath),
          ListTile(
            title: Text('Cow ID: $nodeId'),
            trailing: ElevatedButton(
              onPressed: onButtonPressed,
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}


class _ThirdPageState extends State<ThirdPage> {
  List<int> nodeIds = []; // List to store node IDs
  int currentPage = 0; // Current page index
  List<int> displayedCowIds = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    print(widget.email);
    final response = await http.get(Uri.parse(
        'https://l5i2o65d2i.execute-api.us-east-1.amazonaws.com/fetch_nodeIds?farmerId=${widget.email}')); // Replace with actual API URL
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final firstItem = data.first as Map<String, dynamic>;
      final nodeIdsList = firstItem['nodeId'] as List<dynamic>;
      setState(() {
        nodeIds = nodeIdsList.cast<int>(); // Convert nodeId List to List<int>
      });
    } else if (response.statusCode == 404) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.body)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.body)),
      );
    }
  }

  List<int> getCurrentPageNodeIds() {
    final startIndex = currentPage * 10;
    final endIndex = (currentPage + 1) * 10;

    final lastPageIndex = (nodeIds.length / 10).ceil() - 1;
    final adjustedEndIndex = endIndex.clamp(0, nodeIds.length);

    return nodeIds.sublist(startIndex, adjustedEndIndex);
  }

  void nextPage() {
    if (currentPage < (nodeIds.length / 10).ceil() - 1) {
      setState(() {
        currentPage++;
      });
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  void updateDisplayedCowIds() {
    displayedCowIds.clear(); // Clear the list
    final currentPageNodeIds = getCurrentPageNodeIds();

    for (var i = 0; i < currentPageNodeIds.length; i++) {
      final displayedCowId =
          i + (currentPage * 10) + 1; // Displayed cow ID (1, 2, 3, etc.)
      displayedCowIds.add(displayedCowId); // Add to the displayed cow IDs list
    }
  }

  @override
  /*
  Widget build(BuildContext context) {
    updateDisplayedCowIds(); // Update the displayed cow IDs

    return Scaffold(
      appBar: AppBar(
        title: Text('MY ALL COWS'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: displayedCowIds.map((displayedCowId) {
          final originalCowId =
              (displayedCowId - 1) + 101; // Original cow ID (101, 102, etc.)

          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CustomFloatingWindow(

              nodeId: displayedCowId.toString(), // Use displayed cow ID
              imagePath:
                  'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
              buttonText: 'Click Here',
              onButtonPressed: () {
                print(
                    'Clicked on Displayed Cow ID: $displayedCowId'); // Print displayed cow ID
                print(
                    'Original Cow ID: $originalCowId'); // Print original cow ID
                navigateToNewPage(context, originalCowId.toString());
              },
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: previousPage,
            ),
            Text('Page ${currentPage + 1}'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: nextPage,
            ),
          ],
        ),
      ),
    );
  }
  */
  /*
  Widget build(BuildContext context) {
    updateDisplayedCowIds(); // Update the displayed cow IDs

    double screenWidth = MediaQuery.of(context).size.width;
    double windowWidth = screenWidth * 0.6; // Set desired width percentage

    return Scaffold(
      appBar: AppBar(
        title: Text('MY ALL COWS'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: displayedCowIds.map((displayedCowId) {
          final originalCowId =
              (displayedCowId - 1) + 101; // Original cow ID (101, 102, etc.)

          return Container(
            width: windowWidth * 0.4,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),

            child: CustomFloatingWindow(
              nodeId: displayedCowId.toString(), // Use displayed cow ID
              imagePath:
              'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
              buttonText: 'Click Here',
              onButtonPressed: () {
                print(
                    'Clicked on Displayed Cow ID: $displayedCowId'); // Print displayed cow ID
                print(
                    'Original Cow ID: $originalCowId'); // Print original cow ID
                navigateToNewPage(context, originalCowId.toString());
              },

            ),

          );

        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: previousPage,
            ),
            Text('Page ${currentPage + 1}'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: nextPage,
            ),
          ],
        ),
      ),
    );
  }
  */

  Widget build(BuildContext context) {
    updateDisplayedCowIds(); // Update the displayed cow IDs

    double screenWidth = MediaQuery.of(context).size.width;
    double windowWidth = screenWidth * 0.4; // Set desired width percentage
    double paddingRatio = 0.1; // Set your desired padding ratio (10% in this example)
    //double screenWidth = MediaQuery.of(context).size.width;
    double paddingValue = screenWidth * 0.9;


    return Scaffold(
      appBar: AppBar(
        title: Text('MY ALL COWS'),
      ),
      body: ListView(

        padding: EdgeInsets.all(65),
        //padding: EdgeInsets.all(paddingValue),
        children: displayedCowIds.map((displayedCowId) {
          final originalCowId =
              (displayedCowId - 1) + 101; // Original cow ID (101, 102, etc.)

          return buildCustomFloatingWindow(
            displayedCowId: displayedCowId,
            originalCowId: originalCowId,
            context: context,
            windowWidth: windowWidth,
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: previousPage,
            ),
            Text('Page ${currentPage + 1}'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: nextPage,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomFloatingWindow({
    required int displayedCowId,
    required int originalCowId,
    required BuildContext context,
    required double windowWidth,
  }) {
    return Card(
      elevation: 3.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        //side: BorderSide(color: Colors.grey, width: 1.0),
      ),
      child: Container(
        width: windowWidth * 0.4,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomFloatingWindow(
              nodeId: displayedCowId.toString(),
              imagePath:
              'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
              buttonText: 'Click Here',
              onButtonPressed: () {
                print('Clicked on Displayed Cow ID: $displayedCowId');
                print('Original Cow ID: $originalCowId');
                navigateToNewPage(context, originalCowId.toString());
              },
            ),
          ],
        ),
      ),
    );
  }



  void navigateToNewPage(BuildContext context, String originalCowId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage(nodeId: originalCowId)),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DataFetchAPI.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';

class Cow {
  final String nodeId;
  final String imagePath;
  Cow({required this.nodeId, required this.imagePath});
}

class ThirdPage extends StatefulWidget {
  final String email;
  final AppLocalizations appLocalizations;
  ThirdPage({required this.email, required this.appLocalizations});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class CustomFloatingWindow extends StatelessWidget {
  final String nodeId;
  final String imagePath;
  final String buttonText;
  final String cowIdText;
  final VoidCallback onButtonPressed;

  CustomFloatingWindow({
    required this.nodeId,
    required this.imagePath,
    required this.buttonText,
    required this.cowIdText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imagePath),
          ListTile(
            title: Text('$cowIdText : $nodeId',
              style: GoogleFonts.kalam (
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    //color: Colors.green,
                  )),
            ),
            trailing: ElevatedButton(
              onPressed: onButtonPressed,
              child: Text(buttonText,
                style: GoogleFonts.kalam (
                    textStyle: TextStyle(
                      fontSize: 14.0,
                      //color: Colors.green,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThirdPageState extends State<ThirdPage> {
  List<int> nodeIds = [];
  int currentPage = 0;
  List<int> displayedCowIds = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(
          'https://l5i2o65d2i.execute-api.us-east-1.amazonaws.com/fetch_nodeIds?farmerId=${widget.email}'), // Replace with actual API URL
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final firstItem = data.first as Map<String, dynamic>;
      final nodeIdsList = firstItem['nodeId'] as List<dynamic>;
      setState(() {
        nodeIds = nodeIdsList.cast<int>();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.body)),
      );
    }
  }

  List<int> getCurrentPageNodeIds() {
    final startIndex = currentPage * 10;
    final endIndex = (currentPage + 1) * 10;

    final adjustedEndIndex = endIndex.clamp(0, nodeIds.length);

    return nodeIds.sublist(startIndex, adjustedEndIndex);
  }

  void nextPage() {
    if (currentPage < (nodeIds.length / 10).ceil() - 1) {
      setState(() {
        currentPage++;
      });
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  void updateDisplayedCowIds() {
    displayedCowIds.clear();
    final currentPageNodeIds = getCurrentPageNodeIds();

    for (var i = 0; i < currentPageNodeIds.length; i++) {
      final displayedCowId = i + (currentPage * 10) + 1;
      displayedCowIds.add(displayedCowId);
    }
  }

  @override
  Widget build(BuildContext context) {
    updateDisplayedCowIds();
    double screenWidth = MediaQuery.of(context).size.width;
    double windowWidth = screenWidth * 0.4;
    double paddingRatio = 0.1;
    double paddingValue = screenWidth * paddingRatio;
    bool isLargerScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appLocalizations.localizedValues['my_cows'],
          style: GoogleFonts.kalam (
              textStyle: TextStyle(
                fontSize: 20.0,
                //color: Colors.green,
              ),),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(paddingValue),
        children: isLargerScreen
            ? _buildWindowsInRows(windowWidth)
            : _buildWindowsInSingleColumn(windowWidth),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: previousPage,
            ),
            Text(
                '${widget.appLocalizations.localizedValues['page']} ${currentPage + 1}',
              style: GoogleFonts.kalam (
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    //color: Colors.green,
                  )),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: nextPage,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildWindowsInRows(double windowWidth) {
    int windowsPerRow = 2;
    List<Widget> rows = [];

    for (int i = 0; i < displayedCowIds.length; i += windowsPerRow) {
      List<Widget> rowChildren = [];

      for (int j = 0; j < windowsPerRow; j++) {
        int index = i + j;

        if (index < displayedCowIds.length) {
          final displayedCowId = displayedCowIds[index];
          final originalCowId = (displayedCowId - 1) + 101;

          double cardWidth = windowWidth / windowsPerRow;

          rowChildren.add(
            Container(
              width: cardWidth,
              padding: EdgeInsets.all(8.0),
              child: buildCustomFloatingWindow(
                displayedCowId: displayedCowId,
                originalCowId: originalCowId,
                context: context,
              ),
            ),
          );
        }
      }

      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowChildren,
        ),
      );
    }

    return rows;
  }

  List<Widget> _buildWindowsInSingleColumn(double windowWidth) {
    return displayedCowIds.map((displayedCowId) {
      final originalCowId = (displayedCowId - 1) + 101;

      return Container(
        width: windowWidth,
        padding: EdgeInsets.all(8.0),
        child: buildCustomFloatingWindow(
          displayedCowId: displayedCowId,
          originalCowId: originalCowId,
          context: context,
        ),
      );
    }).toList();
  }

  Widget buildCustomFloatingWindow({
    required int displayedCowId,
    required int originalCowId,
    required BuildContext context,
  }) {
    return Card(
      elevation: 3.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          CustomFloatingWindow(
              nodeId: displayedCowId.toString(),
              imagePath:
             'assets/images/tarantarancow1.jpeg',

              buttonText: widget.appLocalizations.localizedValues['click_here'],
              onButtonPressed: () {
                print('Clicked on Displayed Cow ID: $displayedCowId');
                print('Original Cow ID: $originalCowId');
                navigateToNewPage(
                    context, originalCowId.toString(), widget.appLocalizations);
              },
              cowIdText: widget.appLocalizations.localizedValues['cow_id']),
        ],
      ),
    );
  }

  void navigateToNewPage(BuildContext context, String originalCowId,
      AppLocalizations appLocalizations) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NewPage(
              nodeId: originalCowId, appLocalizations: appLocalizations)),
    );
  }
}
