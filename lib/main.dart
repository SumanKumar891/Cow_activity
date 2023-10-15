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




// void main() {
//   runApp(MyApp());
// }

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
  //final _controller = PageController();

  // @override
  // void initState(){
  //   super.initState();
  //   TalsecCallback callback = TalsecCallback(
  //     androidcallback : androidCallback(
  //       onEmulatorDetected: () => print("Emulator Detected"),
  //       onFingerprintDetected: () => print("Fingerprint Detected"),
  //       onHookDetected: () => print("Hook detected"),
  //       onRootDetected: () => print("Root detected"),
  //       onTamperDetected: () => print("Tamper detected"),
  //
  //     ),
  //     onDebuggerDetected: () => print("Debugger Detected"),
  //   );
  //   TalsecConfig config  = TalsecConfig(
  //       androidConfig: AndroidConfig(
  //         expectedPackageName: '',
  //         expectedSigningCertificateHash: '',
  //       ),
  //       watcherMail: 'shubh2002jain@gmail.com'
  //   );
  //   TalsecApp(callback: callback, config: config).start();
  // }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return MaterialApp(
            title: 'Mooofarmsarthak',
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
        //backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text('Login Page'),
        //   actions: [
        //     IconButton(
        //       icon: Icon(
        //         _isDarkMode ? Icons.light_mode : Icons.dark_mode,
        //       ),
        //       onPressed: _toggleTheme,
        //     ),
        //   ],
        // ),
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

                  /*
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: SizedBox(
                        // Mooofarm logo size and img
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          //'data:image/png;base64,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',
                          'assets/images/mooofarmlogo.png',
                        ),
                      ),
                    ),
                  ),
                  */
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
                        //'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                        'assets/images/awadhlogo.png',
                        width: 55,
                        height: 55,
                      ),


                      TextButton(
                        onPressed: () => _changeLanguage(Locale('en')),
                        child:
                        Text(
                            'English',
                          style: GoogleFonts.kalam (
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )),),
                      ),

                      TextButton(
                        onPressed: () => _changeLanguage(Locale('hi')),
                        child: Text('हिंदी',
                          style: GoogleFonts.kalam (
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )),)
                      ),
                      TextButton(
                        onPressed: () => _changeLanguage(Locale('pa')),
                        child: Text('ਪੰਜਾਬੀ',
                          style: GoogleFonts.kalam (
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )),),
                      ),
                      IconButton(
                        icon: Icon(
                          _isDarkMode ? Icons.light_mode : Icons.dark_mode,
                        ),
                        onPressed: themeManager.toggleTheme,
                      ),
                    ],
                  ),
                ),
              ),


              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child:
              //     ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         primary: Colors.green,
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(70)),
              //       ),
              //       onPressed: downloadApkFile,
              //       child: Text('Download APP'),
              //     ),
              //   ),
              // ),
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
