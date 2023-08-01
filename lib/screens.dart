import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
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
      */),
    );
  }
}

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