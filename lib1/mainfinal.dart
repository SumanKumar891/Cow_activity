import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Cow Web App',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TimeOfDay _timeOfDay = TimeOfDay.now();
    TextEditingController timeinput = TextEditingController();
    //timeinput.text = timeinput.toString();

    //TextEditingController _controller = TextEditingController(text :"",);


    void _showTimePicker() {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      ).then((value) {
        setState(() {
          //_controller.text = value.format(context);
          _timeOfDay = value!;
        });
        //print(value.format(context).toString());
      });
    }

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Application Home Page', style: (TextStyle(fontSize: 30.0, color: Colors.white ))),

      ),

      body: Center(
        child: Column(children: <Widget>[
          /*
                SizedBox(
                  //height: height * 0.09, //height to 9% of screen height,
                  //width: width * 0.4, //width t 40% of screen width
                  width: width * 0.95,
                  child: ElevatedButton(
                    child: Text("Sample Data Table"),
                    onPressed: (){},
                  ),
                ),
                 */
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),

            //Refer for device width and height auto adjust
            height: height *0.886,
            width: width * 0.95,


            margin: EdgeInsets.all(10),
            child: Table(
              defaultColumnWidth: FixedColumnWidth(100.0),

              border: TableBorder.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 0.0),
              children: [
                TableRow( children: [
                  Column(children:[Text('SNO.', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold))]),
                  Column(children:[Text('DEVICE ID', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold))]),
                  Column(children:[Text('START TIME', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold))]),
                  Column(children:[Text('END TIME', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold))]),
                  Column(children:[Text('DOWNLOAD ', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold))]),
                ]),
                TableRow( children:[
                  Column(children:[Text('1',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[TextField (
                    style: TextStyle(fontSize: 19.0, color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter DeviceID',
                      //labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 15),

                    ),
                  ),]),

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),

                  /*
                    Column(children:[

                      Text(pickedTime.format(context).toString(), style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      MaterialButton(
                          onPressed: _showTimePicker,

                          onPressed: () async {
                            TimeOfDay pickedTime =  await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('Start time',
                                  style: TextStyle(color: Colors.white, fontSize: 19.0),)
                            )
                          },
                        color: Colors.green,
                      ),

                    /*
                      Text(
                        '$hours: $minutes',
                        style: TextStyle(fontSize: 19),
                      ),


                      const SizedBox(height: 16),
                      ElevatedButton(
                          child: Text('Select Time'),

                        onPressed: () async{
                          _showTimePicker;
                          );



                        onPressed: () async{
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: time,
                            );

                            //if cancel is pressed
                            if (newTime == null) return;

                            //if ok is pressed
                            //WidgetsBinding.instance.addPostFrameCallback((_) => setState(=> time = newTime));
                          setState(() => time = newTime);
                        },

                      )
                    */
                    ]),*/

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),



                  //Column(children:[Text('21:00:05',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[
                    InkWell(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            //Change download icon size

                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold)

                        ),

                        child: Icon(
                          Icons.download,
                          color: Colors.white,

                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondRoute()),
                          );
                        },
                      ),

                    ),

                  ]),

                ]),
                TableRow( children:[
                  Column(children:[Text('2',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[TextField (
                    style: TextStyle(fontSize: 19.0, color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter DeviceID',
                      //labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 15),

                    ),
                  ),]),

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),

                  /*
                    Column(children:[

                      Text(pickedTime.format(context).toString(), style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      MaterialButton(
                          onPressed: _showTimePicker,

                          onPressed: () async {
                            TimeOfDay pickedTime =  await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('Start time',
                                  style: TextStyle(color: Colors.white, fontSize: 19.0),)
                            )
                          },
                        color: Colors.green,
                      ),

                    /*
                      Text(
                        '$hours: $minutes',
                        style: TextStyle(fontSize: 19),
                      ),


                      const SizedBox(height: 16),
                      ElevatedButton(
                          child: Text('Select Time'),

                        onPressed: () async{
                          _showTimePicker;
                          );



                        onPressed: () async{
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: time,
                            );

                            //if cancel is pressed
                            if (newTime == null) return;

                            //if ok is pressed
                            //WidgetsBinding.instance.addPostFrameCallback((_) => setState(=> time = newTime));
                          setState(() => time = newTime);
                        },

                      )
                    */
                    ]),*/

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),



                  //Column(children:[Text('21:00:05',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[
                    InkWell(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            //Change download icon size

                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold)

                        ),

                        child: Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondRoute()),
                          );
                        },
                      ),

                    ),

                  ]),

                ]),
                TableRow( children:[
                  Column(children:[Text('3',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[TextField (
                    style: TextStyle(fontSize: 19.0, color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter DeviceID',
                      //labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 15),

                    ),
                  ),]),

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),

                  /*
                    Column(children:[

                      Text(pickedTime.format(context).toString(), style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      MaterialButton(
                          onPressed: _showTimePicker,

                          onPressed: () async {
                            TimeOfDay pickedTime =  await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('Start time',
                                  style: TextStyle(color: Colors.white, fontSize: 19.0),)
                            )
                          },
                        color: Colors.green,
                      ),

                    /*
                      Text(
                        '$hours: $minutes',
                        style: TextStyle(fontSize: 19),
                      ),


                      const SizedBox(height: 16),
                      ElevatedButton(
                          child: Text('Select Time'),

                        onPressed: () async{
                          _showTimePicker;
                          );



                        onPressed: () async{
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: time,
                            );

                            //if cancel is pressed
                            if (newTime == null) return;

                            //if ok is pressed
                            //WidgetsBinding.instance.addPostFrameCallback((_) => setState(=> time = newTime));
                          setState(() => time = newTime);
                        },

                      )
                    */
                    ]),*/

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),



                  //Column(children:[Text('21:00:05',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[
                    InkWell(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            //Change download icon size

                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold)

                        ),

                        child: Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondRoute()),
                          );
                        },
                      ),

                    ),

                  ]),

                ]),
                TableRow( children:[
                  Column(children:[Text('4',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[TextField (
                    style: TextStyle(fontSize: 19.0, color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter DeviceID',
                      //labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 15),

                    ),
                  ),]),

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),

                  /*
                    Column(children:[

                      Text(pickedTime.format(context).toString(), style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      MaterialButton(
                          onPressed: _showTimePicker,

                          onPressed: () async {
                            TimeOfDay pickedTime =  await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('Start time',
                                  style: TextStyle(color: Colors.white, fontSize: 19.0),)
                            )
                          },
                        color: Colors.green,
                      ),

                    /*
                      Text(
                        '$hours: $minutes',
                        style: TextStyle(fontSize: 19),
                      ),


                      const SizedBox(height: 16),
                      ElevatedButton(
                          child: Text('Select Time'),

                        onPressed: () async{
                          _showTimePicker;
                          );



                        onPressed: () async{
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: time,
                            );

                            //if cancel is pressed
                            if (newTime == null) return;

                            //if ok is pressed
                            //WidgetsBinding.instance.addPostFrameCallback((_) => setState(=> time = newTime));
                          setState(() => time = newTime);
                        },

                      )
                    */
                    ]),*/

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),



                  //Column(children:[Text('21:00:05',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[
                    InkWell(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            //Change download icon size

                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold)

                        ),

                        child: Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondRoute()),
                          );
                        },
                      ),

                    ),

                  ]),

                ]),
                TableRow( children:[
                  Column(children:[Text('5',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[TextField (
                    style: TextStyle(fontSize: 19.0, color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter DeviceID',
                      //labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 15),

                    ),
                  ),]),

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),

                  /*
                    Column(children:[

                      Text(pickedTime.format(context).toString(), style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      MaterialButton(
                          onPressed: _showTimePicker,

                          onPressed: () async {
                            TimeOfDay pickedTime =  await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('Start time',
                                  style: TextStyle(color: Colors.white, fontSize: 19.0),)
                            )
                          },
                        color: Colors.green,
                      ),

                    /*
                      Text(
                        '$hours: $minutes',
                        style: TextStyle(fontSize: 19),
                      ),


                      const SizedBox(height: 16),
                      ElevatedButton(
                          child: Text('Select Time'),

                        onPressed: () async{
                          _showTimePicker;
                          );



                        onPressed: () async{
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: time,
                            );

                            //if cancel is pressed
                            if (newTime == null) return;

                            //if ok is pressed
                            //WidgetsBinding.instance.addPostFrameCallback((_) => setState(=> time = newTime));
                          setState(() => time = newTime);
                        },

                      )
                    */
                    ]),*/

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),



                  //Column(children:[Text('21:00:05',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[
                    InkWell(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            //Change download icon size

                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold)

                        ),

                        child: Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondRoute()),
                          );
                        },
                      ),

                    ),

                  ]),

                ]),
                TableRow( children:[
                  Column(children:[Text('6',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[TextField (
                    style: TextStyle(fontSize: 19.0, color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter DeviceID',
                      //labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 15),

                    ),
                  ),]),

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),

                  /*
                    Column(children:[

                      Text(pickedTime.format(context).toString(), style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      MaterialButton(
                          onPressed: _showTimePicker,

                          onPressed: () async {
                            TimeOfDay pickedTime =  await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('Start time',
                                  style: TextStyle(color: Colors.white, fontSize: 19.0),)
                            )
                          },
                        color: Colors.green,
                      ),

                    /*
                      Text(
                        '$hours: $minutes',
                        style: TextStyle(fontSize: 19),
                      ),


                      const SizedBox(height: 16),
                      ElevatedButton(
                          child: Text('Select Time'),

                        onPressed: () async{
                          _showTimePicker;
                          );



                        onPressed: () async{
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: time,
                            );

                            //if cancel is pressed
                            if (newTime == null) return;

                            //if ok is pressed
                            //WidgetsBinding.instance.addPostFrameCallback((_) => setState(=> time = newTime));
                          setState(() => time = newTime);
                        },

                      )
                    */
                    ]),*/

                  Column(children:[
                    TextField(
                      controller: timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time), //icon of text field
                        //labelText: "Enter Time" //label text of field
                      ),

/*
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.green,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                    Colors.black, // button text color
                  ),
                ),
              ),
              // child: child!,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              ),
            );
          },
        );

        if (pickedTime != null) {
          print(pickedTime.format(context));
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

          setState(() {
            timeinput.text = formattedTime;
            // print(timeinput.text);
          });
        } else {
          // print("Time is not selected");
        }
      },
*/


                      readOnly: true,  //set it true, so that user will not able to edit text

                      onTap: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if(pickedTime != null ){
                          print(pickedTime.format(context));   //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text = formattedTime; //set the value of text field.
                          });
                        }else{
                          print("Time is not selected");
                        }
                      },
                    ),

                  ]
                  ),



                  //Column(children:[Text('21:00:05',style: TextStyle(fontSize: 19.0, color: Colors.white))]),
                  Column(children:[
                    InkWell(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            //Change download icon size

                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold)

                        ),

                        child: Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondRoute()),
                          );
                        },
                      ),

                    ),

                  ]),

                ]),



              ],
            ),
          ),


        ]),


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),


      /*
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),*/
    );
  }
}



class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Data Download Page', style: (TextStyle(fontSize: 30.0, color: Colors.white ))),

      ),
      body: Center(

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              //Change download icon size

              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold)

          ),

          onPressed: () {
            print("File Downloaded");
            //Navigator.pop(context);
          },
          child: Text('Download Here',  ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _TableExample createState() => _TableExample();
}

class _TableExample extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Flutter Based app',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),


      home: Scaffold(
          appBar: AppBar(
            title: Text('COW WEB APP'),
          ),
          body: Center(
              child: Column(children: <Widget>[
                /*
                SizedBox(
                  //height: height * 0.09, //height to 9% of screen height,
                  //width: width * 0.4, //width t 40% of screen width
                  width: width * 0.95,
                  child: ElevatedButton(
                    child: Text("Sample Data Table"),
                    onPressed: (){},
                  ),
                ),
                 */
                Container(

                  //Refer for device width and height auto adjust
                  height: height * 0.1,
                  width: width * 0.8,


                  margin: EdgeInsets.all(10),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(100.0),
                    border: TableBorder.all(
                        color: Colors.green,
                        style: BorderStyle.solid,
                        width: 2),
                    children: [
                      TableRow( children: [
                        Column(children:[Text('SNO.', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('DEVICE ID', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('START TIME', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('END TIME', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('DOWNLOAD ', style: TextStyle(fontSize: 20.0))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('1',style: TextStyle( fontFamily:'UbuntuRegular'))]),
                        Column(children:[Text('XYZ123',style: TextStyle(fontSize: 18.0,fontFamily:'RaleWay', color: Colors.black))]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[
                          InkWell(
                            child: ElevatedButton(
                              child: const Text('Open route'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                                );
                              },
                            ),
                            /*
                          child: Icon(Icons.download),
                              /*
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                                );
                              },

                               */
                          onTap: (){
                            //action code when clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SecondRoute()),
                            );
                          },
                        */),

                        ]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('2')]),
                        Column(children:[Text('XYZ123')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('Click Here(Link)')]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('3')]),
                        Column(children:[Text('XYZ123')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('Click Here(Link)')]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('4')]),
                        Column(children:[Text('XYZ123')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('Click Here(Link)')]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('5')]),
                        Column(children:[Text('XYZ123')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('Click Here(Link)')]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('6')]),
                        Column(children:[Text('XYZ123')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('Click Here(Link)')]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('7')]),
                        Column(children:[Text('XYZ123')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('21:00:05')]),
                        Column(children:[Text('Click Here(Link)')]),
                      ]),
                    ],
                  ),
                ),

              ])
          )),
    );
  }
}

//Main app ends here

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
*/
