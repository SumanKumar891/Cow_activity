/*
Sarthak@2023
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
import 'package:fl_chart/fl_chart.dart';





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

class AiDataForm extends StatefulWidget {
  @override
  _AiDataFormState createState() => _AiDataFormState();
}

//
// class _AiDataFormState extends State<AiDataForm> {
//   TextEditingController bullIdController = TextEditingController();
//   TextEditingController aiDateController = TextEditingController();
//   String selectedDataOfAi = '';
//   String milkProductionFrequency = '';
//   TextEditingController nextHeatDateController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Enter AI Data Form"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: bullIdController,
//               decoration: InputDecoration(labelText: 'Bull ID'),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       _selectDate(context, aiDateController);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.calendar_today),
//                         SizedBox(width: 8.0),
//                         Text(
//                           aiDateController.text.isNotEmpty
//                               ? aiDateController.text
//                               : 'Select Date of AI',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             Text('Select Data of AI:'),
//             // Add your code for selecting AI data (e.g., dropdown or radio buttons)
//             SizedBox(height: 16),
//             Text('Milk Production:'),
//             Row(
//               children: [
//                 Radio(
//                   value: 'daily',
//                   groupValue: milkProductionFrequency,
//                   onChanged: (value) {
//                     setState(() {
//                       milkProductionFrequency = value.toString();
//                     });
//                   },
//                 ),
//                 Text('Daily'),
//                 Radio(
//                   value: 'weekly',
//                   groupValue: milkProductionFrequency,
//                   onChanged: (value) {
//                     setState(() {
//                       milkProductionFrequency = value.toString();
//                     });
//                   },
//                 ),
//                 Text('Weekly'),
//                 Radio(
//                   value: 'monthly',
//                   groupValue: milkProductionFrequency,
//                   onChanged: (value) {
//                     setState(() {
//                       milkProductionFrequency = value.toString();
//                     });
//                   },
//                 ),
//                 Text('Monthly'),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Next Heat Date: ${calculateNextHeatDate()}',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 _submitForm();
//                 Navigator.pop(context); // Navigate back to the previous screen
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _selectDate(
//       BuildContext context, TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         controller.text = '${DateFormat('dd/MM/yyyy').format(picked)}';
//       });
//     }
//   }
//
//   void _submitForm() {
//     // Implement the logic for submitting the form data
//     print('Bull ID: ${bullIdController.text}');
//     print('Date of AI: ${aiDateController.text}');
//     print('Data of AI: $selectedDataOfAi');
//     print('Milk Production: $milkProductionFrequency');
//     print('Next Heat Date: ${nextHeatDateController.text}');
//   }
//
//   // String calculateNextHeatDate() {
//   //   DateTime? selectedDate = DateFormat('dd/MM/yyyy').parse(aiDateController.text, true);
//   //   if (selectedDate != null) {
//   //     DateTime nextHeatDate = selectedDate.add(Duration(days: 21));
//   //     return DateFormat('dd/MM/yyyy').format(nextHeatDate);
//   //   }
//   //   return 'Invalid Date';
//   // }
//
//   String calculateNextHeatDate() {
//     if (aiDateController.text.isEmpty) {
//       return 'Select Date of AI first';
//     }
//
//     try {
//       DateTime selectedDate = DateFormat('dd/MM/yyyy').parse(aiDateController.text);
//       DateTime nextHeatDate = selectedDate.add(Duration(days: 21));
//       return DateFormat('dd/MM/yyyy').format(nextHeatDate);
//     } catch (e) {
//       return 'Invalid Date Format';
//     }
//   }
//
//
// }



class _AiDataFormState extends State<AiDataForm> {
  TextEditingController bullIdController = TextEditingController();
  TextEditingController aiDateController = TextEditingController();
  TextEditingController milkProductionController = TextEditingController();
  String selectedDataOfAi = '';
  TextEditingController nextHeatDateController = TextEditingController();
  String selectedFrequency = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter AI Data Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: bullIdController,
              decoration: InputDecoration(labelText: 'Enter Bull ID'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _selectDate(context, aiDateController);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 8.0),
                        Text(
                          aiDateController.text.isNotEmpty
                              ? aiDateController.text
                              : 'Select Date of AI',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Select Data of AI:'),
            // Add your code for selecting AI data (e.g., dropdown or radio buttons)
            SizedBox(height: 16),
            // TextField(
            //   controller: milkProductionController,
            //   decoration: InputDecoration(labelText: 'Milk Production'),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter Milk production '),
                SizedBox(height: 8),
                TextField(
                  controller: milkProductionController,
                  decoration: InputDecoration(labelText: 'Enter'),
                ),
              ],
            ),

            SizedBox(height: 16),

// Row for Frequency selection
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Frequency:'),
                SizedBox(height: 8),
                Row(
                  children: [
                    Radio(
                      value: 'daily',
                      groupValue: selectedFrequency,
                      onChanged: (value) {
                        setState(() {
                          selectedFrequency = value as String;
                        });
                      },
                    ),
                    Text('Daily'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'weekly',
                      groupValue: selectedFrequency,
                      onChanged: (value) {
                        setState(() {
                          selectedFrequency = value as String;
                        });
                      },
                    ),
                    Text('Weekly'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'monthly',
                      groupValue: selectedFrequency,
                      onChanged: (value) {
                        setState(() {
                          selectedFrequency = value as String;
                        });
                      },
                    ),
                    Text('Monthly'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),

            Row(
              children: [
                Expanded(
                  child: Text(
                    'Tentative next heat date: ${calculateNextHeatDate()}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous screen
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = '${DateFormat('dd/MM/yyyy').format(picked)}';
      });
    }
  }

  void _submitForm() {
    // Implement the logic for submitting the form data
    print('Bull ID: ${bullIdController.text}');
    print('Date of AI: ${aiDateController.text}');
    print('Data of AI: $selectedDataOfAi');
    print('Milk Production: ${milkProductionController.text}');
    print('Next Heat Date: ${nextHeatDateController.text}');
  }

  String calculateNextHeatDate() {
    if (aiDateController.text.isEmpty) {
      return 'Select Date of AI first';
    }

    try {
      DateTime selectedDate = DateFormat('dd/MM/yyyy').parse(aiDateController.text);
      DateTime nextHeatDate = selectedDate.add(Duration(days: 21));
      return DateFormat('dd/MM/yyyy').format(nextHeatDate);
    } catch (e) {
      return 'Invalid Date Format';
    }
  }
}

class DataTablePage extends StatelessWidget {
  final List<dynamic> response;
  final AppLocalizations appLocalizations;
  final String nodeId;

  Map<String, int> totalActivityTimes = {};

  DataTablePage({
    required this.response,
    required this.appLocalizations,
    required this.nodeId,
  });


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

    int nodeIdValue = int.tryParse(nodeId) ?? 0;
    int cowNumber = nodeIdValue - 100;

    List<activityData> currentGroup = [];
    List<List<activityData>> groupedActivities = [];
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
          groupedActivities.add([...currentGroup]);
          currentGroup = [activityDataList[i]];
        }
      }
    }
    if (currentGroup.isNotEmpty) {
      groupedActivities.add([...currentGroup]);
    }

    //total time calculation
    List<Map<String, dynamic>> activityTimeList =
    List<Map<String, dynamic>>.from(response);

    Map<String, int> totalActivityTimes = {};

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
        if (activityTimeList[i]['ActivityLabel'] !=
            activityTimeList[i + 1]['ActivityLabel'] &&
            activityTimeList[i]['ActivityLabel'] !=
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
              )),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AiDataForm()),
                );
              },
              child: Text(
                "Enter AI Data",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Text(
              '${appLocalizations.localizedValues['cow_activity_data']} ( ${appLocalizations.localizedValues['cow_id']} : $cowNumber )',
              style: GoogleFonts.kalam(
                  textStyle: TextStyle(
                    fontSize: 20.0,
                  )),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(15),
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
                    }).toList() as List<DataRow>, // Cast to fix the error
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),

            // SizedBox(
            //   height: 300,
            //   child: PieChart(
            //     PieChartData(
            //       sections: generatePieChartData(totalActivityTimes),
            //       borderData: FlBorderData(show: false),
            //       sectionsSpace: 0,
            //       centerSpaceRadius: 40,
            //       centerSpaceColor: Colors.white,
            //       pieTouchData: PieTouchData(touchCallback: (PieTouchResponse? touchResponse) {}),
            //     ),
            //
            //   ),
            // ),


            //pie chart
            Row(
              children: [
                SizedBox(
                  height: 170,
                  width: MediaQuery.of(context).size.width * 0.7, // Adjust the width as needed
                  child: PieChart(
                    PieChartData(
                      sections: generatePieChartData(totalActivityTimes),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      centerSpaceColor: Colors.white,
                      pieTouchData: PieTouchData(touchCallback: (PieTouchResponse? touchResponse) {}),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3, // Adjust the width as needed
                  child: Legend(
                    data: generateLegendData(totalActivityTimes),
                  ),
                ),
              ],
            ),



            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataRowHeight: 40.0,
                      dividerThickness: 2.0,
                      columns: [
                        DataColumn(
                          label: Text(
                            appLocalizations.localizedValues['start_timestamp'],
                            style: GoogleFonts.kalam(
                                textStyle: TextStyle(
                                  fontSize: 16.0,
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
                                )),
                          ),
                          tooltip: appLocalizations
                              .localizedValues['activity'],
                        ),
                      ],
                      rows: groupedActivities.map((rowActivities) {
                        String startTimestamp =
                        DateFormat('HH:mm:ss (dd/MM/yy)')
                            .format(rowActivities.first.timestamp);
                        String endTimestamp =
                        DateFormat('HH:mm:ss (dd/MM/yy)')
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
                                      )),
                                ),
                              ),
                              showEditIcon: false,
                            ),
                          ],
                        );
                      }).toList() as List<DataRow>, // Cast to fix the error
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









  List<PieChartSectionData> generatePieChartData(Map<String, int> data) {
    List<PieChartSectionData> sections = [];
    int total = data.values.reduce((a, b) => a + b);

    data.forEach((activityLabel, totalTime) {
      double percentage = (totalTime / total * 100);

      sections.add(
        PieChartSectionData(
          value: percentage,
          title: percentage >= 0.05 ? '$activityLabel' : '',
          color: getRandomColor(),
          titleStyle: TextStyle(fontSize: 10),
          titlePositionPercentageOffset: 0.55,
        ),
      );
    });

    return sections;
  }

  List<LegendItem> generateLegendData(Map<String, int> data) {
    List<LegendItem> legendData = [];

    data.forEach((activityLabel, totalTime) {
      double percentage = (totalTime / data.values.reduce((a, b) => a + b) * 100);
      legendData.add(
        LegendItem(
          label: '$activityLabel - ${percentage.toStringAsFixed(2)}%',
          color: getRandomColor(),
        ),
      );
    });

    return legendData;
  }


  Color getRandomColor() {
    Random random = Random();
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);

    // Ensure the generated color is not black
    while (red == 0 && green == 0 && blue == 0) {
      red = random.nextInt(256);
      green = random.nextInt(256);
      blue = random.nextInt(256);
    }

    return Color.fromRGBO(red, green, blue, 1);
  }


}

class LegendItem {
  final String label;
  final Color color;

  LegendItem({required this.label, required this.color});
}

class Legend extends StatelessWidget {
  final List<LegendItem> data;

  Legend({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((item) {
        return Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: item.color,
            ),
            SizedBox(width: 8),
            Text(item.label),
          ],
        );
      }).toList(),
    );
  }
}


class FormNavigator {
  static void navigateToAIFormPage(BuildContext context) {
    Navigator.pushNamed(context, '/aiform');
  }
}



void main() {
  runApp(MaterialApp(
    home: DataTablePage(
        response: [], appLocalizations: AppLocalizations(), nodeId: ''),
  ));
}