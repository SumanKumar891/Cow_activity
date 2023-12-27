/*
  Sarthak@2023
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
  final String status;

  Cow({
    required this.nodeId,
    required this.imagePath,
    required this.status,
  });
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
  final String status;
  final VoidCallback onButtonPressed;

  CustomFloatingWindow({
    required this.nodeId,
    required this.imagePath,
    required this.buttonText,
    required this.cowIdText,
    required this.status,
    required this.onButtonPressed,
  });

  @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     color: Colors.black12,
  //     elevation: 8.0,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12.0),
  //     ),
  //     child: Column(
  //       children: [
  //         Image.network(imagePath),
  //         ListTile(
  //           title: Text(
  //             '$cowIdText : $nodeId',
  //             style: GoogleFonts.kalam(
  //               textStyle: TextStyle(
  //                 fontSize: 14.0,
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ),
  //           trailing: ElevatedButton(
  //             onPressed: onButtonPressed,
  //             child: Text(
  //               buttonText,
  //               style: GoogleFonts.kalam(
  //                 textStyle: TextStyle(
  //                   fontSize: 14.0,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Image.network(imagePath),
          ListTile(
            title: Text(
              '$cowIdText : $nodeId',
              style: GoogleFonts.kalam(
                textStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: onButtonPressed,
                  child: Text(
                    buttonText,
                    style: GoogleFonts.kalam(
                      textStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0), // Add some spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    // Handle the "Heat" action here
                    print('Heat action for Node ID: $nodeId');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: Colors.yellow,
                    onPrimary: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Heat',
                      style: TextStyle(
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ],
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
  Map<String, String> cowStatus = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    print('Fetching data...');
    final response = await http.get(
      Uri.parse(
          'https://l5i2o65d2i.execute-api.us-east-1.amazonaws.com/fetch_nodeIds?farmerId=${widget.email}'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final firstItem = data.first as Map<String, dynamic>;
      final nodeIdsList = firstItem['nodeId'] as List<dynamic>;
      setState(() {
        nodeIds = nodeIdsList.cast<int>();
      });

      // Fetch cow statuses and print them
      for (final nodeId in nodeIdsList) {
        await fetchCowStatus(nodeId.toString());
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.body)),
      );
    }
  }

  // Future<void> fetchCowStatus(String nodeID) async {
  //   //String adjustedCowID = nodeID.toString();
  //   print('Fetching status for Cow $nodeID');
  //
  //   try {
  //     final response = await http.get(
  //       Uri.parse(
  //           'https://8rf04mrnia.execute-api.us-east-1.amazonaws.com/$nodeID'),
  //     );
  //
  //     print('API Response Status Code: ${response.statusCode}'); // Debug print
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body) as Map<String, dynamic>;
  //       final status = data['status'] as String?;
  //       print('Cow $nodeID - Status: $status'); // Debug print
  //
  //       // Check the status and only set it if it's '0'
  //       if (status == '0') {
  //         setState(() {
  //           cowStatus[nodeID] =
  //               status ?? '0'; // Use '0' as a default value if status is null
  //         });
  //       }
  //     } else {
  //       print('API Error for Cow $nodeID: ${response.body}'); // Debug print
  //       // Handle API error for a specific cow here
  //     }
  //   } catch (e) {
  //     print('Error fetching status for Cow $nodeID: $e'); // Debug print
  //     // Handle the error gracefully (e.g., show a message to the user)
  //   }
  // }


  Future<void> fetchCowStatus(String nodeID) async {
    print('Fetching status for Cow $nodeID');

    try {
      final response = await http.get(
        Uri.parse(
            'https://8rf04mrnia.execute-api.us-east-1.amazonaws.com/$nodeID'),
      );

      print('API Response Status Code: ${response.statusCode}'); // Debug print

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final status = data['status'] as String?;
        print('Cow $nodeID - Status: $status'); // Debug print

        // Check the status and only set it if it's '0'
        if (status == '0') {
          setState(() {
            cowStatus[nodeID] =
                status ?? '0'; // Use '0' as a default value if status is null
          });
        }
      } else {
        print('API Error for Cow $nodeID: ${response.body}'); // Debug print
        // Handle API error for a specific cow here
      }
    } catch (e) {
      print('Error fetching status for Cow $nodeID: $e'); // Debug print
      // Handle the error gracefully (e.g., show a message to the user)
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

  // void updateDisplayedCowIds() {
  //   displayedCowIds.clear();
  //   final currentPageNodeIds = getCurrentPageNodeIds();
  //
  //   for (var i = 0; i < currentPageNodeIds.length; i++) {
  //     final displayedCowId = i + (currentPage * 10) + 1;
  //     displayedCowIds.add(displayedCowId);
  //   }
  // }

  void updateDisplayedCowIds() {
    displayedCowIds.clear();
    final currentPageNodeIds = getCurrentPageNodeIds();

    // Use the original cow IDs without adjustment
    displayedCowIds.addAll(currentPageNodeIds);
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
        title: Text(
          widget.appLocalizations.localizedValues['my_cows'],
          style: GoogleFonts.kalam(
            textStyle: TextStyle(
              fontSize: 20.0,
            ),
          ),
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
              style: GoogleFonts.kalam(
                textStyle: TextStyle(
                  fontSize: 14.0,
                ),
              ),
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

          double cardWidth = windowWidth / windowsPerRow;

          rowChildren.add(
            Container(
              width: cardWidth,
              padding: EdgeInsets.all(8.0),
              child: buildCustomFloatingWindow(
                nodeID: displayedCowId.toString(),
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
      double cardWidth = windowWidth;

      return Container(
        width: cardWidth,
        padding: EdgeInsets.all(8.0),
        child: buildCustomFloatingWindow(
          nodeID: displayedCowId.toString(),
          context: context,
        ),
      );
    }).toList();
  }

  // Widget buildCustomFloatingWindow({
  //   required String nodeID,
  //   required BuildContext context,
  // }) {
  //   // Calculate the adjusted cow ID (nodeID + 100)
  //   int adjustedCowID = int.parse(nodeID) ;
  //
  //   // Check the status of the cow (adjustedCowID) and set the color accordingly
  //   Color windowColor = (cowStatus[adjustedCowID.toString()] == '0')
  //       ? Colors.green
  //       : Colors.red;
  //
  //   return Card(
  //     color: windowColor,
  //     elevation: 3.5,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12.0),
  //     ),
  //     child: Column(
  //       children: [
  //         CustomFloatingWindow(
  //           nodeId: nodeID,
  //           imagePath: 'assets/images/tarantarancow1.jpeg',
  //           buttonText: widget.appLocalizations.localizedValues['click_here'],
  //           onButtonPressed: () {
  //             print('Clicked on Node ID: $nodeID');
  //             navigateToNewPage(
  //               context,
  //               adjustedCowID.toString(),
  //               widget.appLocalizations,
  //                 widget.email
  //             );
  //           },
  //           cowIdText: widget.appLocalizations.localizedValues['cow_id'],
  //           status: cowStatus[adjustedCowID.toString()] ?? '0',
  //         ),
  //       ],
  //     ),
  //   );
  // }


  // Widget buildCustomFloatingWindow({
  //   required String nodeID,
  //   required BuildContext context,
  // }) {
  //   // Use the original cow ID without adjustment
  //   int originalCowID = int.parse(nodeID);
  //
  //   // Check the status of the cow (originalCowID) and set the color accordingly
  //   Color windowColor = (cowStatus[nodeID] == '0')
  //       ? Colors.green
  //       : Colors.red;
  //
  //   return Card(
  //     color: windowColor,
  //     elevation: 3.5,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12.0),
  //     ),
  //     child: Column(
  //       children: [
  //         CustomFloatingWindow(
  //           nodeId: nodeID,
  //           imagePath: 'assets/images/tarantarancow1.jpeg',
  //           buttonText: widget.appLocalizations.localizedValues['click_here'],
  //           onButtonPressed: () {
  //             print('Clicked on Node ID: $nodeID');
  //             navigateToNewPage(
  //               context,
  //               originalCowID.toString(), // Use the original cow ID
  //               widget.appLocalizations,
  //               widget.email,
  //             );
  //           },
  //           cowIdText: widget.appLocalizations.localizedValues['cow_id'],
  //           status: cowStatus[nodeID] ?? '0',
  //         ),
  //       ],
  //     ),
  //   );
  // }


  // Widget buildCustomFloatingWindow({
  //   required String nodeID,
  //   required BuildContext context,
  // }) {
  //   // Use the original cow ID without adjustment
  //   int originalCowID = int.parse(nodeID);
  //
  //   // Check the status of the cow (originalCowID) and set the color accordingly
  //   Color windowColor = (cowStatus[nodeID] == '0')
  //       ? Colors.green
  //       : Colors.red;
  //
  //   return Card(
  //     color: windowColor,
  //     elevation: 3.5,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12.0),
  //     ),
  //     child: Column(
  //       children: [
  //         CustomFloatingWindow(
  //           nodeId: nodeID,
  //           imagePath: 'assets/images/tarantarancow1.jpeg',
  //           buttonText: widget.appLocalizations.localizedValues['click_here'],
  //           onButtonPressed: () {
  //             print('Clicked on Node ID: $nodeID');
  //             navigateToNewPage(
  //               context,
  //               originalCowID.toString(), // Use the original cow ID
  //               widget.appLocalizations,
  //               widget.email,
  //             );
  //           },
  //           cowIdText: widget.appLocalizations.localizedValues['cow_id'],
  //           status: cowStatus[nodeID] ?? '0',
  //         ),
  //       ],
  //     ),
  //   );
  // }


  // Widget buildCustomFloatingWindow({
  //   required String nodeID,
  //   required BuildContext context,
  // }) {
  //   // Use the original cow ID without adjustment
  //   int originalCowID = int.parse(nodeID);
  //
  //   // Check the status of the cow (originalCowID) and set the color accordingly
  //   Color windowColor = (cowStatus[nodeID] == '0')
  //       ? Colors.green
  //       : Colors.red;
  //
  //   return Card(
  //     color: windowColor,
  //     elevation: 3.5,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12.0),
  //     ),
  //     child: Column(
  //       children: [
  //         CustomFloatingWindow(
  //           nodeId: nodeID,
  //           imagePath: 'assets/images/tarantarancow1.jpeg',
  //           buttonText: widget.appLocalizations.localizedValues['click_here'],
  //           onButtonPressed: () {
  //             print('Clicked on Node ID: $nodeID');
  //             navigateToNewPage(
  //               context,
  //               originalCowID.toString(), // Use the original cow ID
  //               widget.appLocalizations,
  //               widget.email,
  //             );
  //           },
  //           cowIdText: widget.appLocalizations.localizedValues['cow_id'],
  //           status: cowStatus[nodeID] ?? '0',
  //         ),
  //
  //
  //       ],
  //     ),
  //   );
  // }

  // Widget buildCustomFloatingWindow({
  //   required String nodeID,
  //   required BuildContext context,
  // }) {
  //   // Use the original cow ID without adjustment
  //   int originalCowID = int.parse(nodeID);
  //
  //   // Check the status of the cow (originalCowID) and set the color accordingly
  //   Color windowColor = (cowStatus[nodeID] == '0')
  //       ? Colors.green
  //       : Colors.red;
  //
  //   return Card(
  //     color: windowColor,
  //     elevation: 3.5,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12.0),
  //     ),
  //     child: Column(
  //       children: [
  //         CustomFloatingWindow(
  //           nodeId: nodeID,
  //           imagePath: 'assets/images/tarantarancow1.jpeg',
  //           buttonText: widget.appLocalizations.localizedValues['click_here'],
  //           onButtonPressed: () {
  //             print('Clicked on Node ID: $nodeID');
  //             navigateToNewPage(
  //               context,
  //               originalCowID.toString(), // Use the original cow ID
  //               widget.appLocalizations,
  //               widget.email,
  //             );
  //           },
  //           cowIdText: widget.appLocalizations.localizedValues['cow_id'],
  //           status: cowStatus[nodeID] ?? '0',
  //         ),
  //       ],
  //     ),
  //   );
  // }


  Widget buildCustomFloatingWindow({
    required String nodeID,
    required BuildContext context,
  }) {
    // Use the original cow ID without adjustment
    int originalCowID = int.parse(nodeID);

    // Hardcode the card color to green
    Color windowColor = Colors.green;

    return Card(
      color: windowColor,
      elevation: 3.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          CustomFloatingWindow(
            nodeId: nodeID,
            imagePath: 'assets/images/tarantarancow1.jpeg',
            buttonText: widget.appLocalizations.localizedValues['click_here'],
            onButtonPressed: () {
              print('Clicked on Node ID: $nodeID');
              navigateToNewPage(
                context,
                originalCowID.toString(), // Use the original cow ID
                widget.appLocalizations,
                widget.email,
              );
            },
            cowIdText: widget.appLocalizations.localizedValues['cow_id'],
            status: cowStatus[nodeID] ?? '0',
          ),
        ],
      ),
    );
  }




  void navigateToNewPage(
      BuildContext context, String nodeID, AppLocalizations appLocalizations, String email) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewPage(
          nodeId: nodeID,
          appLocalizations: appLocalizations,
          email:email,
        ),
      ),
    );
  }
}