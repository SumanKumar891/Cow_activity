/*
Sarthak@2023
 */
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Login_register.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:freerasp/freerasp.dart';
//import 'package:freerasp/talsec_app.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';


export 'src/enums/enums.dart';
export 'src/errors/errors.dart';
export 'src/models/models.dart';
export 'src/talsec.dart';
export 'src/threat_callback.dart';
export 'src/typedefs.dart';
export 'src/utils/utils.dart' hide ConfigVerifier;


import 'terms_and_conditions_page.dart';
import 'help_and_support_page.dart';
import 'about_us_page.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  final config = TalsecConfig(
    // For Android
    androidConfig: AndroidConfig(
      packageName: 'test_web_app',
      signingCertHashes: [

        'NTE4ZDA3NmU2ZGNhZGVjZmFlNDVkMTI0M2RhNjAwOWU='
      ],
      supportedStores: ['some.other.store'],
    ),


    watcherMail: 'shubh2002jain@gmail.com',
    isProd: true,
  );

  final callback = ThreatCallback(
      onAppIntegrity: () => print("App integrity detected"),
      onObfuscationIssues: () => print("Obfuscation issues detected"),
      onDebug: () => print("Debugging detected"),
      onDeviceBinding: () => print("Device binding detected"),
      onDeviceID: () => print("Device ID detected"),
      onHooks: () => print("Hooks detected"),
      onPasscode: () => print("Passcode not set detected"),
      onPrivilegedAccess: () => print("Privileged access detected"),
      onSecureHardwareNotAvailable: () => print("Secure hardware not available detected"),
      onSimulator: () => print("Simulator detected"),
      onUnofficialStore: () => print("Unofficial store detected")
  );
  Talsec.instance.attachListener(callback);

  runApp(
    ChangeNotifierProvider<ThemeManager>(
      create: (_) => ThemeManager(),
      child: MyApp(),
    ),
  );
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
    if(Platform.isAndroid){
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  });

  await Talsec.instance.start(config);
}

class ThemeManager extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return MaterialApp(
            title: 'Mooofarm',
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.green, // Change the primary color
              primaryColorDark:
              Colors.green[700], // You can adjust the dark shade
              primaryColorLight:
              Colors.green[200], // You can adjust the light shade
            ),
            darkTheme: ThemeData.dark(),
            themeMode:
            themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: LoginPage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

//the very first page that appears on the screen with
//mooofarm logo and continue button
class AppLocalizations {
  Map<String, dynamic> localizedValues = {};
  Locale? locale;
}



//main class



class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> imagePaths = [
    'assets/images/mooofarmlogo.png',
    'assets/images/awadhlogo.png',
    'assets/images/mission.jpeg',
    'assets/images/iot-systems.jpeg',
    'assets/images/information-systems.jpeg',
    'assets/images/stubble-management-system.jpeg',
    'assets/images/nuclear-applications.jpeg',
    'assets/images/information-systems.jpeg',

  ];

  late Timer _timer;
//final _controller = PageController();


  bool _firstTimeOpen = true;

  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  late AppLocalizations _appLocalizations;
  Future<void> _loadLanguage(Locale locale) async {
    final jsonContent =
    await rootBundle.loadString('assets/${locale.languageCode}.json');
    final Map<String, dynamic> translations = json.decode(jsonContent);
    setState(() {
      _appLocalizations.localizedValues = translations;
      _appLocalizations.locale = locale;
    });
  }

  Locale _currentLocale = Locale('en');

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _currentLocale = newLocale;
    });
    _loadLanguage(_currentLocale);
  }

  @override
  void initState() {
    _appLocalizations = AppLocalizations(); // Initialize the instance
    _loadLanguage(_currentLocale);
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

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < imagePaths.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });



  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    //final PageController _pageController = PageController();
    //int _currentPage = 0;


    final _controller = PageController();

    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(

        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180, // Set the desired height for your container
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: imagePaths.length,
                      itemBuilder: (context, index) {
                        return Image.asset(imagePaths[index]);
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imagePaths.asMap().entries.map((entry) {
                      int index = entry.key;
                      return Container(
                        width: 12,
                        height: 12,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == _currentPage ? Colors.green : Colors.lightGreenAccent,
                        ),
                      );
                    }).toList(),
                  ),


                  SizedBox(height: 20),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: TypewriterAnimatedText(
                        _appLocalizations.localizedValues['welcome_message'],
                        textStyle: GoogleFonts.kalam (
                        textStyle: TextStyle(
                            fontSize: 20.0, fontStyle: FontStyle.italic )),
                    ),

                  ),
                  SizedBox(height: 40),
                  // Animations given for the fade appearing of continue button
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Center(
                      child: SizedBox(
                        width: 150,
                        height: 40,
                        child:
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _firstTimeOpen = false;
                            });
                            // Navigate to the new page containing the login window
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SeparatePage(_appLocalizations)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70)),
                          ),
                          child: Text(
                              _appLocalizations
                                  .localizedValues['continue_button'],
                              style: GoogleFonts.kalam (
                              textStyle: TextStyle(
                                fontSize: 21.0,
                                color: Colors.white,
                              )),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),






                ],
              ),




              Align(
                alignment: Alignment.topRight,
                child: BottomAppBar(
                  elevation: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/awadhlogo.png',
                        width: 55,
                        height: 55,
                      ),
                      TextButton(
                        onPressed: () => _changeLanguage(Locale('en')),
                        child: Text(
                          'English',
                          style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _changeLanguage(Locale('hi')),
                        child: Text(
                          'हिंदी',
                          style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _changeLanguage(Locale('pa')),
                        child: Text(
                          'ਪੰਜਾਬੀ',
                          style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'theme') {
                            themeManager.toggleTheme();
                          } else if (value == 'terms_and_conditions') {
                            // Navigate to the Terms and Conditions page
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionsPage()));
                          } else if (value == 'help_and_support') {
                            // Navigate to the Help and Support page
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HelpAndSupportPage()));
                          } else if (value == 'about_us') {
                            // Navigate to the About Us page
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: 'theme',
                              child: Text('Switch Theme'),
                            ),
                            PopupMenuItem(
                              value: 'about_us',
                              child: Text('About Us'),
                            ),

                            PopupMenuItem(
                              value: 'help_and_support',
                              child: Text('Help and Support'),
                            ),
                            PopupMenuItem(
                              value: 'terms_and_conditions',
                              child: Text('Terms and Conditions'),
                            ),

                          ];
                        },
                        child: Image.asset(
                          'assets/images/three_dots.png', // Replace with the actual path to your gear icon image
                          width: 65, // Set the width and height as needed
                          height: 65,
                        ),
                      ),
                    ],
                  ),
                ),
              ),






            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
  Widget _buildImage(String imagePath) {
    return Container(
      width: 150, // Adjust the width as needed
      height: 150, // Adjust the height as needed
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}



//function to download apk file
Future<void> downloadApkFile() async {
  // Get the external storage directory
  String directory = await getExternalStorageDirectory().then((value) => value!.path);


  String assetFilePath = 'assets/app.apk';

  // Create a file in the external storage directory
  String filePath = '$directory/mooofarm.apk';
  File file = File(filePath);

  // Check if the file already exists, and if not, copy it from assets
  if (!(await file.exists())) {
    ByteData data = await rootBundle.load(assetFilePath);
    List<int> bytes = data.buffer.asUint8List();
    await file.writeAsBytes(bytes);
  }

  // Use flutter_downloader to enqueue the download task
  final taskId = await FlutterDownloader.enqueue(
    url: '',
    savedDir: directory,
    fileName: 'mooofarm.apk',
    showNotification: true,
    openFileFromNotification: true,
  );
}



//auto typing text animation (Mooofarm, Diary ka kaam asaan kare)
class TypewriterAnimatedText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  TypewriterAnimatedText(this.text, {required this.textStyle});

  @override
  _TypewriterAnimatedTextState createState() => _TypewriterAnimatedTextState();
}

//auto typing text animation (Mooofarm, Diary ka kaam asaan kare)
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
  void didUpdateWidget(TypewriterAnimatedText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text) {
      _controller.reset();
      _animatedText = "";
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animatedText,
      style: widget.textStyle,
    );
  }
}
