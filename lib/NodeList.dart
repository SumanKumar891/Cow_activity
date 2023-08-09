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
  Widget build(BuildContext context) {
    updateDisplayedCowIds(); // Update the displayed cow IDs

    double screenWidth = MediaQuery.of(context).size.width;
    double windowWidth = screenWidth * 0.8; // Set desired width percentage

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
            width: windowWidth,
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


  void navigateToNewPage(BuildContext context, String originalCowId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage(nodeId: originalCowId)),
    );
  }
}
