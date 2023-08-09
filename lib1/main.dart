/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}





class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _firstTimeOpen = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: _firstTimeOpen ? 0 : 1,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(
                        //'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                        //size: 100
                        //'img.jpeg',
                        'data:image/png;base64,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',

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: TypewriterAnimatedText('Mooofarm, Dairy ka kaam asaan kare ', textStyle: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)),
                ),
                SizedBox(height: 40),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Center(
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _firstTimeOpen = false;
                          });
                          // Navigate to the new page containing the login window
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SeparatePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                        ),
                        child: Text('Continue',
                            style: (TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ))),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Animated Text

              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Image.network(
                  width: 50,
                  height: 50,
                  'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





class SeparatePage extends StatefulWidget {
  @override
  _SeparatePageState createState() => _SeparatePageState();
}

class _SeparatePageState extends State<SeparatePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();

    // Show the login window automatically
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: SizedBox(
            width: 300, // Set the width of the login dialog
            child: AnimatedLoginDialog(),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
    );
  }
}



class AnimatedLoginDialog extends StatefulWidget {
  @override
  _AnimatedLoginDialogState createState() => _AnimatedLoginDialogState();
}



/*
                //'https://play-lh.googleusercontent.com/3MFgunnGnKN0Spr8LoJ0GYB1QiZjypyNekoLsFtLu7_QibLpJBSrYWddPNnccpOYQ7yY=w240-h480-rw',
                'https://m.media-amazon.com/images/I/41wR0kC65SL.jpg',
                //'https://thumbs.dreamstime.com/b/basic-rgb-143120196.jpg',
                //'https://previews.123rf.com/images/f1digitals/f1digitals1903/f1digitals190300771/120383221-vector-cartoon-illustration-of-punjabi-farmer-with-plough-isolated-on-white-background.jpg',

 */




class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Moofarm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                'https://png.pngtree.com/png-vector/20191110/ourmid/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg',
                //'https://play-lh.googleusercontent.com/3MFgunnGnKN0Spr8LoJ0GYB1QiZjypyNekoLsFtLu7_QibLpJBSrYWddPNnccpOYQ7yY=w240-h480-rw',
                //'https://toppng.com/uploads/preview/black-and-white-stockportable-network-account-icon-11553436383dwuayhjyvo.png',
                width: 80,
                height: 80,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter Farmer ID',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              /* ElevatedButton(
                onPressed: () {
                  // Check if email and password are not null
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  if (email.isNotEmpty && password.isNotEmpty) {
                    // Add login logic here

                    // Navigate to the third page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdPage()),
                    );
                  } else {
                    // Show a snackbar or toast indicating that email and password are required
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email and password are required.')),
                    );
                  }
                },
                child: Text('Login'),
              ),*/

              ElevatedButton(
                onPressed: () {
                  // Check if email and password are correct ('hello')
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  if (email == 'awadh' && password == 'awadh') {
                    // Add login logic here

                    // Navigate to the third page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdPage()),
                    );
                  } else {
                    // Show a snackbar or toast indicating that email and password are incorrect
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid email or password!')),
                    );
                  }
                },
                child: Text('Login'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}






/*

class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          //width: 100, // Set the width to 200 pixels
          //height: 80, // Set the height to 150 pixels
          //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                'Welcome to Moofarm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                //'https://play-lh.googleusercontent.com/3MFgunnGnKN0Spr8LoJ0GYB1QiZjypyNekoLsFtLu7_QibLpJBSrYWddPNnccpOYQ7yY=w240-h480-rw',
                'https://m.media-amazon.com/images/I/41wR0kC65SL.jpg',
                //'https://thumbs.dreamstime.com/b/basic-rgb-143120196.jpg',
                //'https://previews.123rf.com/images/f1digitals/f1digitals1903/f1digitals190300771/120383221-vector-cartoon-illustration-of-punjabi-farmer-with-plough-isolated-on-white-background.jpg',
                width: 50,
                height: 50,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter FarmerID',
                  //prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  //prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add login logic here

                  // Navigate to the third page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/


class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Nodes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [



          CustomFloatingWindow(
            nodeId: '1',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },


          ),
          CustomFloatingWindow(
            nodeId: '2',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/

          ),
          CustomFloatingWindow(
            nodeId: '3',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/

          ),
          CustomFloatingWindow(
            nodeId: '4',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/

          ),
          CustomFloatingWindow(
            nodeId: '5',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/

          ),
          CustomFloatingWindow(
            nodeId: '6',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/

          ),
          CustomFloatingWindow(
            nodeId: '7',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/

          ),
          CustomFloatingWindow(
            nodeId: '8',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/

          ),
          CustomFloatingWindow(
            nodeId: '9',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/

          ),
          CustomFloatingWindow(
            nodeId: '10',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/

          ),
          CustomFloatingWindow  (
            nodeId: '11',
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/

          ),


          // Add other CustomFloatingWindow widgets with different nodeIds
        ],
      ),
    );
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }
}



class CustomFloatingWindow extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final String nodeId;
  final VoidCallback onButtonPressed;

  CustomFloatingWindow({
    required this.imagePath,
    required this.buttonText,
    required this.nodeId,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cow ID: $nodeId',
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: onButtonPressed,
                child: Text(buttonText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            SizedBox(height: 20), // Add spacing below the button
            TableWidget(),
            SizedBox(height: 20),
            // Use the custom TableWidget to display the table
          ],
        ),
      ),
    );
  }
}





/*
class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Start Time',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        DataColumn(label: Text('End Time',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        DataColumn(label: Text('Status',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),

      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Grazing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Sleeing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Moowing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Walking')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Urinating')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Running')),
        ]),

        // Add more rows as needed
      ],
    );
  }
}
*/









//Working epoch date and time controller
/*
class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int? epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int? epochTime2; // Variable to save the EPOCH time for the second selected date and time

  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }

  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 = DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 = DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _dateTimeController1,
          onTap: () => _selectDateTime(context, _dateTimeController1),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 1',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _dateTimeController2,
          onTap: () => _selectDateTime(context, _dateTimeController2),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 2',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDateTime(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}
*/




class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int? epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int? epochTime2; // Variable to save the EPOCH time for the second selected date and time

  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }

  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 = DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 = DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _dateTimeController1,
          onTap: () => _selectDateTime(context, _dateTimeController1),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select start date and time',
            //suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _dateTimeController2,
          onTap: () => _selectDateTime(context, _dateTimeController2),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select end date and time',
            //suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        /*ElevatedButton(
          onPressed: () {
            // This is the function that will be called when the user submits the form
            // You can use epochTime1 and epochTime2 here as needed
            // For demonstration purposes, we are printing the epoch times to the console again
            if (epochTime1 != null) {
              print('Selected Date and Time 1 (EPOCH time): $epochTime1');
            } else {
              print('Date and Time 1 not selected.');
            }
            if (epochTime2 != null) {
              print('Selected Date and Time 2 (EPOCH time): $epochTime2');
            } else {
              print('Date and Time 2 not selected.');
            }
          },
          child: Text('Submit'), // Changed the button text to "Submit"
        ),*/
        ElevatedButton(
          onPressed: () {
            if (epochTime1 != null && epochTime2 != null) {
              // Navigate to the DataTablePage when both dates are selected
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DataTablePage()),
              );
            } else {
              print('Please select both Date and Time first.');
            }
          },
          child: Text('Submit'), // Changed the button text to "Submit"
        ),

      ],
    );
  }

  Future<void> _selectDateTime(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}





class DataTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('Start Time',style: TextStyle(fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('End Time',style: TextStyle(fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('Status',style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('8:00:00')),
                  DataCell(Text('10:00:00')),
                  DataCell(Text('Grazing')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10:00:01')),
                  DataCell(Text('12:00:00')),
                  DataCell(Text('Sleeping')),
                ]),
                DataRow(cells: [
                  DataCell(Text('12:00:02')),
                  DataCell(Text('14:00:00')),
                  DataCell(Text('Sitting')),
                ]),
                DataRow(cells: [
                  DataCell(Text('14:00:01')),
                  DataCell(Text('18:00:00')),
                  DataCell(Text('Running')),
                ]),
                DataRow(cells: [
                  DataCell(Text('18:00:02')),
                  DataCell(Text('20:00:00')),
                  DataCell(Text('Mooing')),
                ]),
                DataRow(cells: [
                  DataCell(Text('20:00:02')),
                  DataCell(Text('24:00:00')),
                  DataCell(Text('Sleeping')),
                ]),


                // Add more rows as needed
              ],
            ),
            SizedBox(height: 20), // Add some spacing between the table and the download button
            ElevatedButton(
              onPressed: () {
                // Add the download logic here
                print('Download button clicked!');
              },
              child: Text('Download'),
            ),
          ],
        ),
      ),
    );
  }
}









class TypewriterAnimatedText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  TypewriterAnimatedText(this.text, {required this.textStyle});

  @override
  _TypewriterAnimatedTextState createState() => _TypewriterAnimatedTextState();
}

class _TypewriterAnimatedTextState extends State<TypewriterAnimatedText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _animatedText = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.text.length * 150), // Adjust the duration as per your requirement
    );

    _controller.addListener(() {
      int currentLength = (_controller.value * widget.text.length).round();
      setState(() {
        _animatedText = widget.text.substring(0, currentLength);
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animatedText,
      style: widget.textStyle,
    );
  }
}

*/






































































/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:html' show AnchorElement, Blob, Url;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _firstTimeOpen = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: _firstTimeOpen ? 0 : 1,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(
                        //'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                        //size: 100
                        //'img.jpeg',
                        'data:image/png;base64,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',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: TypewriterAnimatedText(
                      'Mooofarm, Dairy ka kaam asaan kare ',
                      textStyle: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic)),
                ),
                SizedBox(height: 40),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Center(
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _firstTimeOpen = false;
                          });
                          // Navigate to the new page containing the login window
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeparatePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                        ),
                        child: Text('Continue',
                            style: (TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ))),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Animated Text
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Image.network(
                  width: 50,
                  height: 50,
                  'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeparatePage extends StatefulWidget {
  @override
  _SeparatePageState createState() => _SeparatePageState();
}

class _SeparatePageState extends State<SeparatePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();

    // Show the login window automatically
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: SizedBox(
            width: 300, // Set the width of the login dialog
            child: AnimatedLoginDialog(),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
    );
  }
}

class AnimatedLoginDialog extends StatefulWidget {
  @override
  _AnimatedLoginDialogState createState() => _AnimatedLoginDialogState();
}

/*
                //'https://play-lh.googleusercontent.com/3MFgunnGnKN0Spr8LoJ0GYB1QiZjypyNekoLsFtLu7_QibLpJBSrYWddPNnccpOYQ7yY=w240-h480-rw',
                'https://m.media-amazon.com/images/I/41wR0kC65SL.jpg',
                //'https://thumbs.dreamstime.com/b/basic-rgb-143120196.jpg',
                //'https://previews.123rf.com/images/f1digitals/f1digitals1903/f1digitals190300771/120383221-vector-cartoon-illustration-of-punjabi-farmer-with-plough-isolated-on-white-background.jpg',

 */

class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Moofarm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                'https://play-lh.googleusercontent.com/3MFgunnGnKN0Spr8LoJ0GYB1QiZjypyNekoLsFtLu7_QibLpJBSrYWddPNnccpOYQ7yY=w240-h480-rw',
                width: 70,
                height: 70,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter FarmerID',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              /* ElevatedButton(
                onPressed: () {
                  // Check if email and password are not null
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  if (email.isNotEmpty && password.isNotEmpty) {
                    // Add login logic here

                    // Navigate to the third page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdPage()),
                    );
                  } else {
                    // Show a snackbar or toast indicating that email and password are required
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email and password are required.')),
                    );
                  }
                },
                child: Text('Login'),
              ),*/

              ElevatedButton(
                onPressed: () {
                  // Check if email and password are correct ('hello')
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  if (email == 'awadh' && password == 'awadh') {
                    // Add login logic here

                    // Navigate to the third page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdPage()),
                    );
                  } else {
                    // Show a snackbar or toast indicating that email and password are incorrect
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid email or password!')),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          //width: 100, // Set the width to 200 pixels
          //height: 80, // Set the height to 150 pixels
          //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                'Welcome to Moofarm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                //'https://play-lh.googleusercontent.com/3MFgunnGnKN0Spr8LoJ0GYB1QiZjypyNekoLsFtLu7_QibLpJBSrYWddPNnccpOYQ7yY=w240-h480-rw',
                'https://m.media-amazon.com/images/I/41wR0kC65SL.jpg',
                //'https://thumbs.dreamstime.com/b/basic-rgb-143120196.jpg',
                //'https://previews.123rf.com/images/f1digitals/f1digitals1903/f1digitals190300771/120383221-vector-cartoon-illustration-of-punjabi-farmer-with-plough-isolated-on-white-background.jpg',
                width: 50,
                height: 50,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter FarmerID',
                  //prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  //prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add login logic here

                  // Navigate to the third page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Nodes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CustomFloatingWindow(
            nodeId: '1',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
          ),
          CustomFloatingWindow(
            nodeId: '2',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '3',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '4',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '5',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '6',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '7',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '8',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '9',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '10',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '11',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),

          // Add other CustomFloatingWindow widgets with different nodeIds
        ],
      ),
    );
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }
}

class CustomFloatingWindow extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final String nodeId;
  final VoidCallback onButtonPressed;

  CustomFloatingWindow({
    required this.imagePath,
    required this.buttonText,
    required this.nodeId,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CowId: $nodeId',
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: onButtonPressed,
                child: Text(buttonText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Add spacing below the button
            TableWidget(),
            SizedBox(height: 20),
            // Use the custom TableWidget to display the table
          ],
        ),
      ),
    );
  }
}

/*
class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Start Time',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        DataColumn(label: Text('End Time',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        DataColumn(label: Text('Status',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),

      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Grazing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Sleeing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Moowing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Walking')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Urinating')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Running')),
        ]),

        // Add more rows as needed
      ],
    );
  }
}
*/

//Working epoch date and time controller
/*
class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int? epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int? epochTime2; // Variable to save the EPOCH time for the second selected date and time

  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }

  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 = DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 = DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _dateTimeController1,
          onTap: () => _selectDateTime(context, _dateTimeController1),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 1',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _dateTimeController2,
          onTap: () => _selectDateTime(context, _dateTimeController2),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 2',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDateTime(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}
*/

class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int?
  epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int?
  epochTime2; // Variable to save the EPOCH time for the second selected date and time

  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }

  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 =
      DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 =
      DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  Future<void> _callApiAndNavigate(BuildContext context) async {
    if (epochTime1 != null && epochTime2 != null) {
      try {
        final response = await apiCallFunction(epochTime1!, epochTime2!);
        print(response);
        // Navigate to the DataTablePage and pass the API response data
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DataTablePage(response: response)),
        );
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      print('Please select both Date and Time first.');
    }
  }

  // Replace this function with your actual API call implementation
  Future<Map<String, dynamic>> apiCallFunction(
      int epochTime1, int epochTime2) async {
    // Example: Making a simple GET request to an API endpoint

    final response = await http.get(Uri.https(
      'wcelyqvyi7.execute-api.us-east-1.amazonaws.com',
      '/deployment/cow',
      {
        'starttime': '1688165304',
        'endtime': '1688184444',
        'deviceId': '120',
      },
    ));

    if (response.statusCode == 200) {
      // If the API call is successful, parse the response data (assuming it's JSON)
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _dateTimeController1,
          onTap: () => _selectDateTime(context, _dateTimeController1),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 1',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _dateTimeController2,
          onTap: () => _selectDateTime(context, _dateTimeController2),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 2',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        /*ElevatedButton(
          onPressed: () {
            // This is the function that will be called when the user submits the form
            // You can use epochTime1 and epochTime2 here as needed
            // For demonstration purposes, we are printing the epoch times to the console again
            if (epochTime1 != null) {
              print('Selected Date and Time 1 (EPOCH time): $epochTime1');
            } else {
              print('Date and Time 1 not selected.');
            }
            if (epochTime2 != null) {
              print('Selected Date and Time 2 (EPOCH time): $epochTime2');
            } else {
              print('Date and Time 2 not selected.');
            }
          },
          child: Text('Submit'), // Changed the button text to "Submit"
        ),*/
        ElevatedButton(
          onPressed: () => _callApiAndNavigate(context),
          child: Text('Submit'), // Changed the button text to "Submit"
        ),
      ],
    );
  }

  Future<void> _selectDateTime(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}

class CoordinateData {
  final List<List<String>> coordinate;
  final String deviceId;
  final String timestamp;

  CoordinateData({
    required this.coordinate,
    required this.deviceId,
    required this.timestamp,
  });

  factory CoordinateData.fromJson(Map<String, dynamic> json) {
    return CoordinateData(
      coordinate: List<List<String>>.from(
        json['coordinate']
            .map((coord) => List<String>.from(coord.map((x) => x))),
      ),
      deviceId: json['deviceId'],
      timestamp: json['timestamp'],
    );
  }
}

class DataTablePage extends StatelessWidget {
  final Map<String, dynamic> response;

  DataTablePage({required this.response});

  void _downloadCSV(BuildContext context, List<CoordinateData> dataList) async {
    List<List<dynamic>> dataAsListOfLists = dataList.map((data) {
      return [
        data.deviceId,
        data.timestamp,
        data.coordinate.toString(),
      ];
    }).toList();

    List<String> columnNames = ['Device ID', 'Timestamp', 'Coordinate'];
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
      final blob = Blob([csv], 'text/csv');
      final url = Url.createObjectUrlFromBlob(blob);

      AnchorElement(href: url)
        ..setAttribute("download", "data.csv")
        ..click();

      Url.revokeObjectUrl(url);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('CSV download started.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> dataList = json.decode(response['body']);
    final List<CoordinateData> coordinateDataList =
    dataList.map((data) => CoordinateData.fromJson(data)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Cow Coordinate Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text('Device ID'),
                      tooltip: 'Device ID',
                    ),
                    DataColumn(
                      label: Text('Timestamp'),
                      tooltip: 'Timestamp',
                    ),
                    DataColumn(
                      label: Text('Coordinate'),
                      tooltip: 'Coordinate',
                    ),
                  ],
                  rows: coordinateDataList.map((data) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Container(
                            width: 60, // Set a maximum width for the cell
                            child: Text(
                              data.deviceId,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          showEditIcon: false, // Hide edit icon for better look
                        ),
                        DataCell(
                          Container(
                            width: 100, // Set a maximum width for the cell
                            child: Text(
                              data.timestamp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          showEditIcon: false, // Hide edit icon for better look
                        ),
                        DataCell(
                          Container(
                            width: 150, // Set a maximum width for the cell
                            child: Text(
                              data.coordinate.toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          showEditIcon: false, // Hide edit icon for better look
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _downloadCSV(context, coordinateDataList),
        tooltip: 'Download CSV',
        child: Icon(Icons.download),
      ),
    );
  }
}

// class DataTablePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data '),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DataTable(
//               columns: [
//                 DataColumn(
//                     label: Text(
//                   'Start Time',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 DataColumn(
//                     label: Text(
//                   'End Time',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 DataColumn(
//                     label: Text(
//                   'Status',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//               ],
//               rows: [
//                 DataRow(cells: [
//                   DataCell(Text('8:00:00')),
//                   DataCell(Text('10:00:00')),
//                   DataCell(Text('Grazing')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('10:00:01')),
//                   DataCell(Text('12:00:00')),
//                   DataCell(Text('Sleeping')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('12:00:02')),
//                   DataCell(Text('14:00:00')),
//                   DataCell(Text('Sitting')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('14:00:01')),
//                   DataCell(Text('18:00:00')),
//                   DataCell(Text('Running')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('18:00:02')),
//                   DataCell(Text('20:00:00')),
//                   DataCell(Text('Mooing')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('20:00:02')),
//                   DataCell(Text('24:00:00')),
//                   DataCell(Text('Sleeping')),
//                 ]),

//                 // Add more rows as needed
//               ],
//             ),
//             SizedBox(
//                 height:
//                     20), // Add some spacing between the table and the download button
//             ElevatedButton(
//               onPressed: () {
//                 // Add the download logic here
//                 print('Download button clicked!');
//               },
//               child: Text('Download'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TypewriterAnimatedText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  TypewriterAnimatedText(this.text, {required this.textStyle});

  @override
  _TypewriterAnimatedTextState createState() => _TypewriterAnimatedTextState();
}

class _TypewriterAnimatedTextState extends State<TypewriterAnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _animatedText = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: widget.text.length *
              150), // Adjust the duration as per your requirement
    );

    _controller.addListener(() {
      int currentLength = (_controller.value * widget.text.length).round();
      setState(() {
        _animatedText = widget.text.substring(0, currentLength);
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animatedText,
      style: widget.textStyle,
    );
  }
}
*/




























/*
import 'package:flutter/material.dart';
import 'package:aws_cognito/aws_cognito.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OTPScreen(),
    );
  }
}

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String mobileNumber = "";
  String otp = "";
  String verificationId = "";

  // Function to send OTP using Amazon SNS
  void sendOTP() async {
    // Code to send OTP using Amazon SNS
    // Replace <YOUR_SNS_TOPIC_ARN> with your SNS topic ARN
    // Implement the AWS SDK code to send the OTP to the user's mobile number.
    // You can use AWS Amplify, AWS SDK for Dart, or any other AWS SDK you prefer.
  }

  // Function to verify OTP with Amazon Cognito
  void verifyOTP() async {
    // Code to verify OTP using Amazon Cognito
    // Initialize the Cognito User Pool with your AWS credentials.
    final awsCognitoUserPool = AWSCognitoUserPool(<YOUR_AWS_REGION>, <YOUR_USER_POOL_ID>, <YOUR_CLIENT_ID>);

    try {
      final user = await awsCognitoUserPool.signIn(mobileNumber, otp);

      // If the OTP verification is successful, you can proceed with user authentication
      // or other actions in your app.
      print("User authenticated: ${user.username}");
    } catch (e) {
      // Handle OTP verification failure.
      print("OTP verification failed: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  mobileNumber = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your mobile number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (mobileNumber.isNotEmpty) {
                  sendOTP();
                }
              },
              child: Text('Send OTP'),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  otp = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter the OTP',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (otp.isNotEmpty) {
                  verifyOTP();
                }
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}

*/











































/*

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:html' show AnchorElement, Blob, Url;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _firstTimeOpen = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: _firstTimeOpen ? 0 : 1,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(
                        //'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                        //size: 100
                        //'img.jpeg',
                        'data:image/png;base64,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',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: TypewriterAnimatedText(
                      'Mooofarm, Dairy ka kaam asaan kare ',
                      textStyle: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic)),
                ),
                SizedBox(height: 40),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Center(
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _firstTimeOpen = false;
                          });
                          // Navigate to the new page containing the login window
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeparatePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                        ),
                        child: Text('Continue',
                            style: (TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ))),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Animated Text
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Image.network(
                  width: 50,
                  height: 50,
                  'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeparatePage extends StatefulWidget {
  @override
  _SeparatePageState createState() => _SeparatePageState();
}

class _SeparatePageState extends State<SeparatePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();

    // Show the login window automatically
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: SizedBox(
            width: 300, // Set the width of the login dialog
            child: AnimatedLoginDialog(),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
    );
  }
}

class AnimatedLoginDialog extends StatefulWidget {
  @override
  _AnimatedLoginDialogState createState() => _AnimatedLoginDialogState();
}

/*
                //'https://play-lh.googleusercontent.com/3MFgunnGnKN0Spr8LoJ0GYB1QiZjypyNekoLsFtLu7_QibLpJBSrYWddPNnccpOYQ7yY=w240-h480-rw',
                'https://m.media-amazon.com/images/I/41wR0kC65SL.jpg',
                //'https://thumbs.dreamstime.com/b/basic-rgb-143120196.jpg',
                //'https://previews.123rf.com/images/f1digitals/f1digitals1903/f1digitals190300771/120383221-vector-cartoon-illustration-of-punjabi-farmer-with-plough-isolated-on-white-background.jpg',

 */

class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Moofarm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                'https://play-lh.googleusercontent.com/3MFgunnGnKN0Spr8LoJ0GYB1QiZjypyNekoLsFtLu7_QibLpJBSrYWddPNnccpOYQ7yY=w240-h480-rw',
                width: 70,
                height: 70,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter FarmerID',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              /* ElevatedButton(
                onPressed: () {
                  // Check if email and password are not null
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  if (email.isNotEmpty && password.isNotEmpty) {
                    // Add login logic here

                    // Navigate to the third page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdPage()),
                    );
                  } else {
                    // Show a snackbar or toast indicating that email and password are required
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email and password are required.')),
                    );
                  }
                },
                child: Text('Login'),
              ),*/

              ElevatedButton(
                onPressed: () {
                  // Check if email and password are correct ('hello')
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  if (email == 'awadh' && password == 'awadh') {
                    // Add login logic here

                    // Navigate to the third page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdPage()),
                    );
                  } else {
                    // Show a snackbar or toast indicating that email and password are incorrect
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid email or password!')),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          //width: 100, // Set the width to 200 pixels
          //height: 80, // Set the height to 150 pixels
          //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                'Welcome to Moofarm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                //'https://play-lh.googleusercontent.com/3MFgunnGnKN0Spr8LoJ0GYB1QiZjypyNekoLsFtLu7_QibLpJBSrYWddPNnccpOYQ7yY=w240-h480-rw',
                'https://m.media-amazon.com/images/I/41wR0kC65SL.jpg',
                //'https://thumbs.dreamstime.com/b/basic-rgb-143120196.jpg',
                //'https://previews.123rf.com/images/f1digitals/f1digitals1903/f1digitals190300771/120383221-vector-cartoon-illustration-of-punjabi-farmer-with-plough-isolated-on-white-background.jpg',
                width: 50,
                height: 50,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter FarmerID',
                  //prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  //prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add login logic here

                  // Navigate to the third page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Nodes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CustomFloatingWindow(
            nodeId: '1',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
          ),
          CustomFloatingWindow(
            nodeId: '2',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '3',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '4',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '5',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '6',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '7',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '8',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '9',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '10',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '11',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),

          // Add other CustomFloatingWindow widgets with different nodeIds
        ],
      ),
    );
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }
}

class CustomFloatingWindow extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final String nodeId;
  final VoidCallback onButtonPressed;

  CustomFloatingWindow({
    required this.imagePath,
    required this.buttonText,
    required this.nodeId,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CowId: $nodeId',
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: onButtonPressed,
                child: Text(buttonText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Add spacing below the button
            TableWidget(),
            SizedBox(height: 20),
            // Use the custom TableWidget to display the table
          ],
        ),
      ),
    );
  }
}

/*
class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Start Time',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        DataColumn(label: Text('End Time',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        DataColumn(label: Text('Status',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),

      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Grazing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Sleeing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Moowing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Walking')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Urinating')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Running')),
        ]),

        // Add more rows as needed
      ],
    );
  }
}
*/

//Working epoch date and time controller
/*
class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int? epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int? epochTime2; // Variable to save the EPOCH time for the second selected date and time

  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }

  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 = DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 = DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _dateTimeController1,
          onTap: () => _selectDateTime(context, _dateTimeController1),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 1',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _dateTimeController2,
          onTap: () => _selectDateTime(context, _dateTimeController2),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 2',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDateTime(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}
*/

class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int?
  epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int?
  epochTime2; // Variable to save the EPOCH time for the second selected date and time

  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }

  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 =
      DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 =
      DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  Future<void> _callApiAndNavigate(BuildContext context) async {
    if (epochTime1 != null && epochTime2 != null) {
      try {
        final response = await apiCallFunction(epochTime1!, epochTime2!);
        print(response);
        // Navigate to the DataTablePage and pass the API response data
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DataTablePage(response: response)),
        );
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      print('Please select both Date and Time first.');
    }
  }

  // Replace this function with your actual API call implementation
  Future<Map<String, dynamic>> apiCallFunction(
      int epochTime1, int epochTime2) async {
    // Example: Making a simple GET request to an API endpoint

    final response = await http.get(Uri.https(
      'wcelyqvyi7.execute-api.us-east-1.amazonaws.com',
      '/deployment/cow',
      {
        'starttime': '1688165304',
        'endtime': '1688184444',
        'deviceId': '120',
      },
    ));

    if (response.statusCode == 200) {
      // If the API call is successful, parse the response data (assuming it's JSON)
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _dateTimeController1,
          onTap: () => _selectDateTime(context, _dateTimeController1),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 1',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _dateTimeController2,
          onTap: () => _selectDateTime(context, _dateTimeController2),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 2',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        /*ElevatedButton(
          onPressed: () {
            // This is the function that will be called when the user submits the form
            // You can use epochTime1 and epochTime2 here as needed
            // For demonstration purposes, we are printing the epoch times to the console again
            if (epochTime1 != null) {
              print('Selected Date and Time 1 (EPOCH time): $epochTime1');
            } else {
              print('Date and Time 1 not selected.');
            }
            if (epochTime2 != null) {
              print('Selected Date and Time 2 (EPOCH time): $epochTime2');
            } else {
              print('Date and Time 2 not selected.');
            }
          },
          child: Text('Submit'), // Changed the button text to "Submit"
        ),*/
        ElevatedButton(
          onPressed: () => _callApiAndNavigate(context),
          child: Text('Submit'), // Changed the button text to "Submit"
        ),
      ],
    );
  }

  Future<void> _selectDateTime(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}

class CoordinateData {
  final List<List<double>> coordinates;
  final String deviceId;
  final String timestamp;

  CoordinateData({
    required this.coordinates,
    required this.deviceId,
    required this.timestamp,
  });

  factory CoordinateData.fromJson(Map<String, dynamic> json) {
    return CoordinateData(
      coordinates: List<List<double>>.from(json['coordinate'].map((coord) {
        return List<double>.from(coord.map((value) => double.parse(value)));
      })),
      deviceId: json['deviceId'],
      timestamp: json['timestamp'],
    );
  }
}

class DataTablePage extends StatelessWidget {
  final Map<String, dynamic> response;

  DataTablePage({required this.response});

  void _downloadCSV(BuildContext context, List<CoordinateData> dataList) async {
    List<List<dynamic>> dataAsListOfLists = dataList.map((data) {
      return [
        data.deviceId,
        data.timestamp,
        data.coordinates[0][0],
        data.coordinates[0][1],
        data.coordinates[0][2],
      ];
    }).toList();

    List<String> columnNames = ['Device ID', 'Timestamp', 'X', 'Y', 'Z'];
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
        ..setAttribute("download", "data.csv")
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
    final List<dynamic> dataList = json.decode(response['body']);
    final List<CoordinateData> coordinateDataList =
    dataList.map((data) => CoordinateData.fromJson(data)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Cow Coordinate Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text('Device ID'),
                      tooltip: 'Device ID',
                    ),
                    DataColumn(
                      label: Text('Timestamp'),
                      tooltip: 'Timestamp',
                    ),
                    DataColumn(
                      label: Text('X'),
                      tooltip: 'X Coordinate',
                    ),
                    DataColumn(
                      label: Text('Y'),
                      tooltip: 'Y Coordinate',
                    ),
                    DataColumn(
                      label: Text('Z'),
                      tooltip: 'Z Coordinate',
                    ),
                  ],
                  rows: coordinateDataList.map((data) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Container(
                            width: 60, // Set a maximum width for the cell
                            child: Text(
                              data.deviceId,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          showEditIcon: false, // Hide edit icon for a better look
                        ),
                        DataCell(
                          Container(
                            width: 100, // Set a maximum width for the cell
                            child: Text(
                              data.timestamp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          showEditIcon: false, // Hide edit icon for a better look
                        ),
                        DataCell(
                          Container(
                            width: 80, // Set a maximum width for the cell
                            child: Text(
                              data.coordinates[0][0].toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          showEditIcon: false, // Hide edit icon for a better look
                        ),
                        DataCell(
                          Container(
                            width: 80, // Set a maximum width for the cell
                            child: Text(
                              data.coordinates[0][1].toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          showEditIcon: false, // Hide edit icon for a better look
                        ),
                        DataCell(
                          Container(
                            width: 80, // Set a maximum width for the cell
                            child: Text(
                              data.coordinates[0][2].toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          showEditIcon: false, // Hide edit icon for a better look
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _downloadCSV(context, coordinateDataList),
        tooltip: 'Download CSV',
        child: Icon(Icons.download),
      ),
    );
  }
}

// class DataTablePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data '),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DataTable(
//               columns: [
//                 DataColumn(
//                     label: Text(
//                   'Start Time',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 DataColumn(
//                     label: Text(
//                   'End Time',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 DataColumn(
//                     label: Text(
//                   'Status',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//               ],
//               rows: [
//                 DataRow(cells: [
//                   DataCell(Text('8:00:00')),
//                   DataCell(Text('10:00:00')),
//                   DataCell(Text('Grazing')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('10:00:01')),
//                   DataCell(Text('12:00:00')),
//                   DataCell(Text('Sleeping')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('12:00:02')),
//                   DataCell(Text('14:00:00')),
//                   DataCell(Text('Sitting')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('14:00:01')),
//                   DataCell(Text('18:00:00')),
//                   DataCell(Text('Running')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('18:00:02')),
//                   DataCell(Text('20:00:00')),
//                   DataCell(Text('Mooing')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('20:00:02')),
//                   DataCell(Text('24:00:00')),
//                   DataCell(Text('Sleeping')),
//                 ]),

//                 // Add more rows as needed
//               ],
//             ),
//             SizedBox(
//                 height:
//                     20), // Add some spacing between the table and the download button
//             ElevatedButton(
//               onPressed: () {
//                 // Add the download logic here
//                 print('Download button clicked!');
//               },
//               child: Text('Download'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TypewriterAnimatedText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  TypewriterAnimatedText(this.text, {required this.textStyle});

  @override
  _TypewriterAnimatedTextState createState() => _TypewriterAnimatedTextState();
}

class _TypewriterAnimatedTextState extends State<TypewriterAnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _animatedText = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: widget.text.length *
              150), // Adjust the duration as per your requirement
    );

    _controller.addListener(() {
      int currentLength = (_controller.value * widget.text.length).round();
      setState(() {
        _animatedText = widget.text.substring(0, currentLength);
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animatedText,
      style: widget.textStyle,
    );
  }
}
*/







/*



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:html' show AnchorElement, Blob, Url;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _firstTimeOpen = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: _firstTimeOpen ? 0 : 1,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(
                        //'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                        //size: 100
                        //'img.jpeg',
                        'data:image/png;base64,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',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: TypewriterAnimatedText(
                      'Mooofarm, Dairy ka kaam asaan kare ',
                      textStyle: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic)),
                ),
                SizedBox(height: 40),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Center(
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _firstTimeOpen = false;
                          });
                          // Navigate to the new page containing the login window
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeparatePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                        ),
                        child: Text('Continue',
                            style: (TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ))),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Animated Text
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Image.network(
                  width: 50,
                  height: 50,
                  'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeparatePage extends StatefulWidget {
  @override
  _SeparatePageState createState() => _SeparatePageState();
}

class _SeparatePageState extends State<SeparatePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();

    // Show the login window automatically
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: SizedBox(
            width: 300, // Set the width of the login dialog
            child: AnimatedLoginDialog(),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/109/109618.png',
            width:2,
            height:2,
          ),
        ),

        title: Text(' Login '),
      ),
    );
  }
}

/*
class AnimatedLoginDialog extends StatefulWidget {
  @override
  _AnimatedLoginDialogState createState() => _AnimatedLoginDialogState();
}

class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _callApiAndNavigate(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await apiCallFunction(email, password);
        // If the API call is successful, check the response for authentication
        if (response['authenticated'] == true) {
          // Login successful
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThirdPage()),
          );
        } else {
          // Show a snackbar or toast indicating that the email and password are incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid email or password!')),
          );
        }
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      // Show a snackbar or toast indicating that email and password are required
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email and password are required.')),
      );
    }
  }

  Future<Map<String, dynamic>> apiCallFunction(
      String email, String password) async {
    final response = await http.get(
      Uri.parse('https://your_api_url/authenticate?farmerId=$email&password=$password'),
    );

    if (response.statusCode == 200) {
      // If the API call is successful, parse the response data (assuming it's JSON)
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Moofarm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                'https://png.pngtree.com/png-vector/20191110/ourmid/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg',
                width: 70,
                height: 70,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter FarmerID',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _callApiAndNavigate(context),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Nodes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CustomFloatingWindow(
            nodeId: '1',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
          ),
          CustomFloatingWindow(
            nodeId: '2',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '3',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '4',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '5',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '6',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '7',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '8',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '9',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '10',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '11',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),

          // Add other CustomFloatingWindow widgets with different nodeIds
        ],
      ),
    );
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }
}
*/

//Second Page (contains farmer ID. password fields, Login, Register buttons and forget password link)
class AnimatedLoginDialog extends StatefulWidget {
  @override
  _AnimatedLoginDialogState createState() => _AnimatedLoginDialogState();
}

class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _openRegisterPage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return RegisterPage();
      },
    ).then((value) {
      // Handle the registration data here if needed.
      if (value != null) {
        // Data from registration page (if any).
        print('Registration data: $value');
        // You can do something with the registration data here.
        // For example, save it to a database or display it.
      }
    });
  }

  void _openForgetPasswordPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
    );
  }

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _callApiAndNavigate(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await apiCallFunction(email, password);
        // If the API call is successful, check the response for authentication
        if (response['authenticated'] == true) {
          // Login successful
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThirdPage()),
          );
        } else {
          // Show a snackbar or toast indicating that the email and password are incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid email or password!')),
          );
        }
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      // Show a snackbar or toast indicating that email and password are required
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email and password are required.')),
      );
    }
  }

  Future<Map<String, dynamic>> apiCallFunction(
      String email, String password) async {
    final response = await http.get(
      Uri.parse(
          'https://your_api_url/authenticate?farmerId=$email&password=$password'),
    );

    if (response.statusCode == 200) {
      // If the API call is successful, parse the response data (assuming it's JSON)
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Moofarm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                'https://png.pngtree.com/png-vector/20191110/ourmid/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg',
                width: 70,
                height: 70,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter FarmerID',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _callApiAndNavigate(context),
                child: Text('Login'),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => _openRegisterPage(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                ),
                child: Text('Register'),
              ),
              SizedBox(
                  height:
                  10), // Add space between the buttons and the text link
              TextButton(
                onPressed: () => _openForgetPasswordPage(context),
                child: Text(
                  'Forget Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Center(
        child: Text('Site under maintenance'),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reenterPasswordController = TextEditingController();

  String name = '';
  String email = '';
  String password = '';
  String reenterPassword = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _reenterPasswordController.dispose();
    super.dispose();
  }

  Future<void> _callApiAndRegister(BuildContext context) async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final reenterPassword = _reenterPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        reenterPassword.isEmpty) {
      // Show an error message if any field is left empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields!')),
      );
      return;
    }

    if (password != reenterPassword) {
      // Show an error message if passwords don't match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match!')),
      );
      return;
    }

    try {
      // Make the API call to store data in the database
      final response = await http.post(
        Uri.parse('https://your_api_url/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Registration successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful!')),
        );
        // You can also do further actions, such as navigating to another page.
        Navigator.pop(context);
      } else {
        // Show an error message if the API call fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to register. Please try again!')),
        );
      }
    } catch (error) {
      // Show an error message if an error occurs during the API call
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later!')),
      );
    }
  }

  @override
  /*
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Set User ID/Farmer ID',
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Set Password',
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _reenterPasswordController,
              decoration: InputDecoration(
                labelText: 'Re-enter Password',
              ),
              onChanged: (value) {
                setState(() {
                  reenterPassword = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (password == reenterPassword) {
                  // Passwords match, proceed with registration
                  Navigator.pop(context, {
                    'name': name,
                    'email': email,
                    'password': password,
                  });
                } else {
                  // Show an error message if passwords don't match
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Passwords do not match!')),
                  );
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
  */

  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Set User ID/Farmer ID',
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Set Password',
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _reenterPasswordController,
              decoration: InputDecoration(
                labelText: 'Re-enter Password',
              ),
              onChanged: (value) {
                setState(() {
                  reenterPassword = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _callApiAndRegister(context),
              /*onPressed: () {
                if (_nameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _passwordController.text.isEmpty ||
                    _reenterPasswordController.text.isEmpty) {
                  // Show an error message if any field is left empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all fields!')),
                  );
                } else if (password == reenterPassword) {
                  // Passwords match, proceed with registration
                  Navigator.pop(context, {
                    'name': name,
                    'email': email,
                    'password': password,
                  });
                } else {
                  // Show an error message if passwords don't match
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Passwords do not match!')),
                  );
                }
              },*/
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Text('Welcome to the Third Page!'),
      ),
    );
  }
}

class CustomFloatingWindow extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final String nodeId;
  final VoidCallback onButtonPressed;

  CustomFloatingWindow({
    required this.imagePath,
    required this.buttonText,
    required this.nodeId,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cow ID: $nodeId',
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: onButtonPressed,
                child: Text(buttonText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Add spacing below the button
            TableWidget(),
            SizedBox(height: 20),
            // Use the custom TableWidget to display the table
          ],
        ),
      ),
    );
  }
}

/*
class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Start Time',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        DataColumn(label: Text('End Time',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        DataColumn(label: Text('Status',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),

      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Grazing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Sleeing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Moowing')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Walking')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Urinating')),
        ]),
        DataRow(cells: [
          DataCell(Text('1690176712')),
          DataCell(Text('1690176912')),
          DataCell(Text('Running')),
        ]),

        // Add more rows as needed
      ],
    );
  }
}
*/

//Working epoch date and time controller
/*
class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int? epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int? epochTime2; // Variable to save the EPOCH time for the second selected date and time

  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }

  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 = DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 = DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _dateTimeController1,
          onTap: () => _selectDateTime(context, _dateTimeController1),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 1',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _dateTimeController2,
          onTap: () => _selectDateTime(context, _dateTimeController2),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 2',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDateTime(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}
*/

class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int?
  epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int?
  epochTime2; // Variable to save the EPOCH time for the second selected date and time

  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }

/*
    void _updateDateTime1() {
      if (_dateTimeController1.text.isNotEmpty) {
        final DateTime selectedDateTime1 =
        DateTime.parse(_dateTimeController1.text);
        setState(() {
          epochTime1 = selectedDateTime1.millisecondsSinceEpoch;

          print('Selected Date and Time 1 (EPOCH time): $epochTime1');
        });
      } else {
        setState(() {
          epochTime1 = null;
          print('Date and Time 1 not selected.');
        });
      }
    }

    void _updateDateTime2() {
      if (_dateTimeController2.text.isNotEmpty) {
        final DateTime selectedDateTime2 =
        DateTime.parse(_dateTimeController2.text);
        setState(() {
          epochTime2 = selectedDateTime2.millisecondsSinceEpoch;

          print('Selected Date and Time 2 (EPOCH time): $epochTime2');
        });
      } else {
        setState(() {
          epochTime2 = null;
          print('Date and Time 2 not selected.');
        });
      }
    }

    Future<void> _callApiAndNavigate(BuildContext context) async {
      if (epochTime1 != null && epochTime2 != null) {
        try {
          final response = await apiCallFunction(epochTime1!, epochTime2!);
          print(response);
          // Navigate to the DataTablePage and pass the API response data
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DataTablePage(response: response)),
          );
        } catch (error) {
          print('API Error: $error');
        }
      } else {
        print('Please select both Date and Time first.');
      }
    }

    // Replace this function with your actual API call implementation
    Future<Map<String, dynamic>> apiCallFunction(
        int epochTime1, int epochTime2) async {
      // Example: Making a simple GET request to an API endpoint

      final response = await http.get(Uri.https(
        'wcelyqvyi7.execute-api.us-east-1.amazonaws.com',
        '/deployment/cow',
        {
          'starttime': epochTime1,
          'endtime': epochTime2,
          'deviceId': '102',
        },
      ));

      if (response.statusCode == 200) {
        // If the API call is successful, parse the response data (assuming it's JSON)
        final jsonData = json.decode(response.body);
        return jsonData;
      } else {
        throw Exception('Failed to load data');
      }
    }


*/

  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 =
      DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 =
      DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  Future<void> _callApiAndNavigate(BuildContext context) async {
    if (epochTime1 != null && epochTime2 != null) {
      try {
        final response = await apiCallFunction(epochTime1!, epochTime2!);
        print(response);
        // Navigate to the DataTablePage and pass the API response data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataTablePage(response: response),
          ),
        );
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      print('Please select both Date and Time first.');
    }
  }

  Future<Map<String, dynamic>> apiCallFunction(
      int epochTime1, int epochTime2) async {
    // Example: Making a simple GET request to an API endpoint
    final response = await http.get(
      Uri.https(
        'wcelyqvyi7.execute-api.us-east-1.amazonaws.com',
        '/deployment/cow',
        {
          'starttime': epochTime1.toString(), // Convert to String
          'endtime': epochTime2.toString(), // Convert to String
          'deviceId': '102',
        },
      ),
    );

    if (response.statusCode == 200) {
      // If the API call is successful, parse the response data (assuming it's JSON)
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _dateTimeController1,
          onTap: () => _selectDateTime(context, _dateTimeController1),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select start date & time ',
            //suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _dateTimeController2,
          onTap: () => _selectDateTime(context, _dateTimeController2),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select end date & time',
            //suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        /*ElevatedButton(
          onPressed: () {
            // This is the function that will be called when the user submits the form
            // You can use epochTime1 and epochTime2 here as needed
            // For demonstration purposes, we are printing the epoch times to the console again
            if (epochTime1 != null) {
              print('Selected Date and Time 1 (EPOCH time): $epochTime1');
            } else {
              print('Date and Time 1 not selected.');
            }
            if (epochTime2 != null) {
              print('Selected Date and Time 2 (EPOCH time): $epochTime2');
            } else {
              print('Date and Time 2 not selected.');
            }
          },
          child: Text('Submit'), // Changed the button text to "Submit"
        ),*/
        ElevatedButton(
          onPressed: () => _callApiAndNavigate(context),
          child: Text('Submit'), // Changed the button text to "Submit"
        ),
      ],
    );
  }

  Future<void> _selectDateTime(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}

class CoordinateData {
  final List<List<double>> coordinates;
  final String deviceId;
  final String timestamp;

  CoordinateData({
    required this.coordinates,
    required this.deviceId,
    required this.timestamp,
  });

  factory CoordinateData.fromJson(Map<String, dynamic> json) {
    return CoordinateData(
      coordinates: List<List<double>>.from(json['coordinate'].map((coord) {
        return List<double>.from(coord.map((value) => double.parse(value)));
      })),
      deviceId: json['deviceId'],
      timestamp: json['timestamp'],
    );
  }
}

class DataTablePage extends StatelessWidget {
  final Map<String, dynamic> response;

  DataTablePage({required this.response});

  void _downloadCSV(BuildContext context, List<CoordinateData> dataList) async {
    List<List<dynamic>> dataAsListOfLists = dataList.map((data) {
      return [
        data.deviceId,
        data.timestamp,
        data.coordinates[0][0],
        data.coordinates[0][1],
        data.coordinates[0][2],
      ];
    }).toList();

    List<String> columnNames = ['Device ID', 'Timestamp', 'X', 'Y', 'Z'];
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
    final List<dynamic> dataList = json.decode(response['body']);
    final List<CoordinateData> coordinateDataList =
    dataList.map((data) => CoordinateData.fromJson(data)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Cow Coordinate Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
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
                      label: Text('X'),
                      tooltip: 'X Coordinate',
                    ),
                    DataColumn(
                      label: Text('Y'),
                      tooltip: 'Y Coordinate',
                    ),
                    DataColumn(
                      label: Text('Z'),
                      tooltip: 'Z Coordinate',
                    ),
                  ],
                  rows: coordinateDataList.map((data) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Container(
                            width: 30, // Set a maximum width for the cell
                            child: Text(
                              data.deviceId,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          showEditIcon:
                          false, // Hide edit icon for a better look
                        ),
                        DataCell(
                          Container(
                            width: 90, // Set a maximum width for the cell
                            child: Text(
                              data.timestamp,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          showEditIcon:
                          false, // Hide edit icon for a better look
                        ),
                        DataCell(
                          Container(
                            width: 40, // Set a maximum width for the cell
                            child: Text(
                              data.coordinates[0][0].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          showEditIcon:
                          false, // Hide edit icon for a better look
                        ),
                        DataCell(
                          Container(
                            width: 40, // Set a maximum width for the cell
                            child: Text(
                              data.coordinates[0][1].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          showEditIcon:
                          false, // Hide edit icon for a better look
                        ),
                        DataCell(
                          Container(
                            width: 40, // Set a maximum width for the cell
                            child: Text(
                              data.coordinates[0][2].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          showEditIcon:
                          false, // Hide edit icon for a better look
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _downloadCSV(context, coordinateDataList),
        tooltip: 'Download CSV',
        child: Icon(Icons.download),
      ),
    );
  }
}

// class DataTablePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data '),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DataTable(
//               columns: [
//                 DataColumn(
//                     label: Text(
//                   'Start Time',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 DataColumn(
//                     label: Text(
//                   'End Time',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 DataColumn(
//                     label: Text(
//                   'Status',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//               ],
//               rows: [
//                 DataRow(cells: [
//                   DataCell(Text('8:00:00')),
//                   DataCell(Text('10:00:00')),
//                   DataCell(Text('Grazing')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('10:00:01')),
//                   DataCell(Text('12:00:00')),
//                   DataCell(Text('Sleeping')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('12:00:02')),
//                   DataCell(Text('14:00:00')),
//                   DataCell(Text('Sitting')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('14:00:01')),
//                   DataCell(Text('18:00:00')),
//                   DataCell(Text('Running')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('18:00:02')),
//                   DataCell(Text('20:00:00')),
//                   DataCell(Text('Mooing')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('20:00:02')),
//                   DataCell(Text('24:00:00')),
//                   DataCell(Text('Sleeping')),
//                 ]),

//                 // Add more rows as needed
//               ],
//             ),
//             SizedBox(
//                 height:
//                     20), // Add some spacing between the table and the download button
//             ElevatedButton(
//               onPressed: () {
//                 // Add the download logic here
//                 print('Download button clicked!');
//               },
//               child: Text('Download'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TypewriterAnimatedText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  TypewriterAnimatedText(this.text, {required this.textStyle});

  @override
  _TypewriterAnimatedTextState createState() => _TypewriterAnimatedTextState();
}

class _TypewriterAnimatedTextState extends State<TypewriterAnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _animatedText = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: widget.text.length *
              150), // Adjust the duration as per your requirement
    );

    _controller.addListener(() {
      int currentLength = (_controller.value * widget.text.length).round();
      setState(() {
        _animatedText = widget.text.substring(0, currentLength);
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animatedText,
      style: widget.textStyle,
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:html' show AnchorElement, Blob, Url;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _firstTimeOpen = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: _firstTimeOpen ? 0 : 1,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(
                        //'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                        //size: 100
                        //'img.jpeg',
                        'data:image/png;base64,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',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: TypewriterAnimatedText(
                      'Mooofarm, Dairy ka kaam asaan kare ',
                      textStyle: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic)),
                ),
                SizedBox(height: 40),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Center(
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _firstTimeOpen = false;
                          });
                          // Navigate to the new page containing the login window
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeparatePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                        ),
                        child: Text('Continue',
                            style: (TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ))),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Animated Text
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Image.network(
                  width: 50,
                  height: 50,
                  'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeparatePage extends StatefulWidget {
  @override
  _SeparatePageState createState() => _SeparatePageState();
}

class _SeparatePageState extends State<SeparatePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();

    // Show the login window automatically
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: SizedBox(
            width: 300, // Set the width of the login dialog
            child: AnimatedLoginDialog(),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/109/109618.png',
            width:2,
            height:2,
          ),
        ),
        title: Text(' Login '),
      ),
    );
  }
}
/*
class AnimatedLoginDialog extends StatefulWidget {
  @override
  _AnimatedLoginDialogState createState() => _AnimatedLoginDialogState();
}

class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _callApiAndNavigate(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await apiCallFunction(email, password);
        // If the API call is successful, check the response for authentication
        if (response['authenticated'] == true) {
          // Login successful
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThirdPage()),
          );
        } else {
          // Show a snackbar or toast indicating that the email and password are incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid email or password!')),
          );
        }
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      // Show a snackbar or toast indicating that email and password are required
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email and password are required.')),
      );
    }
  }

  Future<Map<String, dynamic>> apiCallFunction(
      String email, String password) async {
    final response = await http.get(
      Uri.parse('https://your_api_url/authenticate?farmerId=$email&password=$password'),
    );

    if (response.statusCode == 200) {
      // If the API call is successful, parse the response data (assuming it's JSON)
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Moofarm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                'https://png.pngtree.com/png-vector/20191110/ourmid/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg',
                width: 70,
                height: 70,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter FarmerID',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _callApiAndNavigate(context),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Nodes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CustomFloatingWindow(
            nodeId: '1',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
          ),
          CustomFloatingWindow(
            nodeId: '2',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '3',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '4',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '5',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '6',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '7',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '8',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '9',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '10',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '11',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),

          // Add other CustomFloatingWindow widgets with different nodeIds
        ],
      ),
    );
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }
}
*/

class AnimatedLoginDialog extends StatefulWidget {
  @override
  _AnimatedLoginDialogState createState() => _AnimatedLoginDialogState();
}

class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _openRegisterPage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return RegisterPage();
      },
    ).then((value) {
      // Handle the registration data here if needed.
      if (value != null) {
        // Data from registration page (if any).
        print('Registration data: $value');
        // You can do something with the registration data here.
        // For example, save it to a database or display it.
      }
    });
  }

  void _openForgetPasswordPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
    );
  }

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _callLoginApi(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse(
              'https://fl9kq7k4gc.execute-api.us-east-1.amazonaws.com/farmerLogin'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"farmerId": email, "password": password}),
        );
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.body)),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThirdPage()),
          );
        } else if (response.statusCode == 401) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.body)),
          );
        } else if (response.statusCode == 404) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.body)),
          );
        }

        // If the API call is successful, check the response for authentication
        // if (response['authenticated'] == true) {
        //   // Login successful
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => ThirdPage()),
        //   );
        // } else {
        //   // Show a snackbar or toast indicating that the email and password are incorrect
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text('Invalid email or password!')),
        //   );
        // }
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      // Show a snackbar or toast indicating that email and password are required
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email and password are required.')),
      );
    }
  }

  // Future<Map<String, dynamic>> apiCallFunction(
  //     String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse(
  //         'https://fl9kq7k4gc.execute-api.us-east-1.amazonaws.com/farmerLogin'),
  //     headers: {"Content-Type": "application/json"},
  //     body: json.encode({"email": email, "password": password}),
  //   );
  //   if (response.statusCode == 200) {
  //     // If the API call is successful, parse the response data (assuming it's JSON)
  //     final jsonData = json.decode(response);
  //     return jsonData;
  //   } else {
  //     throw Exception('Failed to authenticate');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Moofarm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                'https://png.pngtree.com/png-vector/20191110/ourmid/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg',
                width: 70,
                height: 70,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter FarmerID',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _callLoginApi(context),
                child: Text('Login'),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => _openRegisterPage(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                ),
                child: Text('Register'),
              ),
              SizedBox(
                  height:
                  10), // Add space between the buttons and the text link
              TextButton(
                onPressed: () => _openForgetPasswordPage(context),
                child: Text(
                  'Forget Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/109/109618.png',
            width:2,
            height:2,
          ),
        ),
        title: Text('Forget Password'),
      ),
      body: Center(
        child: Text('Site under maintenance'),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reenterPasswordController = TextEditingController();

  String name = '';
  String email = '';
  String password = '';
  String reenterPassword = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _reenterPasswordController.dispose();
    super.dispose();
  }

  Future<void> _callApiAndRegister(BuildContext context) async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final reenterPassword = _reenterPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        reenterPassword.isEmpty) {
      // Show an error message if any field is left empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields!')),
      );
      return;
    }

    if (password != reenterPassword) {
      // Show an error message if passwords don't match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match!')),
      );
      return;
    }

    try {
      // Make the API call to store data in the database
      final response = await http.post(
          Uri.parse(
              'https://fl9kq7k4gc.execute-api.us-east-1.amazonaws.com/addNewFarmer'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"farmerId": email, "password": password}));

      if (response.statusCode == 200) {
        // Registration successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.body)),
        );
        Navigator.pop(context);
      } else {
        // Show an error message if the API call fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to register. Please try again!')),
        );
      }
    } catch (error) {
      // Show an error message if an error occurs during the API call
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later!')),
      );
    }
  }

  @override
  /*
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Set User ID/Farmer ID',
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Set Password',
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _reenterPasswordController,
              decoration: InputDecoration(
                labelText: 'Re-enter Password',
              ),
              onChanged: (value) {
                setState(() {
                  reenterPassword = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (password == reenterPassword) {
                  // Passwords match, proceed with registration
                  Navigator.pop(context, {
                    'name': name,
                    'email': email,
                    'password': password,
                  });
                } else {
                  // Show an error message if passwords don't match
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Passwords do not match!')),
                  );
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
  */

  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Set User ID/Farmer ID',
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Set Password',
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _reenterPasswordController,
              decoration: InputDecoration(
                labelText: 'Re-enter Password',
              ),
              onChanged: (value) {
                setState(() {
                  reenterPassword = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _callApiAndRegister(context),
              /*onPressed: () {
                if (_nameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _passwordController.text.isEmpty ||
                    _reenterPasswordController.text.isEmpty) {
                  // Show an error message if any field is left empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all fields!')),
                  );
                } else if (password == reenterPassword) {
                  // Passwords match, proceed with registration
                  Navigator.pop(context, {
                    'name': name,
                    'email': email,
                    'password': password,
                  });
                } else {
                  // Show an error message if passwords don't match
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Passwords do not match!')),
                  );
                }
              },*/
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}




/*
//Active nodes
class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/109/109618.png',
            width:2,
            height:2,
          ),
        ),
        title: Text('Active Nodes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CustomFloatingWindow(
            nodeId: '1',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
          ),
          CustomFloatingWindow(
            nodeId: '2',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '3',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '4',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '5',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '6',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '7',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '8',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '9',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '10',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),
          CustomFloatingWindow(
            nodeId: '11',
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
            /* content: Container(
              width: 100, // Set the desired width of the image
              height: 100, // Set the desired height of the image
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                fit: BoxFit.cover, // Set the desired image fit
              ),
            ),*/
          ),

          // Add other CustomFloatingWindow widgets with different nodeIds
        ],
      ),
    );
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }
}

//Active nodes cutomisation
class CustomFloatingWindow extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final String nodeId;
  final VoidCallback onButtonPressed;

  CustomFloatingWindow({
    required this.imagePath,
    required this.buttonText,
    required this.nodeId,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cow ID: $nodeId',
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: onButtonPressed,
                child: Text(buttonText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

*/




class Cow {
  final String nodeId;
  final String imagePath;
  Cow({required this.nodeId, required this.imagePath});
}

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}
/*
class _ThirdPageState extends State<ThirdPage> {
  List<Cow> cows = []; // List to store cow data

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    //final response = await http.get('https://l5i2o65d2i.execute-api.us-east-1.amazonaws.com/fetch_nodeIds?farmerId=gill_001'); // Replace with actual API URL
    final Uri apiUrl = Uri.parse('https://l5i2o65d2i.execute-api.us-east-1.amazonaws.com/fetch_nodeIds?farmerId=gill_001'); // Replace with actual API URL
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Cow> fetchedCows = [];
      for (var cowData in data) {
        fetchedCows.add(Cow(
          nodeId: cowData['nodeId'],
          imagePath: cowData['imagePath'],
        ));
      }
      setState(() {
        cows = fetchedCows; // Update the state with fetched cow data
      });
    } else {
      // Handle API error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/109/109618.png',
            width: 2,
            height: 2,
          ),
        ),
        title: Text('Active Nodes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: cows.map((cow) => CustomFloatingWindow(
          nodeId: cow.nodeId,
          imagePath: cow.imagePath,
          buttonText: 'Click Here',
          onButtonPressed: () {
            navigateToNewPage(context);
          },
        )).toList(),
      ),
    );
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }
}
*/

/*
class _ThirdPageState extends State<ThirdPage> {
  List<int> nodeIds = []; // List to store node IDs

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://l5i2o65d2i.execute-api.us-east-1.amazonaws.com/fetch_nodeIds?farmerId=gill_001')); // Replace with actual API URL
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final firstItem = data.first as Map<String, dynamic>;
      final nodeIdsList = firstItem['nodeId'] as List<dynamic>;
      setState(() {
        nodeIds = nodeIdsList.cast<int>(); // Convert nodeId List to List<int>
      });
    } else {
      // Handle API error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/109/109618.png',
            width: 2,
            height: 2,
          ),
        ),
        title: Text('Active Nodes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: nodeIds.asMap().entries.map((entry) {
          final index = entry.key;
          final nodeId = entry.value;
          return CustomFloatingWindow(
            nodeId: (index + 1).toString(), // Use index + 1 as the displayed ID
            imagePath:
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            buttonText: 'Click Here',
            onButtonPressed: () {
              navigateToNewPage(context);
            },
          );
        }).toList(),
      ),
      /*body: ListView(
        padding: EdgeInsets.all(16),
        children: nodeIds.map((nodeId) => CustomFloatingWindow(
          nodeId: nodeId.toString(), // Convert int to string
          imagePath:
          'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
          buttonText: 'Click Here',
          onButtonPressed: () {
            navigateToNewPage(context);
          },
        )).toList(),
      ),*/
    );
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }


}
*/


/*
class _ThirdPageState extends State<ThirdPage> {
  List<int> nodeIds = []; // List to store node IDs
  int currentPage = 0; // Current page index

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://l5i2o65d2i.execute-api.us-east-1.amazonaws.com/fetch_nodeIds?farmerId=gill_001')); // Replace with actual API URL
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final firstItem = data.first as Map<String, dynamic>;
      final nodeIdsList = firstItem['nodeId'] as List<dynamic>;
      setState(() {
        nodeIds = nodeIdsList.cast<int>(); // Convert nodeId List to List<int>
      });
    } else {
      // Handle API error
    }
  }

  List<int> getCurrentPageNodeIds() {
    final startIndex = currentPage * 10;
    final endIndex = (currentPage + 1) * 10;
    return nodeIds.sublist(startIndex, endIndex);
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

  @override
  Widget build(BuildContext context) {
    final currentPageNodeIds = getCurrentPageNodeIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Active Nodes'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: currentPageNodeIds.length,
        itemBuilder: (context, index) {
          final nodeId = currentPageNodeIds[index];
          return ListTile(
            leading: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg'),
            title: Text('Cow ID: $nodeId'),
            trailing: ElevatedButton(
              onPressed: () {
                navigateToNewPage(context);
              },
              child: Text('Click Here'),
            ),
          );
        },
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

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }
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
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cow ID: $nodeId',
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: onButtonPressed,
                child: Text(buttonText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/





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
    final response = await http.get(Uri.parse('https://l5i2o65d2i.execute-api.us-east-1.amazonaws.com/fetch_nodeIds?farmerId=gill_001')); // Replace with actual API URL
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final firstItem = data.first as Map<String, dynamic>;
      final nodeIdsList = firstItem['nodeId'] as List<dynamic>;
      setState(() {
        nodeIds = nodeIdsList.cast<int>(); // Convert nodeId List to List<int>
      });
    } else {
      // Handle API error
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
      final displayedCowId = i + (currentPage * 10) + 1; // Displayed cow ID (1, 2, 3, etc.)
      displayedCowIds.add(displayedCowId); // Add to the displayed cow IDs list
    }
  }

  @override
/*
  Widget build(BuildContext context) {
    final currentPageNodeIds = getCurrentPageNodeIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Active Nodes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: currentPageNodeIds.asMap().entries.map((entry) {
          final index = entry.key;
          final cowId = index + (currentPage * 10) + 1; // Adjust the cow ID calculation

          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CustomFloatingWindow(
              nodeId: cowId.toString(), // Use cowId as nodeId
              imagePath:
              'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg',
              buttonText: 'Click Here',
              onButtonPressed: () {
                print('Clicked on Cow ID: $cowId'); // Print the cow ID
                navigateToNewPage(context);
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Active Nodes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: displayedCowIds.map((displayedCowId) {
          final originalCowId = (displayedCowId - 1) + (currentPage * 10) + 101; // Original cow ID (101, 102, etc.)

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
                print('Clicked on Displayed Cow ID: $displayedCowId'); // Print displayed cow ID
                print('Original Cow ID: $originalCowId'); // Print original cow ID
                navigateToNewPage(context);
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
  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }
}



class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/109/109618.png',
            width:2,
            height:2,
          ),
        ),
        title: Text('Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Add spacing below the button
            TableWidget(),
            SizedBox(height: 20),
            // Use the custom TableWidget to display the table
          ],
        ),
      ),
    );
  }
}


//Working epoch date and time controller
/*
class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int? epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int? epochTime2; // Variable to save the EPOCH time for the second selected date and time

  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }

  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 = DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 = DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _dateTimeController1,
          onTap: () => _selectDateTime(context, _dateTimeController1),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 1',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _dateTimeController2,
          onTap: () => _selectDateTime(context, _dateTimeController2),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date and Time 2',
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDateTime(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}
*/

class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();

  int?
  epochTime1; // Variable to save the EPOCH time for the first selected date and time
  int?
  epochTime2; // Variable to save the EPOCH time for the second selected date and time

  @override
  void initState() {
    super.initState();
    // Add listeners to the text editing controllers to detect changes
    _dateTimeController1.addListener(() => _updateDateTime1());
    _dateTimeController2.addListener(() => _updateDateTime2());
  }

  @override
  void dispose() {
    _dateTimeController1.dispose();
    _dateTimeController2.dispose();
    super.dispose();
  }


  void _updateDateTime1() {
    if (_dateTimeController1.text.isNotEmpty) {
      final DateTime selectedDateTime1 =
      DateTime.parse(_dateTimeController1.text);
      setState(() {
        epochTime1 = selectedDateTime1.millisecondsSinceEpoch;
        print('Selected Date and Time 1 (EPOCH time): $epochTime1');
      });
    } else {
      setState(() {
        epochTime1 = null;
        print('Date and Time 1 not selected.');
      });
    }
  }

  void _updateDateTime2() {
    if (_dateTimeController2.text.isNotEmpty) {
      final DateTime selectedDateTime2 =
      DateTime.parse(_dateTimeController2.text);
      setState(() {
        epochTime2 = selectedDateTime2.millisecondsSinceEpoch;
        print('Selected Date and Time 2 (EPOCH time): $epochTime2');
      });
    } else {
      setState(() {
        epochTime2 = null;
        print('Date and Time 2 not selected.');
      });
    }
  }

  Future<void> _callApiAndNavigate(BuildContext context) async {
    if (epochTime1 != null && epochTime2 != null) {
      try {
        final response = await apiCallFunction(epochTime1!, epochTime2!);
        print(response);
        // Navigate to the DataTablePage and pass the API response data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataTablePage(response: response),
          ),
        );
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      print('Please select both Date and Time first.');
    }
  }

  Future<Map<String, dynamic>> apiCallFunction(
      int epochTime1, int epochTime2) async {
    // Example: Making a simple GET request to an API endpoint
    final response = await http.get(
      Uri.https(
        'wcelyqvyi7.execute-api.us-east-1.amazonaws.com',
        '/deployment/cow',
        {
          'starttime': epochTime1.toString(), // Convert to String
          'endtime': epochTime2.toString(), // Convert to String
          'deviceId': '102',
        },
      ),
    );

    if (response.statusCode == 200) {
      // If the API call is successful, parse the response data (assuming it's JSON)
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _dateTimeController1,
          onTap: () => _selectDateTime(context, _dateTimeController1),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select start date & time ',
            //suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _dateTimeController2,
          onTap: () => _selectDateTime(context, _dateTimeController2),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select end date & time',
            //suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        /*ElevatedButton(
          onPressed: () {
            // This is the function that will be called when the user submits the form
            // You can use epochTime1 and epochTime2 here as needed
            // For demonstration purposes, we are printing the epoch times to the console again
            if (epochTime1 != null) {
              print('Selected Date and Time 1 (EPOCH time): $epochTime1');
            } else {
              print('Date and Time 1 not selected.');
            }
            if (epochTime2 != null) {
              print('Selected Date and Time 2 (EPOCH time): $epochTime2');
            } else {
              print('Date and Time 2 not selected.');
            }
          },
          child: Text('Submit'), // Changed the button text to "Submit"
        ),*/
        ElevatedButton(
          onPressed: () => _callApiAndNavigate(context),
          child: Text('Submit'), // Changed the button text to "Submit"
        ),
      ],
    );
  }

  Future<void> _selectDateTime(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          controller.text = combinedDateTime.toString();
        });
      }
    }
  }
}

class CoordinateData {
  final List<List<double>> coordinates;
  final String deviceId;
  final String timestamp;

  CoordinateData({
    required this.coordinates,
    required this.deviceId,
    required this.timestamp,
  });

  factory CoordinateData.fromJson(Map<String, dynamic> json) {
    return CoordinateData(
      coordinates: List<List<double>>.from(json['coordinate'].map((coord) {
        return List<double>.from(coord.map((value) => double.parse(value)));
      })),
      deviceId: json['deviceId'],
      timestamp: json['timestamp'],
    );
  }
}






class DataTablePage extends StatelessWidget {
  final Map<String, dynamic> response;

  DataTablePage({required this.response});

  void _downloadCSV(BuildContext context, List<CoordinateData> dataList) async {
    List<List<dynamic>> dataAsListOfLists = dataList.map((data) {
      return [
        data.deviceId,
        data.timestamp,
        data.coordinates[0][0],
        data.coordinates[0][1],
        data.coordinates[0][2],
      ];
    }).toList();

    List<String> columnNames = ['Device ID', 'Timestamp', 'X', 'Y', 'Z'];
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
    final List<dynamic> dataList = json.decode(response['body']);
    final List<CoordinateData> coordinateDataList =
    dataList.map((data) => CoordinateData.fromJson(data)).toList();


    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/109/109618.png',
            width: 2,
            height: 2,
          ),
        ),
        title: Text('DataTable Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Cow Coordinate Data',
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
                        label: Text('X'),
                        tooltip: 'X Coordinate',
                      ),
                      DataColumn(
                        label: Text('Y'),
                        tooltip: 'Y Coordinate',
                      ),
                      DataColumn(
                        label: Text('Z'),
                        tooltip: 'Z Coordinate',
                      ),
                    ],
                    rows: coordinateDataList.map((data) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              width: 30,
                              child: Text(
                                data.deviceId,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 90,
                              child: Text(
                                data.timestamp,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                data.coordinates[0][0].toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                data.coordinates[0][1].toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            showEditIcon: false,
                          ),
                          DataCell(
                            Container(
                              width: 40,
                              child: Text(
                                data.coordinates[0][2].toString(),
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
        onPressed: () => _downloadCSV(context, coordinateDataList),
        tooltip: 'Download CSV',
        child: Image.network(
          //'https://png.pngtree.com/png-vector/20190223/ourmid/pngtree-down-glyph-black-icon-png-image_691473.jpg',
          'https://png.pngtree.com/png-vector/20190419/ourmid/pngtree-vector-down-arrow-icon-png-image_956433.jpg',
          width: 30,
          height:30,
        ),
      ),
    );
  }
}



// class DataTablePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data '),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DataTable(
//               columns: [
//                 DataColumn(
//                     label: Text(
//                   'Start Time',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 DataColumn(
//                     label: Text(
//                   'End Time',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 DataColumn(
//                     label: Text(
//                   'Status',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//               ],
//               rows: [
//                 DataRow(cells: [
//                   DataCell(Text('8:00:00')),
//                   DataCell(Text('10:00:00')),
//                   DataCell(Text('Grazing')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('10:00:01')),
//                   DataCell(Text('12:00:00')),
//                   DataCell(Text('Sleeping')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('12:00:02')),
//                   DataCell(Text('14:00:00')),
//                   DataCell(Text('Sitting')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('14:00:01')),
//                   DataCell(Text('18:00:00')),
//                   DataCell(Text('Running')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('18:00:02')),
//                   DataCell(Text('20:00:00')),
//                   DataCell(Text('Mooing')),
//                 ]),
//                 DataRow(cells: [
//                   DataCell(Text('20:00:02')),
//                   DataCell(Text('24:00:00')),
//                   DataCell(Text('Sleeping')),
//                 ]),

//                 // Add more rows as needed
//               ],
//             ),
//             SizedBox(
//                 height:
//                     20), // Add some spacing between the table and the download button
//             ElevatedButton(
//               onPressed: () {
//                 // Add the download logic here
//                 print('Download button clicked!');
//               },
//               child: Text('Download'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TypewriterAnimatedText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  TypewriterAnimatedText(this.text, {required this.textStyle});

  @override
  _TypewriterAnimatedTextState createState() => _TypewriterAnimatedTextState();
}

class _TypewriterAnimatedTextState extends State<TypewriterAnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _animatedText = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: widget.text.length *
              150), // Adjust the duration as per your requirement
    );

    _controller.addListener(() {
      int currentLength = (_controller.value * widget.text.length).round();
      setState(() {
        _animatedText = widget.text.substring(0, currentLength);
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animatedText,
      style: widget.textStyle,
    );
  }
}
