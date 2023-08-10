
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

void main() {
  runApp(MaterialApp(
    home: DataTablePage(response: []),
  ));
}
