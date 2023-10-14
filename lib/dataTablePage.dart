// /*
//
//     Sarthak @2023
//
//  */
//
// /*
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:csv/csv.dart';
// import 'dart:html' as html;
//
// class activityData {
//   final String activityLabel;
//   final String nodeId;
//   final DateTime timestamp;
//
//   activityData({
//     required this.activityLabel,
//     required this.nodeId,
//     required this.timestamp,
//   });
//
//   factory activityData.fromJson(Map<String, dynamic> json) {
//     return activityData(
//       activityLabel: json['ActivityLabel'],
//       nodeId: json['NodeId'],
//       timestamp: DateTime.fromMillisecondsSinceEpoch(
//           int.parse(json['TimeStamp'])),
//     );
//   }
// }
//
// class DataTablePage extends StatelessWidget {
//   final List<dynamic> response;
//
//   DataTablePage({required this.response});
//
//   void _downloadCSV(BuildContext context, List<activityData> dataList) async {
//     // ... (existing _downloadCSV method content)
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<dynamic> dataList = response;
//     final List<activityData> activityDataList =
//     dataList.map((data) => activityData.fromJson(data)).toList();
//
//     // Group activities by label and consecutive timestamps
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < activityDataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(activityDataList[i]);
//       } else {
//         if (activityDataList[i].activityLabel == currentGroup.last.activityLabel &&
//             activityDataList[i].timestamp.difference(currentGroup.last.timestamp) <= Duration(minutes: 5)) {
//           currentGroup.add(activityDataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [activityDataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//         title: Text('DataTable Page'),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Text(
//               'Cow Activity Data',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     columns: [
//                       DataColumn(
//                         label: Text('NodeID'),
//                         tooltip: 'Device ID',
//                       ),
//                       DataColumn(
//                         label: Text('Timestamp'),
//                         tooltip: 'Timestamp',
//                       ),
//                       DataColumn(
//                         label: Text('Cow Activity Label'),
//                         tooltip: 'Cow Activity Label',
//                       ),
//                     ],
//                     rows: groupedActivities.map((rowActivities) {
//                       // Combine activities into a single row for the same label and consecutive timestamps
//                       String nodeId = rowActivities.map((activity) => activity.nodeId).join(', ');
//                       String timestampRange =
//                           '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
//                       String activityLabel = rowActivities.first.activityLabel;
//
//                       return DataRow(
//                         cells: [
//                           DataCell(
//                             Container(
//                               width: 50,
//                               child: Text(
//                                 nodeId,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Tooltip(
//                               message: timestampRange,
//                               child: Container(
//                                 width: 400,
//                                 child: Text(
//                                   timestampRange,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Container(
//                               width: 40,
//                               child: Text(
//                                 activityLabel,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _downloadCSV(context, activityDataList),
//         tooltip: 'Download CSV',
//         child: Icon(Icons.download),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: DataTablePage(response: []),
//   ));
// }
// */
//
// /*
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:csv/csv.dart';
// import 'dart:html' as html;
//
// class activityData {
//   final String activityLabel;
//   final String nodeId;
//   final DateTime timestamp;
//
//   activityData({
//     required this.activityLabel,
//     required this.nodeId,
//     required this.timestamp,
//   });
//
//   factory activityData.fromJson(Map<String, dynamic> json) {
//     return activityData(
//       activityLabel: json['ActivityLabel'],
//       nodeId: json['NodeId'],
//       timestamp:
//       DateTime.fromMillisecondsSinceEpoch(int.parse(json['TimeStamp'])),
//     );
//   }
// }
//
// class DataTablePage extends StatelessWidget {
//   final List<dynamic> response;
//
//   DataTablePage({required this.response});
//
//   void _downloadCSV(BuildContext context, List<activityData> dataList) async {
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < dataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(dataList[i]);
//       } else {
//         if (dataList[i].activityLabel == currentGroup.last.activityLabel &&
//             dataList[i].timestamp.difference(currentGroup.last.timestamp) <=
//                 Duration(minutes: 5)) {
//           currentGroup.add(dataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [dataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     List<List<dynamic>> dataAsListOfLists = groupedActivities.map((data) {
//       return [
//         data.first.nodeId,
//         '${data.first.timestamp} - ${data.last.timestamp}',
//         data.first.activityLabel
//       ];
//     }).toList();
//
//     List<String> columnNames = [
//       'Device ID',
//       'TimeStamp Range',
//       'Activity Label'
//     ];
//     dataAsListOfLists.insert(0, columnNames);
//
//     String csv = const ListToCsvConverter().convert(dataAsListOfLists);
//
//     if (!kIsWeb) {
//       final directory = await getExternalStorageDirectory();
//
//       if (directory != null) {
//         final file = File('${directory.path}/data.csv');
//         await file.writeAsString(csv);
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('CSV downloaded to ${file.path}'),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: Unable to access external storage.'),
//           ),
//         );
//       }
//     } else {
//       final blob = html.Blob([csv]);
//       final url = html.Url.createObjectUrlFromBlob(blob);
//
//       html.AnchorElement(href: url)
//         ..setAttribute("download", "cow_data.csv")
//         ..click();
//
//       html.Url.revokeObjectUrl(url);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('CSV download started.'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<dynamic> dataList = response;
//     final List<activityData> activityDataList =
//     dataList.map((data) => activityData.fromJson(data)).toList();
//
//     // Group activities by label and consecutive timestamps
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < activityDataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(activityDataList[i]);
//       } else {
//         if (activityDataList[i].activityLabel ==
//             currentGroup.last.activityLabel &&
//             activityDataList[i]
//                 .timestamp
//                 .difference(currentGroup.last.timestamp) <=
//                 Duration(minutes: 5)) {
//           currentGroup.add(activityDataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [activityDataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//         title: Text('DataTable Page'),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Text(
//               'Cow Activity Data',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     columns: [
//                       DataColumn(
//                         label: Text('NodeID'),
//                         tooltip: 'Device ID',
//                       ),
//                       DataColumn(
//                         label: Text('Timestamp'),
//                         tooltip: 'Timestamp',
//                       ),
//                       DataColumn(
//                         label: Text('Cow Activity Label'),
//                         tooltip: 'Cow Activity Label',
//                       ),
//                     ],
//                     rows: groupedActivities.map((rowActivities) {
//                       // Combine activities into a single row for the same label and consecutive timestamps
//                       String nodeId = rowActivities
//                           .map((activity) => activity.nodeId)
//                           .join(', ');
//                       String timestampRange =
//                           '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
//                       String activityLabel = rowActivities.first.activityLabel;
//
//                       return DataRow(
//                         cells: [
//                           DataCell(
//                             Container(
//                               width: 36,
//                               child: Text(
//                                 nodeId,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Tooltip(
//                               message: timestampRange,
//                               child: Container(
//                                 width: 400,
//                                 child: Text(
//                                   timestampRange,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Container(
//                               width: 40,
//                               child: Text(
//                                 activityLabel,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _downloadCSV(context, activityDataList),
//         tooltip: 'Download CSV',
//         child: Icon(Icons.download),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: DataTablePage(response: []),
//   ));
// }
// */
//
// /*
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:csv/csv.dart';
// import 'dart:html' as html;
//
// class activityData {
//   final String activityLabel;
//   final String nodeId;
//   final DateTime timestamp;
//
//   activityData({
//     required this.activityLabel,
//     required this.nodeId,
//     required this.timestamp,
//   });
//
//   factory activityData.fromJson(Map<String, dynamic> json) {
//     return activityData(
//       activityLabel: json['ActivityLabel'],
//       nodeId: json['NodeId'],
//       timestamp: DateTime.fromMillisecondsSinceEpoch(
//           int.parse(json['TimeStamp'])),
//     );
//   }
// }
//
// class DataTablePage extends StatelessWidget {
//   final List<dynamic> response;
//
//   DataTablePage({required this.response});
//
//   void _downloadCSV(BuildContext context, List<activityData> dataList) async {
//     // ... (existing _downloadCSV method content)
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<dynamic> dataList = response;
//     final List<activityData> activityDataList =
//     dataList.map((data) => activityData.fromJson(data)).toList();
//
//     // Group activities by label and consecutive timestamps
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < activityDataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(activityDataList[i]);
//       } else {
//         if (activityDataList[i].activityLabel == currentGroup.last.activityLabel &&
//             activityDataList[i].timestamp.difference(currentGroup.last.timestamp) <= Duration(minutes: 5)) {
//           currentGroup.add(activityDataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [activityDataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//         title: Text('DataTable Page'),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Text(
//               'Cow Activity Data',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     columns: [
//                       DataColumn(
//                         label: Text('NodeID'),
//                         tooltip: 'Device ID',
//                       ),
//                       DataColumn(
//                         label: Text('Timestamp'),
//                         tooltip: 'Timestamp',
//                       ),
//                       DataColumn(
//                         label: Text('Cow Activity Label'),
//                         tooltip: 'Cow Activity Label',
//                       ),
//                     ],
//                     rows: groupedActivities.map((rowActivities) {
//                       // Combine activities into a single row for the same label and consecutive timestamps
//                       String nodeId = rowActivities.map((activity) => activity.nodeId).join(', ');
//                       String timestampRange =
//                           '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
//                       String activityLabel = rowActivities.first.activityLabel;
//
//                       return DataRow(
//                         cells: [
//                           DataCell(
//                             Container(
//                               width: 50,
//                               child: Text(
//                                 nodeId,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Tooltip(
//                               message: timestampRange,
//                               child: Container(
//                                 width: 400,
//                                 child: Text(
//                                   timestampRange,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Container(
//                               width: 40,
//                               child: Text(
//                                 activityLabel,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _downloadCSV(context, activityDataList),
//         tooltip: 'Download CSV',
//         child: Icon(Icons.download),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: DataTablePage(response: []),
//   ));
// }
// */
//
// /*
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:csv/csv.dart';
// import 'dart:html' as html;
//
// class activityData {
//   final String activityLabel;
//   final String nodeId;
//   final DateTime timestamp;
//
//   activityData({
//     required this.activityLabel,
//     required this.nodeId,
//     required this.timestamp,
//   });
//
//   factory activityData.fromJson(Map<String, dynamic> json) {
//     return activityData(
//         activityLabel: json['ActivityLabel'],
//         nodeId: json['NodeId'],
//         timestamp: DateTime.fromMillisecondsSinceEpoch(
//           int.parse(json['TimeStamp']) * 1000,
//         ));
//   }
// }
//
// class DataTablePage extends StatelessWidget {
//   final List<dynamic> response;
//
//   DataTablePage({required this.response});
//
//   void _downloadCSV(BuildContext context, List<activityData> dataList) async {
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < dataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(dataList[i]);
//       } else {
//         if (dataList[i].activityLabel == currentGroup.last.activityLabel &&
//             dataList[i].timestamp.difference(currentGroup.last.timestamp) <=
//                 Duration(minutes: 5)) {
//           currentGroup.add(dataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [dataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     List<List<dynamic>> dataAsListOfLists = groupedActivities.map((data) {
//       return [
//         data.first.nodeId,
//         '${data.first.timestamp} - ${data.last.timestamp}',
//         data.first.activityLabel
//       ];
//     }).toList();
//
//     List<String> columnNames = [
//       'Device ID',
//       'TimeStamp Range',
//       'Activity Label'
//     ];
//     dataAsListOfLists.insert(0, columnNames);
//
//     String csv = const ListToCsvConverter().convert(dataAsListOfLists);
//
//     if (!kIsWeb) {
//       final directory = await getExternalStorageDirectory();
//
//       if (directory != null) {
//         final file = File('${directory.path}/data.csv');
//         await file.writeAsString(csv);
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('CSV downloaded to ${file.path}'),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: Unable to access external storage.'),
//           ),
//         );
//       }
//     } else {
//       final blob = html.Blob([csv]);
//       final url = html.Url.createObjectUrlFromBlob(blob);
//
//       html.AnchorElement(href: url)
//         ..setAttribute("download", "cow_data.csv")
//         ..click();
//
//       html.Url.revokeObjectUrl(url);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('CSV download started.'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<dynamic> dataList = response;
//     final List<activityData> activityDataList =
//     dataList.map((data) => activityData.fromJson(data)).toList();
//
//     // Group activities by label and consecutive timestamps
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < activityDataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(activityDataList[i]);
//       } else {
//         if (activityDataList[i].activityLabel ==
//             currentGroup.last.activityLabel &&
//             activityDataList[i]
//                 .timestamp
//                 .difference(currentGroup.last.timestamp) <=
//                 Duration(minutes: 5)) {
//           currentGroup.add(activityDataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [activityDataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//         title: Text('DataTable Page'),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Text(
//               'Cow Activity Data',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     columns: [
//                       DataColumn(
//                         label: Text('NodeID'),
//                         tooltip: 'Device ID',
//                       ),
//                       DataColumn(
//                         label: Text('Timestamp'),
//                         tooltip: 'Timestamp',
//                       ),
//                       DataColumn(
//                         label: Text('Cow Activity Label'),
//                         tooltip: 'Cow Activity Label',
//                       ),
//                     ],
//                     rows: groupedActivities.map((rowActivities) {
//                       // Combine activities into a single row for the same label and consecutive timestamps
//                       String nodeId = rowActivities
//                           .map((activity) => activity.nodeId)
//                           .join(', ');
//                       String timestampRange =
//                           '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
//                       String activityLabel = rowActivities.first.activityLabel;
//
//                       return DataRow(
//                         cells: [
//                           DataCell(
//                             Container(
//                               width: 36,
//                               child: Text(
//                                 nodeId,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Tooltip(
//                               message: timestampRange,
//                               child: Container(
//                                 width: 400,
//                                 child: Text(
//                                   timestampRange,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Container(
//                               width: 40,
//                               child: Text(
//                                 activityLabel,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _downloadCSV(context, activityDataList),
//         tooltip: 'Download CSV',
//         child: Icon(Icons.download),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: DataTablePage(response: []),
//   ));
// }
// */
//
// /*
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:csv/csv.dart';
// import 'dart:html' as html;
//
// class activityData {
//   final String activityLabel;
//   final String nodeId;
//   final DateTime timestamp;
//
//   activityData({
//     required this.activityLabel,
//     required this.nodeId,
//     required this.timestamp,
//   });
//
//   factory activityData.fromJson(Map<String, dynamic> json) {
//     return activityData(
//       activityLabel: json['ActivityLabel'],
//       nodeId: json['NodeId'],
//       timestamp: DateTime.fromMillisecondsSinceEpoch(
//           int.parse(json['TimeStamp'])),
//     );
//   }
// }
//
// class DataTablePage extends StatelessWidget {
//   final List<dynamic> response;
//
//   DataTablePage({required this.response});
//
//   void _downloadCSV(BuildContext context, List<activityData> dataList) async {
//     // ... (existing _downloadCSV method content)
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<dynamic> dataList = response;
//     final List<activityData> activityDataList =
//     dataList.map((data) => activityData.fromJson(data)).toList();
//
//     // Group activities by label and consecutive timestamps
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < activityDataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(activityDataList[i]);
//       } else {
//         if (activityDataList[i].activityLabel == currentGroup.last.activityLabel &&
//             activityDataList[i].timestamp.difference(currentGroup.last.timestamp) <= Duration(minutes: 5)) {
//           currentGroup.add(activityDataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [activityDataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//         title: Text('DataTable Page'),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Text(
//               'Cow Activity Data',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     columns: [
//                       DataColumn(
//                         label: Text('NodeID'),
//                         tooltip: 'Device ID',
//                       ),
//                       DataColumn(
//                         label: Text('Timestamp'),
//                         tooltip: 'Timestamp',
//                       ),
//                       DataColumn(
//                         label: Text('Cow Activity Label'),
//                         tooltip: 'Cow Activity Label',
//                       ),
//                     ],
//                     rows: groupedActivities.map((rowActivities) {
//                       // Combine activities into a single row for the same label and consecutive timestamps
//                       String nodeId = rowActivities.map((activity) => activity.nodeId).join(', ');
//                       String timestampRange =
//                           '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
//                       String activityLabel = rowActivities.first.activityLabel;
//
//                       return DataRow(
//                         cells: [
//                           DataCell(
//                             Container(
//                               width: 50,
//                               child: Text(
//                                 nodeId,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Tooltip(
//                               message: timestampRange,
//                               child: Container(
//                                 width: 400,
//                                 child: Text(
//                                   timestampRange,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Container(
//                               width: 40,
//                               child: Text(
//                                 activityLabel,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _downloadCSV(context, activityDataList),
//         tooltip: 'Download CSV',
//         child: Icon(Icons.download),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: DataTablePage(response: []),
//   ));
// }
// */
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:csv/csv.dart';
// import 'dart:html' as html;
// import 'package:intl/intl.dart';
// import 'main.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class activityData {
//   final String activityLabel;
//   final String nodeId;
//   final DateTime timestamp;
//
//   activityData({
//     required this.activityLabel,
//     required this.nodeId,
//     required this.timestamp,
//   });
//
//   factory activityData.fromJson(Map<String, dynamic> json) {
//     return activityData(
//         activityLabel: json['ActivityLabel'],
//         nodeId: json['NodeId'],
//         timestamp: DateTime.fromMillisecondsSinceEpoch(
//           int.parse(json['TimeStamp']) * 1000,
//         ));
//   }
// }
//
// /*
// class DataTablePage extends StatelessWidget {
//   final List<dynamic> response;
//
//   DataTablePage({required this.response});
//
//   void _downloadCSV(BuildContext context, List<activityData> dataList) async {
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < dataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(dataList[i]);
//       } else {
//         if (dataList[i].activityLabel == currentGroup.last.activityLabel) {
//           currentGroup.add(dataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [dataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     List<List<dynamic>> dataAsListOfLists = groupedActivities.map((data) {
//       return [
//         data.first.nodeId,
//         '${data.first.timestamp} - ${data.last.timestamp}',
//         data.first.activityLabel
//       ];
//     }).toList();
//
//     List<String> columnNames = [
//       'Device ID',
//       'TimeStamp Range',
//       'Activity Label'
//     ];
//     dataAsListOfLists.insert(0, columnNames);
//
//     String csv = const ListToCsvConverter().convert(dataAsListOfLists);
//
//     if (!kIsWeb) {
//       final directory = await getExternalStorageDirectory();
//
//       if (directory != null) {
//         final file = File('${directory.path}/data.csv');
//         await file.writeAsString(csv);
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('CSV downloaded to ${file.path}'),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: Unable to access external storage.'),
//           ),
//         );
//       }
//     } else {
//       final blob = html.Blob([csv]);
//       final url = html.Url.createObjectUrlFromBlob(blob);
//
//       html.AnchorElement(href: url)
//         ..setAttribute("download", "cow_data.csv")
//         ..click();
//
//       html.Url.revokeObjectUrl(url);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('CSV download started.'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<dynamic> dataList = response;
//     final List<activityData> activityDataList =
//     dataList.map((data) => activityData.fromJson(data)).toList();
//
//     // Group activities by label and consecutive timestamps
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < activityDataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(activityDataList[i]);
//       } else {
//         if (activityDataList[i].activityLabel ==
//             currentGroup.last.activityLabel) {
//           currentGroup.add(activityDataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [activityDataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//         title: Text('DataTable Page'),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Text(
//               'Cow Activity Data',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     columns: [
//                       DataColumn(
//                         label: Text('NodeID'),
//                         tooltip: 'Device ID',
//                       ),
//                       DataColumn(
//                         label: Text('Timestamp'),
//                         tooltip: 'Timestamp',
//                       ),
//                       DataColumn(
//                         label: Text('Cow Activity Label'),
//                         tooltip: 'Cow Activity Label',
//                       ),
//                     ],
//                     rows: groupedActivities.map((rowActivities) {
//                       // Combine activities into a single row for the same label and consecutive timestamps
//                       String nodeId = rowActivities
//                           .map((activity) => activity.nodeId)
//                           .join(', ');
//                       String timestampRange =
//                           '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
//                       String activityLabel = rowActivities.first.activityLabel;
//
//                       return DataRow(
//                         cells: [
//
//                           DataCell(
//                             Container(
//                               width: 36,
//                               child: Text(
//                                 nodeId,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//
//
//
//                           DataCell(
//                             Tooltip(
//                               message: timestampRange,
//                               child: Container(
//                                 width: 400,
//                                 child: Text(
//                                   timestampRange,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Container(
//                               width: 40,
//                               child: Text(
//                                 activityLabel,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _downloadCSV(context, activityDataList),
//         tooltip: 'Download CSV',
//         child: Icon(Icons.download),
//       ),
//     );
//   }
// }
// */
//
// class DataTablePage extends StatelessWidget {
//   final List<dynamic> response;
//   final AppLocalizations appLocalizations;
//
//   DataTablePage({required this.response, required this.appLocalizations});
//
//   void _downloadCSV(BuildContext context, List<activityData> dataList) async {
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < dataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(dataList[i]);
//       } else {
//         if (dataList[i].activityLabel == currentGroup.last.activityLabel) {
//           currentGroup.add(dataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [dataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     List<List<dynamic>> dataAsListOfLists = groupedActivities.map((data) {
//       return [
//         data.first.nodeId,
//         '${data.first.timestamp} - ${data.last.timestamp}',
//         data.first.activityLabel
//       ];
//     }).toList();
//
//     List<String> columnNames = [
//       'Device ID',
//       'TimeStamp Range',
//       'Activity Label'
//     ];
//     dataAsListOfLists.insert(0, columnNames);
//
//     String csv = const ListToCsvConverter().convert(dataAsListOfLists);
//
//     if (!kIsWeb) {
//       final directory = await getExternalStorageDirectory();
//
//       if (directory != null) {
//         final file = File('${directory.path}/data.csv');
//         await file.writeAsString(csv);
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('CSV downloaded to ${file.path}'),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: Unable to access external storage.'),
//           ),
//         );
//       }
//     } else {
//       final blob = html.Blob([csv]);
//       final url = html.Url.createObjectUrlFromBlob(blob);
//
//       html.AnchorElement(href: url)
//         ..setAttribute("download", "cow_data.csv")
//         ..click();
//
//       html.Url.revokeObjectUrl(url);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('CSV download started.'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<dynamic> dataList = response;
//     final List<activityData> activityDataList =
//         dataList.map((data) => activityData.fromJson(data)).toList();
//
//     // List<List<activityData>> groupedActivities = [];
//     // // ... (your grouping logic remains unchanged) ...
//
//     List<List<activityData>> groupedActivities = [];
//     List<activityData> currentGroup = [];
//     for (int i = 0; i < activityDataList.length; i++) {
//       if (currentGroup.isEmpty) {
//         currentGroup.add(activityDataList[i]);
//       } else {
//         if (activityDataList[i].activityLabel ==
//             currentGroup.last.activityLabel) {
//           currentGroup.add(activityDataList[i]);
//         } else {
//           groupedActivities.add(currentGroup);
//           currentGroup = [activityDataList[i]];
//         }
//       }
//     }
//     if (currentGroup.isNotEmpty) {
//       groupedActivities.add(currentGroup);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//         title: Text(appLocalizations.localizedValues['fetched_data'],
//           style: GoogleFonts.kalam (
//               textStyle: TextStyle(
//                 fontSize: 20.0,
//                 //color: Colors.green,
//               )),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Text(
//               appLocalizations.localizedValues['cow_activity_data'],
//               style: GoogleFonts.kalam (
//                   textStyle: TextStyle(
//                     fontSize: 18.0,
//                     //color: Colors.green,
//                   )),
//               // style: TextStyle(
//               //   fontSize: 20,
//               //   fontWeight: FontWeight.bold,
//               // ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   /*
//                   child: DataTable(
//                     columns: [
//                       DataColumn(
//                         label: Text('Timestamp'),
//                         tooltip: 'Timestamp',
//                       ),
//                       DataColumn(
//                         label: Text('Cow Activity Label'),
//                         tooltip: 'Cow Activity Label',
//                       ),
//                     ],
//                     rows: groupedActivities.map((rowActivities) {
//                       String timestampRange =
//                           '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
//                       String activityLabel = rowActivities.first.activityLabel;
//
//                       /*
//                       return DataRow(
//                         cells: [
//                           DataCell(
//                             Tooltip(
//                               message: timestampRange,
//                               child: Container(
//                                 width: 400,
//                                 child: Text(
//                                   timestampRange,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Container(
//                               width: 40,
//                               child: Text(
//                                 activityLabel,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                         ],
//                       );
//                       */
//                       /*
//                       return DataRow(
//                         cells: [
//                           DataCell(
//                             Tooltip(
//                               message: timestampRange,
//                               child: Container(
//                                 width: 400,
//                                 child: Text(
//                                   DateFormat('MM/dd/yy HH:mm:ss').format(rowActivities.first.timestamp),
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Container(
//                               width: 40,
//                               child: Text(
//                                 activityLabel,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                         ],
//                       );
//
//                       */
//
//                       return DataRow(
//                         cells: [
//                           DataCell(
//                             Tooltip(
//                               message: timestampRange,
//                               child: Container(
//                                 width: 400,
//                                 child: Text(
//                                   '${DateFormat('MM/dd/yy (dd-MM-yy) HH:mm:ss').format(rowActivities.first.timestamp)} - ${DateFormat('MM/dd/yy (dd-MM-yy) HH:mm:ss').format(rowActivities.last.timestamp)}',
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Container(
//                               width: 40,
//                               child: Text(
//                                 activityLabel,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                         ],
//                       );
//
//
//                     }).toList(),
//                   ),
//                   */
//
//                   child:
//
//                       // DataTable(
//                       //   columns: [
//                       //     DataColumn(
//                       //       label: Text('Start Timestamp'),
//                       //       tooltip: 'Start Timestamp',
//                       //     ),
//                       //     DataColumn(
//                       //       label: Text('End Timestamp'),
//                       //       tooltip: 'End Timestamp',
//                       //     ),
//                       //     DataColumn(
//                       //       label: Text('Cow Activity Label'),
//                       //       tooltip: 'Cow Activity Label',
//                       //     ),
//                       //   ],
//                       //
//
//                       DataTable(
//                     dataRowHeight: 40.0, // Set the height of each DataRow
//                     dividerThickness: 2.0, // Set the thickness of the dividers
//                     columns: [
//                       DataColumn(
//                         label: Text(appLocalizations
//                             .localizedValues['start_timestamp'],
//                           style: GoogleFonts.kalam (
//                               textStyle: TextStyle(
//                                 fontSize: 14.0,
//                                 //color: Colors.green,
//                               )),
//                         ),
//                         tooltip:
//                             appLocalizations.localizedValues['start_timestamp'],
//                       ),
//                       DataColumn(
//                         label: Text(
//                             appLocalizations.localizedValues['end_timestamp'],
//                           style: GoogleFonts.kalam (
//                               textStyle: TextStyle(
//                                 fontSize: 14.0,
//                                 //color: Colors.green,
//                               )),
//                         ),
//                         tooltip:
//                             appLocalizations.localizedValues['end_timestamp'],
//                       ),
//                       DataColumn(
//                         label:
//                             Text(appLocalizations.localizedValues['activity'],
//                               style: GoogleFonts.kalam (
//                                   textStyle: TextStyle(
//                                     fontSize: 14.0,
//                                     //color: Colors.green,
//                                   )),
//                             ),
//                         tooltip: appLocalizations.localizedValues['activity'],
//                       ),
//                     ],
//
//                     rows: groupedActivities.map((rowActivities) {
//                       String startTimestamp = DateFormat('HH:mm:ss (dd/MM/yy)')
//                           .format(rowActivities.first.timestamp);
//                       String endTimestamp = DateFormat('HH:mm:ss (dd/MM/yy)')
//                           .format(rowActivities.last.timestamp);
//                       String activityLabel = rowActivities.first.activityLabel;
//
//                       return DataRow(
//                         cells: [
//                           DataCell(
//                             Tooltip(
//                               message: startTimestamp,
//                               child: Container(
//                                 width: 140,
//                                 child: Text(
//                                   startTimestamp,
//                                   overflow: TextOverflow.ellipsis,
//                                   // style: TextStyle(
//                                   //   fontSize: 15,
//                                   // ),
//                                   style: GoogleFonts.kalam (
//                                       textStyle: TextStyle(
//                                         fontSize: 14.0,
//                                         //color: Colors.green,
//                                       )),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Tooltip(
//                               message: endTimestamp,
//                               child: Container(
//                                 width: 140,
//                                 child: Text(
//                                   endTimestamp,
//                                   overflow: TextOverflow.ellipsis,
//                                   // style: TextStyle(
//                                   //   fontSize: 15,
//                                   // ),
//                                   style: GoogleFonts.kalam (
//                                       textStyle: TextStyle(
//                                         fontSize: 14.0,
//                                         //color: Colors.green,
//                                       )),
//                                 ),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                           DataCell(
//                             Container(
//                               width: 40,
//                               child: Text(
//                                 activityLabel,
//                                 overflow: TextOverflow.ellipsis,
//                                 // style: TextStyle(
//                                 //   fontSize: 15,
//                                 // ),
//                                 style: GoogleFonts.kalam (
//                                     textStyle: TextStyle(
//                                       fontSize: 14.0,
//                                       //color: Colors.green,
//                                     )),
//                               ),
//                             ),
//                             showEditIcon: false,
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _downloadCSV(context, activityDataList),
//         tooltip: 'Download CSV',
//         child: Icon(Icons.download),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: DataTablePage(response: [], appLocalizations: AppLocalizations()),
//   ));
// }

/*

    Sarthak @2023

 */

/*

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'dart:html' as html;

class activityData {
  final String activityLabel;
  final String nodeId;
  final DateTime timestamp;

  activityData({
    required this.activityLabel,
    required this.nodeId,
    required this.timestamp,
  });

  factory activityData.fromJson(Map<String, dynamic> json) {
    return activityData(
      activityLabel: json['ActivityLabel'],
      nodeId: json['NodeId'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['TimeStamp'])),
    );
  }
}

class DataTablePage extends StatelessWidget {
  final List<dynamic> response;

  DataTablePage({required this.response});

  void _downloadCSV(BuildContext context, List<activityData> dataList) async {
    // ... (existing _downloadCSV method content)
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> dataList = response;
    final List<activityData> activityDataList =
    dataList.map((data) => activityData.fromJson(data)).toList();

    // Group activities by label and consecutive timestamps
    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < activityDataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(activityDataList[i]);
      } else {
        if (activityDataList[i].activityLabel == currentGroup.last.activityLabel &&
            activityDataList[i].timestamp.difference(currentGroup.last.timestamp) <= Duration(minutes: 5)) {
          currentGroup.add(activityDataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [activityDataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('DataTable Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Cow Activity Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('NodeID'),
                        tooltip: 'Device ID',
                      ),
                      DataColumn(
                        label: Text('Timestamp'),
                        tooltip: 'Timestamp',
                      ),
                      DataColumn(
                        label: Text('Cow Activity Label'),
                        tooltip: 'Cow Activity Label',
                      ),
                    ],
                    rows: groupedActivities.map((rowActivities) {
                      // Combine activities into a single row for the same label and consecutive timestamps
                      String nodeId = rowActivities.map((activity) => activity.nodeId).join(', ');
                      String timestampRange =
                          '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
                      String activityLabel = rowActivities.first.activityLabel;

                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              width: 50,
                              child: Text(
                                nodeId,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Tooltip(
                              message: timestampRange,
                              child: Container(
                                width: 400,
                                child: Text(
                                  timestampRange,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                activityLabel,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _downloadCSV(context, activityDataList),
        tooltip: 'Download CSV',
        child: Icon(Icons.download),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DataTablePage(response: []),
  ));
}
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'dart:html' as html;

class activityData {
  final String activityLabel;
  final String nodeId;
  final DateTime timestamp;

  activityData({
    required this.activityLabel,
    required this.nodeId,
    required this.timestamp,
  });

  factory activityData.fromJson(Map<String, dynamic> json) {
    return activityData(
      activityLabel: json['ActivityLabel'],
      nodeId: json['NodeId'],
      timestamp:
      DateTime.fromMillisecondsSinceEpoch(int.parse(json['TimeStamp'])),
    );
  }
}

class DataTablePage extends StatelessWidget {
  final List<dynamic> response;

  DataTablePage({required this.response});

  void _downloadCSV(BuildContext context, List<activityData> dataList) async {
    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < dataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(dataList[i]);
      } else {
        if (dataList[i].activityLabel == currentGroup.last.activityLabel &&
            dataList[i].timestamp.difference(currentGroup.last.timestamp) <=
                Duration(minutes: 5)) {
          currentGroup.add(dataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [dataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    List<List<dynamic>> dataAsListOfLists = groupedActivities.map((data) {
      return [
        data.first.nodeId,
        '${data.first.timestamp} - ${data.last.timestamp}',
        data.first.activityLabel
      ];
    }).toList();

    List<String> columnNames = [
      'Device ID',
      'TimeStamp Range',
      'Activity Label'
    ];
    dataAsListOfLists.insert(0, columnNames);

    String csv = const ListToCsvConverter().convert(dataAsListOfLists);

    if (!kIsWeb) {
      final directory = await getExternalStorageDirectory();

      if (directory != null) {
        final file = File('${directory.path}/data.csv');
        await file.writeAsString(csv);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('CSV downloaded to ${file.path}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: Unable to access external storage.'),
          ),
        );
      }
    } else {
      final blob = html.Blob([csv]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      html.AnchorElement(href: url)
        ..setAttribute("download", "cow_data.csv")
        ..click();

      html.Url.revokeObjectUrl(url);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('CSV download started.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> dataList = response;
    final List<activityData> activityDataList =
    dataList.map((data) => activityData.fromJson(data)).toList();

    // Group activities by label and consecutive timestamps
    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < activityDataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(activityDataList[i]);
      } else {
        if (activityDataList[i].activityLabel ==
            currentGroup.last.activityLabel &&
            activityDataList[i]
                .timestamp
                .difference(currentGroup.last.timestamp) <=
                Duration(minutes: 5)) {
          currentGroup.add(activityDataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [activityDataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('DataTable Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Cow Activity Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('NodeID'),
                        tooltip: 'Device ID',
                      ),
                      DataColumn(
                        label: Text('Timestamp'),
                        tooltip: 'Timestamp',
                      ),
                      DataColumn(
                        label: Text('Cow Activity Label'),
                        tooltip: 'Cow Activity Label',
                      ),
                    ],
                    rows: groupedActivities.map((rowActivities) {
                      // Combine activities into a single row for the same label and consecutive timestamps
                      String nodeId = rowActivities
                          .map((activity) => activity.nodeId)
                          .join(', ');
                      String timestampRange =
                          '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
                      String activityLabel = rowActivities.first.activityLabel;

                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              width: 36,
                              child: Text(
                                nodeId,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Tooltip(
                              message: timestampRange,
                              child: Container(
                                width: 400,
                                child: Text(
                                  timestampRange,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                activityLabel,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _downloadCSV(context, activityDataList),
        tooltip: 'Download CSV',
        child: Icon(Icons.download),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DataTablePage(response: []),
  ));
}
*/

/*

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'dart:html' as html;

class activityData {
  final String activityLabel;
  final String nodeId;
  final DateTime timestamp;

  activityData({
    required this.activityLabel,
    required this.nodeId,
    required this.timestamp,
  });

  factory activityData.fromJson(Map<String, dynamic> json) {
    return activityData(
      activityLabel: json['ActivityLabel'],
      nodeId: json['NodeId'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['TimeStamp'])),
    );
  }
}

class DataTablePage extends StatelessWidget {
  final List<dynamic> response;

  DataTablePage({required this.response});

  void _downloadCSV(BuildContext context, List<activityData> dataList) async {
    // ... (existing _downloadCSV method content)
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> dataList = response;
    final List<activityData> activityDataList =
    dataList.map((data) => activityData.fromJson(data)).toList();

    // Group activities by label and consecutive timestamps
    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < activityDataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(activityDataList[i]);
      } else {
        if (activityDataList[i].activityLabel == currentGroup.last.activityLabel &&
            activityDataList[i].timestamp.difference(currentGroup.last.timestamp) <= Duration(minutes: 5)) {
          currentGroup.add(activityDataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [activityDataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('DataTable Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Cow Activity Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('NodeID'),
                        tooltip: 'Device ID',
                      ),
                      DataColumn(
                        label: Text('Timestamp'),
                        tooltip: 'Timestamp',
                      ),
                      DataColumn(
                        label: Text('Cow Activity Label'),
                        tooltip: 'Cow Activity Label',
                      ),
                    ],
                    rows: groupedActivities.map((rowActivities) {
                      // Combine activities into a single row for the same label and consecutive timestamps
                      String nodeId = rowActivities.map((activity) => activity.nodeId).join(', ');
                      String timestampRange =
                          '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
                      String activityLabel = rowActivities.first.activityLabel;

                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              width: 50,
                              child: Text(
                                nodeId,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Tooltip(
                              message: timestampRange,
                              child: Container(
                                width: 400,
                                child: Text(
                                  timestampRange,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                activityLabel,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _downloadCSV(context, activityDataList),
        tooltip: 'Download CSV',
        child: Icon(Icons.download),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DataTablePage(response: []),
  ));
}
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'dart:html' as html;

class activityData {
  final String activityLabel;
  final String nodeId;
  final DateTime timestamp;

  activityData({
    required this.activityLabel,
    required this.nodeId,
    required this.timestamp,
  });

  factory activityData.fromJson(Map<String, dynamic> json) {
    return activityData(
        activityLabel: json['ActivityLabel'],
        nodeId: json['NodeId'],
        timestamp: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['TimeStamp']) * 1000,
        ));
  }
}

class DataTablePage extends StatelessWidget {
  final List<dynamic> response;

  DataTablePage({required this.response});

  void _downloadCSV(BuildContext context, List<activityData> dataList) async {
    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < dataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(dataList[i]);
      } else {
        if (dataList[i].activityLabel == currentGroup.last.activityLabel &&
            dataList[i].timestamp.difference(currentGroup.last.timestamp) <=
                Duration(minutes: 5)) {
          currentGroup.add(dataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [dataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    List<List<dynamic>> dataAsListOfLists = groupedActivities.map((data) {
      return [
        data.first.nodeId,
        '${data.first.timestamp} - ${data.last.timestamp}',
        data.first.activityLabel
      ];
    }).toList();

    List<String> columnNames = [
      'Device ID',
      'TimeStamp Range',
      'Activity Label'
    ];
    dataAsListOfLists.insert(0, columnNames);

    String csv = const ListToCsvConverter().convert(dataAsListOfLists);

    if (!kIsWeb) {
      final directory = await getExternalStorageDirectory();

      if (directory != null) {
        final file = File('${directory.path}/data.csv');
        await file.writeAsString(csv);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('CSV downloaded to ${file.path}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: Unable to access external storage.'),
          ),
        );
      }
    } else {
      final blob = html.Blob([csv]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      html.AnchorElement(href: url)
        ..setAttribute("download", "cow_data.csv")
        ..click();

      html.Url.revokeObjectUrl(url);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('CSV download started.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> dataList = response;
    final List<activityData> activityDataList =
    dataList.map((data) => activityData.fromJson(data)).toList();

    // Group activities by label and consecutive timestamps
    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < activityDataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(activityDataList[i]);
      } else {
        if (activityDataList[i].activityLabel ==
            currentGroup.last.activityLabel &&
            activityDataList[i]
                .timestamp
                .difference(currentGroup.last.timestamp) <=
                Duration(minutes: 5)) {
          currentGroup.add(activityDataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [activityDataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('DataTable Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Cow Activity Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('NodeID'),
                        tooltip: 'Device ID',
                      ),
                      DataColumn(
                        label: Text('Timestamp'),
                        tooltip: 'Timestamp',
                      ),
                      DataColumn(
                        label: Text('Cow Activity Label'),
                        tooltip: 'Cow Activity Label',
                      ),
                    ],
                    rows: groupedActivities.map((rowActivities) {
                      // Combine activities into a single row for the same label and consecutive timestamps
                      String nodeId = rowActivities
                          .map((activity) => activity.nodeId)
                          .join(', ');
                      String timestampRange =
                          '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
                      String activityLabel = rowActivities.first.activityLabel;

                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              width: 36,
                              child: Text(
                                nodeId,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Tooltip(
                              message: timestampRange,
                              child: Container(
                                width: 400,
                                child: Text(
                                  timestampRange,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                activityLabel,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _downloadCSV(context, activityDataList),
        tooltip: 'Download CSV',
        child: Icon(Icons.download),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DataTablePage(response: []),
  ));
}
*/

/*

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'dart:html' as html;

class activityData {
  final String activityLabel;
  final String nodeId;
  final DateTime timestamp;

  activityData({
    required this.activityLabel,
    required this.nodeId,
    required this.timestamp,
  });

  factory activityData.fromJson(Map<String, dynamic> json) {
    return activityData(
      activityLabel: json['ActivityLabel'],
      nodeId: json['NodeId'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['TimeStamp'])),
    );
  }
}

class DataTablePage extends StatelessWidget {
  final List<dynamic> response;

  DataTablePage({required this.response});

  void _downloadCSV(BuildContext context, List<activityData> dataList) async {
    // ... (existing _downloadCSV method content)
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> dataList = response;
    final List<activityData> activityDataList =
    dataList.map((data) => activityData.fromJson(data)).toList();

    // Group activities by label and consecutive timestamps
    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < activityDataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(activityDataList[i]);
      } else {
        if (activityDataList[i].activityLabel == currentGroup.last.activityLabel &&
            activityDataList[i].timestamp.difference(currentGroup.last.timestamp) <= Duration(minutes: 5)) {
          currentGroup.add(activityDataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [activityDataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('DataTable Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Cow Activity Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('NodeID'),
                        tooltip: 'Device ID',
                      ),
                      DataColumn(
                        label: Text('Timestamp'),
                        tooltip: 'Timestamp',
                      ),
                      DataColumn(
                        label: Text('Cow Activity Label'),
                        tooltip: 'Cow Activity Label',
                      ),
                    ],
                    rows: groupedActivities.map((rowActivities) {
                      // Combine activities into a single row for the same label and consecutive timestamps
                      String nodeId = rowActivities.map((activity) => activity.nodeId).join(', ');
                      String timestampRange =
                          '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
                      String activityLabel = rowActivities.first.activityLabel;

                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              width: 50,
                              child: Text(
                                nodeId,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Tooltip(
                              message: timestampRange,
                              child: Container(
                                width: 400,
                                child: Text(
                                  timestampRange,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                activityLabel,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _downloadCSV(context, activityDataList),
        tooltip: 'Download CSV',
        child: Icon(Icons.download),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DataTablePage(response: []),
  ));
}
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:csv/csv.dart';
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'main.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class activityData {
  final String activityLabel;
  final String nodeId;
  final DateTime timestamp;

  activityData({
    required this.activityLabel,
    required this.nodeId,
    required this.timestamp,
  });

  factory activityData.fromJson(Map<String, dynamic> json) {
    return activityData(
        activityLabel: json['ActivityLabel'],
        nodeId: json['NodeId'],
        timestamp: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['TimeStamp']) * 1000,
        ));
  }
}

/*
class DataTablePage extends StatelessWidget {
  final List<dynamic> response;

  DataTablePage({required this.response});

  void _downloadCSV(BuildContext context, List<activityData> dataList) async {
    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < dataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(dataList[i]);
      } else {
        if (dataList[i].activityLabel == currentGroup.last.activityLabel) {
          currentGroup.add(dataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [dataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    List<List<dynamic>> dataAsListOfLists = groupedActivities.map((data) {
      return [
        data.first.nodeId,
        '${data.first.timestamp} - ${data.last.timestamp}',
        data.first.activityLabel
      ];
    }).toList();

    List<String> columnNames = [
      'Device ID',
      'TimeStamp Range',
      'Activity Label'
    ];
    dataAsListOfLists.insert(0, columnNames);

    String csv = const ListToCsvConverter().convert(dataAsListOfLists);

    if (!kIsWeb) {
      final directory = await getExternalStorageDirectory();

      if (directory != null) {
        final file = File('${directory.path}/data.csv');
        await file.writeAsString(csv);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('CSV downloaded to ${file.path}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: Unable to access external storage.'),
          ),
        );
      }
    } else {
      final blob = html.Blob([csv]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      html.AnchorElement(href: url)
        ..setAttribute("download", "cow_data.csv")
        ..click();

      html.Url.revokeObjectUrl(url);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('CSV download started.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> dataList = response;
    final List<activityData> activityDataList =
    dataList.map((data) => activityData.fromJson(data)).toList();

    // Group activities by label and consecutive timestamps
    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < activityDataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(activityDataList[i]);
      } else {
        if (activityDataList[i].activityLabel ==
            currentGroup.last.activityLabel) {
          currentGroup.add(activityDataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [activityDataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('DataTable Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Cow Activity Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('NodeID'),
                        tooltip: 'Device ID',
                      ),
                      DataColumn(
                        label: Text('Timestamp'),
                        tooltip: 'Timestamp',
                      ),
                      DataColumn(
                        label: Text('Cow Activity Label'),
                        tooltip: 'Cow Activity Label',
                      ),
                    ],
                    rows: groupedActivities.map((rowActivities) {
                      // Combine activities into a single row for the same label and consecutive timestamps
                      String nodeId = rowActivities
                          .map((activity) => activity.nodeId)
                          .join(', ');
                      String timestampRange =
                          '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
                      String activityLabel = rowActivities.first.activityLabel;

                      return DataRow(
                        cells: [

                          DataCell(
                            Container(
                              width: 36,
                              child: Text(
                                nodeId,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),



                          DataCell(
                            Tooltip(
                              message: timestampRange,
                              child: Container(
                                width: 400,
                                child: Text(
                                  timestampRange,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                activityLabel,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _downloadCSV(context, activityDataList),
        tooltip: 'Download CSV',
        child: Icon(Icons.download),
      ),
    );
  }
}
*/

class DataTablePage extends StatelessWidget {
  final List<dynamic> response;
  final AppLocalizations appLocalizations;
  final String nodeId;

  DataTablePage(
      {required this.response,
      required this.appLocalizations,
      required this.nodeId});

  void _downloadCSV(BuildContext context, List<activityData> dataList) async {
    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < dataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(dataList[i]);
      } else {
        if (dataList[i].activityLabel == currentGroup.last.activityLabel) {
          currentGroup.add(dataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [dataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    List<List<dynamic>> dataAsListOfLists = groupedActivities.map((data) {
      return [
        data.first.nodeId,
        '${data.first.timestamp} - ${data.last.timestamp}',
        data.first.activityLabel
      ];
    }).toList();

    List<String> columnNames = [
      'Device ID',
      'TimeStamp Range',
      'Activity Label'
    ];
    dataAsListOfLists.insert(0, columnNames);

    String csv = const ListToCsvConverter().convert(dataAsListOfLists);

    if (!kIsWeb) {
      final directory = await getExternalStorageDirectory();

      if (directory != null) {
        final file = File('${directory.path}/data.csv');
        await file.writeAsString(csv);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('CSV downloaded to ${file.path}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: Unable to access external storage.'),
          ),
        );
      }
    } else {
      final blob = html.Blob([csv]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      html.AnchorElement(href: url)
        ..setAttribute("download", "cow_data.csv")
        ..click();

      html.Url.revokeObjectUrl(url);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('CSV download started.'),
        ),
      );
    }
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr' +
        'hour ' +
        '$minutesStr' +
        'min ' +
        '$secondsStr' +
        'sec';
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> dataList = response;
    final List<activityData> activityDataList =
        dataList.map((data) => activityData.fromJson(data)).toList();

    // List<List<activityData>> groupedActivities = [];
    // // ... (your grouping logic remains unchanged) ...

    String nodeIdValue = nodeId;

    List<List<activityData>> groupedActivities = [];
    List<activityData> currentGroup = [];
    for (int i = 0; i < activityDataList.length; i++) {
      if (currentGroup.isEmpty) {
        currentGroup.add(activityDataList[i]);
      } else {
        if (activityDataList[i].activityLabel ==
                currentGroup.first.activityLabel &&
            activityDataList[i]
                    .timestamp
                    .difference(currentGroup.first.timestamp) <=
                Duration(hours: 3)) {
          currentGroup.add(activityDataList[i]);
        } else {
          groupedActivities.add(currentGroup);
          currentGroup = [activityDataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add(currentGroup);
    }

    //total time claculation
    List<Map<String, dynamic>> activityTimeList =
        List<Map<String, dynamic>>.from(response);

    Map<String, int> totalActivityTimes = {};
    if (activityTimeList.length == 1) {
      totalActivityTimes.update(
          activityTimeList[0]['ActivityLabel'], (value) => 1,
          ifAbsent: () => 1);
    }
    for (int i = 0; i < activityTimeList.length - 1; i++) {
      if (activityTimeList[i]['ActivityLabel'] ==
          activityTimeList[i + 1]['ActivityLabel']) {
        int startTime = int.parse(activityTimeList[i]['TimeStamp']);
        int endTime = int.parse(activityTimeList[i + 1]['TimeStamp']);
        int duration = endTime - startTime;
        totalActivityTimes.update(
            activityTimeList[i]['ActivityLabel'], (value) => value + duration,
            ifAbsent: () => duration);
      } else {
        int startTime = int.parse(activityTimeList[i]['TimeStamp']);
        int endTime = int.parse(activityTimeList[i]['TimeStamp']);
        int duration = endTime - startTime;
        if (i == 0) {
          duration = duration + 1;
        } else if (activityTimeList[i]['ActivityLabel'] !=
            activityTimeList[i - 1]['ActivityLabel']) {
          duration = duration + 1;
        }
        totalActivityTimes.update(
            activityTimeList[i]['ActivityLabel'], (value) => value + duration,
            ifAbsent: () => duration);
      }
    }

    totalActivityTimes.forEach((activityLabel, totalTime) {
      print('ActivityLabel: $activityLabel, Total Time: ${totalTime} seconds');
    });

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          appLocalizations.localizedValues['fetched_data'],
          style: GoogleFonts.kalam(
              textStyle: TextStyle(
            fontSize: 20.0,
            //color: Colors.white,
          )),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              appLocalizations.localizedValues['cow_activity_data'] +
                  ' ( ' +
                  appLocalizations.localizedValues['cow_id'] +
                  ' : $nodeIdValue )',
              style: GoogleFonts.kalam(
                  textStyle: TextStyle(
                fontSize: 20.0,
                //color: Colors.white,
              )),
            ),
            SizedBox(height: 20),
            // Display total activity times above the table
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Set the border color
                    width: 1.0, // Set the border width
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(
                      15), // Add rounded corners (optional)
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text(
                          appLocalizations.localizedValues['activity'],
                          style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          appLocalizations.localizedValues['time'],
                          style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                    rows: totalActivityTimes.entries.map((entry) {
                      String activityLabel = entry.key;
                      int totalTime = entry.value;
                      String formattedTime = formatTime(totalTime);

                      return DataRow(
                        cells: [
                          DataCell(
                            Text(
                              activityLabel,
                              style: GoogleFonts.kalam(
                                textStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              formattedTime,
                              style: GoogleFonts.kalam(
                                textStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              /*
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('Timestamp'),
                        tooltip: 'Timestamp',
                      ),
                      DataColumn(
                        label: Text('Cow Activity Label'),
                        tooltip: 'Cow Activity Label',
                      ),
                    ],
                    rows: groupedActivities.map((rowActivities) {
                      String timestampRange =
                          '${rowActivities.first.timestamp} - ${rowActivities.last.timestamp}';
                      String activityLabel = rowActivities.first.activityLabel;

                      /*
                      return DataRow(
                        cells: [
                          DataCell(
                            Tooltip(
                              message: timestampRange,
                              child: Container(
                                width: 400,
                                child: Text(
                                  timestampRange,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                activityLabel,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                        ],
                      );
                      */
                      /*
                      return DataRow(
                        cells: [
                          DataCell(
                            Tooltip(
                              message: timestampRange,
                              child: Container(
                                width: 400,
                                child: Text(
                                  DateFormat('MM/dd/yy HH:mm:ss').format(rowActivities.first.timestamp),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                activityLabel,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                        ],
                      );

                      */

                      return DataRow(
                        cells: [
                          DataCell(
                            Tooltip(
                              message: timestampRange,
                              child: Container(
                                width: 400,
                                child: Text(
                                  '${DateFormat('MM/dd/yy (dd-MM-yy) HH:mm:ss').format(rowActivities.first.timestamp)} - ${DateFormat('MM/dd/yy (dd-MM-yy) HH:mm:ss').format(rowActivities.last.timestamp)}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                activityLabel,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                        ],
                      );


                    }).toList(),
                  ),
                  */

              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Set the border color
                    width: 1.0, // Set the border width
                  ),
                  borderRadius: BorderRadius.circular(
                      10), // Add rounded corners (optional)
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataRowHeight: 40.0, // Set the height of each DataRow
                      dividerThickness:
                          2.0, // Set the thickness of the dividers
                      columns: [
                        DataColumn(
                          label: Text(
                            appLocalizations.localizedValues['start_timestamp'],
                            style: GoogleFonts.kalam(
                                textStyle: TextStyle(
                              fontSize: 16.0,
                              //color: Colors.white,
                            )),
                          ),
                          tooltip: appLocalizations
                              .localizedValues['start_timestamp'],
                        ),
                        DataColumn(
                          label: Text(
                            appLocalizations.localizedValues['end_timestamp'],
                            style: GoogleFonts.kalam(
                                textStyle: TextStyle(
                              fontSize: 16.0,
                              //color: Colors.white,
                            )),
                          ),
                          tooltip:
                              appLocalizations.localizedValues['end_timestamp'],
                        ),
                        DataColumn(
                          label: Text(
                            appLocalizations.localizedValues['activity'],
                            style: GoogleFonts.kalam(
                                textStyle: TextStyle(
                              fontSize: 16.0,
                              //color: Colors.white,
                            )),
                          ),
                          tooltip: appLocalizations.localizedValues['activity'],
                        ),
                      ],

                      rows: groupedActivities.map((rowActivities) {
                        String startTimestamp =
                            DateFormat('HH:mm:ss (dd/MM/yy)')
                                .format(rowActivities.first.timestamp);
                        String endTimestamp = DateFormat('HH:mm:ss (dd/MM/yy)')
                            .format(rowActivities.last.timestamp);
                        String activityLabel =
                            rowActivities.first.activityLabel;

                        return DataRow(
                          cells: [
                            DataCell(
                              Tooltip(
                                message: startTimestamp,
                                child: Container(
                                  width: 140,
                                  child: Text(
                                    startTimestamp,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.kalam(
                                        textStyle: TextStyle(
                                      fontSize: 14.0,
                                      //color: Colors.white,
                                    )),
                                  ),
                                ),
                              ),
                              showEditIcon: false,
                            ),
                            DataCell(
                              Tooltip(
                                message: endTimestamp,
                                child: Container(
                                  width: 140,
                                  child: Text(
                                    endTimestamp,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.kalam(
                                        textStyle: TextStyle(
                                      fontSize: 14.0,
                                      //color: Colors.white,
                                    )),
                                  ),
                                ),
                              ),
                              showEditIcon: false,
                            ),
                            DataCell(
                              Container(
                                width: 40,
                                child: Text(
                                  activityLabel,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.kalam(
                                      textStyle: TextStyle(
                                    fontSize: 14.0,
                                    //color: Colors.white,
                                  )),
                                ),
                              ),
                              showEditIcon: false,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _downloadCSV(context, activityDataList),
        tooltip: 'Download CSV',
        child: Icon(Icons.download),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DataTablePage(
        response: [], appLocalizations: AppLocalizations(), nodeId: ''),
  ));
}
