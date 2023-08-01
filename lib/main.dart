
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
                  child: TypewriterAnimatedText('Mooofarm, Dairy ka kaam asaan krke ', textStyle: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)),
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
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Image.network(
                  width: 60,
                  height: 60,
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
                'https://play-lh.googleusercontent.com/3MFgunnGnKN0Spr8LoJ0GYB1QiZjypyNekoLsFtLu7_QibLpJBSrYWddPNnccpOYQ7yY=w240-h480-rw',
                //'https://m.media-amazon.com/images/I/41wR0kC65SL.jpg',
                //'https://thumbs.dreamstime.com/b/basic-rgb-143120196.jpg',
                //'https://previews.123rf.com/images/f1digitals/f1digitals1903/f1digitals190300771/120383221-vector-cartoon-illustration-of-punjabi-farmer-with-plough-isolated-on-white-background.jpg',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'FarmerID',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
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
            ElevatedButton(
              onPressed: () {
                // Add button click logic here
              },
              child: Text('Download '),
            ),// Use the custom TableWidget to display the table
          ],
        ),
      ),
    );
  }
}






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

