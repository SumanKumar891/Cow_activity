import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EnterForm(),
    );
  }
}

class EnterForm extends StatefulWidget {
  @override
  _EnterFormState createState() => _EnterFormState();
}

class _EnterFormState extends State<EnterForm> {
  TextEditingController bullNumberController = TextEditingController();
  TextEditingController aiDateController = TextEditingController();
  TextEditingController milkProductionController = TextEditingController();
  TextEditingController nextHeatDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: bullNumberController,
              decoration: InputDecoration(labelText: 'Bull No.'),
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
                Text(
                  'Date of AI',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Milk Production:'),
            Row(
              children: [
                Radio(
                  value: 'daily',
                  groupValue: milkProductionController.text,
                  onChanged: (value) {
                    setState(() {
                      milkProductionController.text = value.toString();
                    });
                  },
                ),
                Text('Daily'),
                Radio(
                  value: 'weekly',
                  groupValue: milkProductionController.text,
                  onChanged: (value) {
                    setState(() {
                      milkProductionController.text = value.toString();
                    });
                  },
                ),
                Text('Weekly'),
                Radio(
                  value: 'monthly',
                  groupValue: milkProductionController.text,
                  onChanged: (value) {
                    setState(() {
                      milkProductionController.text = value.toString();
                    });
                  },
                ),
                Text('Monthly'),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nextHeatDateController,
                    onTap: () {
                      _selectDate(context, nextHeatDateController);
                    },
                    decoration: InputDecoration(
                      labelText: 'Next Heat Date',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  'Next Heat Date',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
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
        controller.text = '${picked.toLocal()}'.split(' ')[0];
      });
    }
  }

  void _submitForm() {
    // Implement the logic for submitting the form data
    print('Bull No.: ${bullNumberController.text}');
    print('Date of AI: ${aiDateController.text}');
    print('Milk Production: ${milkProductionController.text}');
    print('Next Heat Date: ${nextHeatDateController.text}');
  }
}
