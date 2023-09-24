/*
sarthak@2023
*/

// // /*
// //
// //     Sarthak @2023
// //
// //  */
// //
// //
// // //
// // // import 'package:flutter/material.dart';
// // // import 'Login_register.dart';
// // // import 'package:flutter_localizations/flutter_localizations.dart';
// // // import 'package:flutter/services.dart';
// // // import 'dart:convert';
// // //
// // // void main() {
// // //   runApp(MyApp());
// // // }
// // //
// // //
// // //
// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       theme: ThemeData(primarySwatch: Colors.green),
// // //       home: LoginPage(),
// // //       debugShowCheckedModeBanner: false,
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// // // //
// // // // class MyApp extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       localizationsDelegates: [
// // // //         GlobalMaterialLocalizations.delegate,
// // // //         GlobalWidgetsLocalizations.delegate,
// // // //         GlobalCupertinoLocalizations.delegate,
// // // //         // ... Other delegates ...
// // // //       ],
// // // //       supportedLocales: [
// // // //         const Locale('en'), // English
// // // //         const Locale('hi'), // Hindi
// // // //       ],
// // // //       theme: ThemeData(primarySwatch: Colors.green),
// // // //       home: LoginPage(),
// // // //       debugShowCheckedModeBanner: false,
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // //
// // // class LoginPage extends StatefulWidget {
// // //   @override
// // //   _LoginPageState createState() => _LoginPageState();
// // // }
// // //
// // // //the very first page that appears on the screen with
// // // //mooofarm logo and continue button
// // // // class _LoginPageState extends State<LoginPage>
// // // //     with SingleTickerProviderStateMixin {
// // // //   late AnimationController _animationController;
// // // //   late Animation<Offset> _slideAnimation;
// // // //   late Animation<double> _fadeAnimation;
// // // //
// // // //   bool _firstTimeOpen = true;
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     _animationController = AnimationController(
// // // //       vsync: this,
// // // //       duration: Duration(seconds: 1),
// // // //     );
// // // //
// // // //     _slideAnimation = Tween<Offset>(
// // // //       begin: Offset(0, 1),
// // // //       end: Offset.zero,
// // // //     ).animate(
// // // //       CurvedAnimation(
// // // //         parent: _animationController,
// // // //         curve: Curves.fastOutSlowIn,
// // // //       ),
// // // //     );
// // // //
// // // //     _fadeAnimation = Tween<double>(
// // // //       begin: _firstTimeOpen ? 0 : 1,
// // // //       end: 1,
// // // //     ).animate(
// // // //       CurvedAnimation(
// // // //         parent: _animationController,
// // // //         curve: Curves.easeIn,
// // // //       ),
// // // //     );
// // // //
// // // //     _animationController.forward();
// // // //     super.initState();
// // // //   }
// // // //
// // // //   @override
// // // //   void dispose() {
// // // //     _animationController.dispose();
// // // //     super.dispose();
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       body: SafeArea(
// // // //         child: Stack(
// // // //           children: [
// // // //             Column(
// // // //               mainAxisAlignment: MainAxisAlignment.center,
// // // //               children: [
// // // //                 FadeTransition(
// // // //                   opacity: _fadeAnimation,
// // // //                   child: SlideTransition(
// // // //                     position: _slideAnimation,
// // // //                     child: SizedBox(
// // // //                       //mooofarm logo size and img
// // // //                       width: 200,
// // // //                       height: 200,
// // // //                       child: Image.network(
// // // //                         //'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
// // // //                         //size: 100
// // // //                         //'img.jpeg',
// // // //                         'data:image/png;base64,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',
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 SizedBox(height: 20),
// // // //
// // // //                 FadeTransition(
// // // //                   opacity: _fadeAnimation,
// // // //                   child: TypewriterAnimatedText(
// // // //                       'Mooofarm, Dairy ka kaam asaan kare ',
// // // //                       textStyle: TextStyle(
// // // //                           fontSize: 20.0, fontStyle: FontStyle.italic)),
// // // //                 ),
// // // //                 SizedBox(height: 40),
// // // //
// // // //                 //animations given for the fade appearing of continue button
// // // //                 FadeTransition(
// // // //                   opacity: _fadeAnimation,
// // // //                   child: Center(
// // // //                     child: SizedBox(
// // // //                       width: 150,
// // // //                       height: 40,
// // // //                       child: ElevatedButton(
// // // //                         onPressed: () {
// // // //                           setState(() {
// // // //                             _firstTimeOpen = false;
// // // //                           });
// // // //                           // Navigate to the new page containing the login window
// // // //                           Navigator.push(
// // // //                             context,
// // // //                             MaterialPageRoute(
// // // //                                 builder: (context) => SeparatePage()),
// // // //                           );
// // // //                         },
// // // //                         style: ElevatedButton.styleFrom(
// // // //                           primary: Colors.green,
// // // //                           shape: RoundedRectangleBorder(
// // // //                               borderRadius: BorderRadius.circular(70)),
// // // //                         ),
// // // //                         child: Text('Continue',
// // // //                             style: (TextStyle(
// // // //                               fontSize: 18.0,
// // // //                               color: Colors.white,
// // // //                             ))),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 SizedBox(height: 20),
// // // //                 // Animated Text
// // // //               ],
// // // //             ),
// // // //             //on top left corner AWADH logo is placed
// // // //             Align(
// // // //               alignment: Alignment.topLeft,
// // // //               child: Container(
// // // //                 margin: EdgeInsets.all(16),
// // // //                 child: Image.network(
// // // //                   width: 50,
// // // //                   height: 50,
// // // //                   'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // // //
// // // //
// // // // class _LoginPageState extends State<LoginPage>
// // // //     with SingleTickerProviderStateMixin {
// // // //   late AnimationController _animationController;
// // // //   late Animation<Offset> _slideAnimation;
// // // //   late Animation<double> _fadeAnimation;
// // // //
// // // //   bool _firstTimeOpen = true;
// // // //   Locale _currentLocale = Locale('en'); // Default to English
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     _animationController = AnimationController(
// // // //       vsync: this,
// // // //       duration: Duration(seconds: 1),
// // // //     );
// // // //
// // // //     _slideAnimation = Tween<Offset>(
// // // //       begin: Offset(0, 1),
// // // //       end: Offset.zero,
// // // //     ).animate(
// // // //       CurvedAnimation(
// // // //         parent: _animationController,
// // // //         curve: Curves.fastOutSlowIn,
// // // //       ),
// // // //     );
// // // //
// // // //     _fadeAnimation = Tween<double>(
// // // //       begin: _firstTimeOpen ? 0 : 1,
// // // //       end: 1,
// // // //     ).animate(
// // // //       CurvedAnimation(
// // // //         parent: _animationController,
// // // //         curve: Curves.easeIn,
// // // //       ),
// // // //     );
// // // //
// // // //     _animationController.forward();
// // // //     super.initState();
// // // //   }
// // // //
// // // //   @override
// // // //   void dispose() {
// // // //     _animationController.dispose();
// // // //     super.dispose();
// // // //   }
// // // //
// // // //   void _toggleLanguage() {
// // // //     if (_currentLocale.languageCode == 'en') {
// // // //       _changeLanguage(Locale('hi')); // Switch to Hindi
// // // //     } else {
// // // //       _changeLanguage(Locale('en')); // Switch to English
// // // //     }
// // // //   }
// // // //
// // // //   void _changeLanguage(Locale newLocale) {
// // // //     setState(() {
// // // //       _currentLocale = newLocale;
// // // //     });
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       locale: _currentLocale, // Set the locale for this widget tree
// // // //       localizationsDelegates: [
// // // //         // ... Other delegates ...
// // // //       ],
// // // //       supportedLocales: [
// // // //         const Locale('en'),
// // // //         const Locale('hi'),
// // // //       ],
// // // //       theme: ThemeData(primarySwatch: Colors.green),
// // // //       home: Scaffold(
// // // //         backgroundColor: Colors.white,
// // // //         body: SafeArea(
// // // //           child: Stack(
// // // //             children: [
// // // //               // ... Your existing widget tree ...
// // // //
// // // //               // Button positioned at bottom right corner
// // // //               Align(
// // // //                 alignment: Alignment.bottomRight,
// // // //                 child: Padding(
// // // //                   padding: const EdgeInsets.all(16.0),
// // // //                   child: ElevatedButton(
// // // //                     onPressed: _toggleLanguage, // Toggle between English and Hindi
// // // //                     child: Text('Switch Language'),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       debugShowCheckedModeBanner: false,
// // // //     );
// // // //   }
// // // // }
// // // //
// // // //
// // //
// // //
// // //
// // //
// // //
// // //
// // // /*
// // // class _LoginPageState extends State<LoginPage>
// // //     with SingleTickerProviderStateMixin {
// // //   late AnimationController _animationController;
// // //   late Animation<Offset> _slideAnimation;
// // //   late Animation<double> _fadeAnimation;
// // //
// // //   bool _firstTimeOpen = true;
// // //
// // //   @override
// // //   void initState() {
// // //     _animationController = AnimationController(
// // //       vsync: this,
// // //       duration: Duration(seconds: 1),
// // //     );
// // //
// // //     _slideAnimation = Tween<Offset>(
// // //       begin: Offset(0, 1),
// // //       end: Offset.zero,
// // //     ).animate(
// // //       CurvedAnimation(
// // //         parent: _animationController,
// // //         curve: Curves.fastOutSlowIn,
// // //       ),
// // //     );
// // //
// // //     _fadeAnimation = Tween<double>(
// // //       begin: _firstTimeOpen ? 0 : 1,
// // //       end: 1,
// // //     ).animate(
// // //       CurvedAnimation(
// // //         parent: _animationController,
// // //         curve: Curves.easeIn,
// // //       ),
// // //     );
// // //
// // //     _animationController.forward();
// // //     super.initState();
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _animationController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       body: SafeArea(
// // //         child: Stack(
// // //           children: [
// // //             Column(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 FadeTransition(
// // //                   opacity: _fadeAnimation,
// // //                   child: SlideTransition(
// // //                     position: _slideAnimation,
// // //                     child: SizedBox(
// // //                       //mooofarm logo size and img
// // //                       width: 200,
// // //                       height: 200,
// // //                       child: Image.network(
// // //                         'data:image/png;base64,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',
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 20),
// // //
// // //                 FadeTransition(
// // //                   opacity: _fadeAnimation,
// // //                   child: Text(
// // //                     'Mooofarm, Dairy ka kaam asaan kare',
// // //                     style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 40),
// // //
// // //                 //animations given for the fade appearing of continue button
// // //                 FadeTransition(
// // //                   opacity: _fadeAnimation,
// // //                   child: Center(
// // //                     child: SizedBox(
// // //                       width: 150,
// // //                       height: 40,
// // //                       child: ElevatedButton(
// // //                         onPressed: () {
// // //                           setState(() {
// // //                             _firstTimeOpen = false;
// // //                           });
// // //                           // Navigate to the new page containing the login window
// // //                           Navigator.push(
// // //                             context,
// // //                             MaterialPageRoute(
// // //                               builder: (context) => SeparatePage(),
// // //                             ),
// // //                           );
// // //                         },
// // //                         style: ElevatedButton.styleFrom(
// // //                           primary: Colors.green,
// // //                           shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(70),
// // //                           ),
// // //                         ),
// // //                         child: Text(
// // //                           'Continue',
// // //                           style: TextStyle(
// // //                             fontSize: 18.0,
// // //                             color: Colors.white,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 20),
// // //                 // Animated Text
// // //               ],
// // //             ),
// // //             //on top left corner AWADH logo is placed
// // //             Align(
// // //               alignment: Alignment.topLeft,
// // //               child: Container(
// // //                 margin: EdgeInsets.all(16),
// // //                 child: Image.network(
// // //                   'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
// // //                   width: 50,
// // //                   height: 50,
// // //                 ),
// // //               ),
// // //             ),
// // //             // Button positioned at bottom right corner
// // //             Align(
// // //               alignment: Alignment.bottomRight,
// // //               child: Padding(
// // //                 padding: const EdgeInsets.all(16.0),
// // //                 child: ElevatedButton(
// // //                   onPressed: () {
// // //                     // Handle button press
// // //                   },
// // //                   child: Text('Button'),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // */
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // // class _LoginPageState extends State<LoginPage>
// // //     with SingleTickerProviderStateMixin {
// // //   late AnimationController _animationController;
// // //   late Animation<Offset> _slideAnimation;
// // //   late Animation<double> _fadeAnimation;
// // //
// // //   bool _firstTimeOpen = true;
// // //   String _currentLanguage = 'english';
// // //
// // //   // Function to change the language
// // //   void _changeLanguage() {
// // //     setState(() {
// // //       _currentLanguage = _currentLanguage == 'english' ? 'hindi' : 'english';
// // //     });
// // //   }
// // //
// // //   @override
// // //   void initState() {
// // //     _animationController = AnimationController(
// // //       vsync: this,
// // //       duration: Duration(seconds: 1),
// // //     );
// // //
// // //     _slideAnimation = Tween<Offset>(
// // //       begin: Offset(0, 1),
// // //       end: Offset.zero,
// // //     ).animate(
// // //       CurvedAnimation(
// // //         parent: _animationController,
// // //         curve: Curves.fastOutSlowIn,
// // //       ),
// // //     );
// // //
// // //     _fadeAnimation = Tween<double>(
// // //       begin: _firstTimeOpen ? 0 : 1,
// // //       end: 1,
// // //     ).animate(
// // //       CurvedAnimation(
// // //         parent: _animationController,
// // //         curve: Curves.easeIn,
// // //       ),
// // //     );
// // //
// // //     _animationController.forward();
// // //     super.initState();
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _animationController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       body: SafeArea(
// // //         child: Stack(
// // //           children: [
// // //             Column(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 FadeTransition(
// // //                   opacity: _fadeAnimation,
// // //                   child: SlideTransition(
// // //                     position: _slideAnimation,
// // //                     child: SizedBox(
// // //                       // Mooofarm logo size and image
// // //                       width: 200,
// // //                       height: 200,
// // //                       child: Image.asset(
// // //                         'assets/logo.png',
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 20),
// // //
// // //                 FadeTransition(
// // //                   opacity: _fadeAnimation,
// // //                   child: Text(
// // //                     AppLocalizations.of(context)!.translate('welcome_message'),
// // //                     style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 40),
// // //
// // //                 // Animations given for the fade appearing of the continue button
// // //                 FadeTransition(
// // //                   opacity: _fadeAnimation,
// // //                   child: Center(
// // //                     child: SizedBox(
// // //                       width: 150,
// // //                       height: 40,
// // //                       child: ElevatedButton(
// // //                         onPressed: () {
// // //                           setState(() {
// // //                             _firstTimeOpen = false;
// // //                           });
// // //                           // Navigate to the new page containing the login window
// // //                           Navigator.push(
// // //                             context,
// // //                             MaterialPageRoute(
// // //                               builder: (context) => LoginPage(), // Change this to your login page
// // //                             ),
// // //                           );
// // //                         },
// // //                         style: ElevatedButton.styleFrom(
// // //                           primary: Colors.green,
// // //                           shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(70),
// // //                           ),
// // //                         ),
// // //                         child: Text(
// // //                           AppLocalizations.of(context)!.translate('continue_button'),
// // //                           style: TextStyle(
// // //                             fontSize: 18.0,
// // //                             color: Colors.white,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 20),
// // //                 // Animated Text
// // //               ],
// // //             ),
// // //             // On the top left corner, AWADH logo is placed
// // //             Align(
// // //               alignment: Alignment.topLeft,
// // //               child: Container(
// // //                 margin: EdgeInsets.all(16),
// // //                 child: Image.network(
// // //                   'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
// // //                   width: 50,
// // //                   height: 50,
// // //                 ),
// // //               ),
// // //             ),
// // //             // Language switch button positioned at the bottom left corner
// // //             Align(
// // //               alignment: Alignment.bottomLeft,
// // //               child: Padding(
// // //                 padding: const EdgeInsets.all(16.0),
// // //                 child: ElevatedButton(
// // //                   onPressed: _changeLanguage,
// // //                   child: Text('Switch Language'),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // // class SeparatePage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // Build your SeparatePage content here
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Separate Page'),
// // //       ),
// // //       body: Center(
// // //         child: Text('This is a separate page'),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // // //auto typing text animation (Mooofarm, Diary ka kaam asaan kare)
// // // class TypewriterAnimatedText extends StatefulWidget {
// // //   final String text;
// // //   final TextStyle textStyle;
// // //
// // //   TypewriterAnimatedText(this.text, {required this.textStyle});
// // //
// // //   @override
// // //   _TypewriterAnimatedTextState createState() => _TypewriterAnimatedTextState();
// // // }
// // //
// // //
// // // //auto typing text animation (Mooofarm, Diary ka kaam asaan kare)
// // // class _TypewriterAnimatedTextState extends State<TypewriterAnimatedText>
// // //     with SingleTickerProviderStateMixin {
// // //   late AnimationController _controller;
// // //   String _animatedText = "";
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _controller = AnimationController(
// // //       vsync: this,
// // //       duration: Duration(
// // //           milliseconds: widget.text.length *
// // //               150), // Adjust the duration as per your requirement
// // //     );
// // //
// // //     _controller.addListener(() {
// // //       int currentLength = (_controller.value * widget.text.length).round();
// // //       setState(() {
// // //         _animatedText = widget.text.substring(0, currentLength);
// // //       });
// // //     });
// // //
// // //     _controller.forward();
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _controller.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Text(
// // //       _animatedText,
// // //       style: widget.textStyle,
// // //     );
// // //   }
// // // }
// //
// //
// //
// //
// //
// //
// // import 'package:flutter/material.dart';
// //
// // import 'package:flutter_localizations/flutter_localizations.dart';
// //
// //
// // void main() {
// //   runApp(MyApp());
// //
// // }
// //
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       localizationsDelegates: [
// //         GlobalMaterialLocalizations.delegate,
// //         GlobalWidgetsLocalizations.delegate,
// //       ],
// //       supportedLocales: [
// //         const Locale('en', 'US'),
// //         const Locale('fr', 'FR'),
// //       ],
// //       home: MyHomePage(),
// //     );
// //   }
// //
// // }
// //
// //
// // class MyHomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('My App')),
// //       body: Center(
// //         child: ElevatedButton(
// //           child: Text('Change Language'),
// //           onPressed: () {
// //             // Change the locale of the widget using the Localizations widget
// //             Localizations.of(context, Localizations).setLocale(Locale('fr', 'FR'));
// //
// //             // Call the setState method to notify the framework that the state of the widget has changed
// //             setState(() {});
// //           },
// //         ),
// //       ),
// //     );
// //   }
// //
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:translator/translator.dart';
// import 'package:google_translator/google_translator.dart';
//
//
// void main()
// {
//   runApp(
//       MaterialApp(
//         home: App(),
//       )
//   );
//
// }
//
// class App extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }
//
//
//
// // class _AppState extends State<App> {
// //   final GoogleTranslator translator = GoogleTranslator();
// //   String originalText = ''; // Store the original text
// //   String translatedText = ''; // Store the translated text
// //
// //   void trans() {
// //     String inputText = originalText;
// //     translator.translate(inputText, to: 'de').then((translation) {
// //       setState(() {
// //         translatedText = translation.text;
// //       });
// //       print('Input Text: $inputText');
// //       print('Translated Text: $translatedText');
// //     });
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     originalText = "This is the default text on the page."; // Initialize the original text
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Translate !!"),
// //       ),
// //       body: Container(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           children: <Widget>[
// //             Text(originalText), // Display the original text
// //             SizedBox(height: 16.0),
// //             ElevatedButton(
// //               child: const Text("Translate to German"),
// //               onPressed: trans,
// //             ),
// //             SizedBox(height: 16.0),
// //             Text("Translated Text: $translatedText"),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// //
// // class _AppState extends State<App> {
// //   final GoogleTranslator translator = GoogleTranslator();
// //   String originalText = ''; // Store the original text
// //
// //   void trans() {
// //     String inputText = originalText;
// //     translator.translate(inputText, to: 'de').then((translation) {
// //       setState(() {
// //         originalText = translation.text; // Update originalText with translated text
// //       });
// //       print('Input Text: $inputText');
// //       print('Translated Text: $originalText');
// //     });
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     originalText = "This is the default text on the page."; // Initialize the original text
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Translate !!"),
// //       ),
// //       body: Container(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           children: <Widget>[
// //             Text(originalText), // Display the original text
// //             SizedBox(height: 16.0),
// //             ElevatedButton(
// //               child: const Text("Translate to German"),
// //               onPressed: trans,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class _AppState extends State<App> {
//   final GoogleTranslator translator = GoogleTranslator();
//   String originalText = ''; // Store the original text
//
//   void trans() {
//     translator.translate(originalText, to: 'de').then((translation) {
//       setState(() {
//         originalText = translation.text; // Update originalText with translated text
//       });
//       print('Input Text: $originalText');
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     originalText =
//     "This is some example text. It can be dynamically fetched from various widgets on the page.";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Translate !!"),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               children: <Widget>[
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Text(originalText), // Display the original text
//                   ),
//                 ),
//                 Text(
//                   "Some more example text here.",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                 onPressed: trans,
//                 child: Text("Translate to German"),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'Login_register.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),

      //theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
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

  bool _isDarkMode = false;




  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }


  bool _firstTimeOpen = true;



  late AppLocalizations _appLocalizations;
  Future<void> _loadLanguage(Locale locale) async {
    final jsonContent =
    await rootBundle.loadString('assets/${locale.languageCode}.json');
    final Map<String, dynamic> translations = json.decode(jsonContent);
    // print(translations);
    setState(() {
      _appLocalizations.localizedValues = translations;
      _appLocalizations.locale = locale;
    });
    print(_appLocalizations.localizedValues);
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
                      //mooofarm logo size and img
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
                      _appLocalizations.localizedValues['welcome_message'],
                      textStyle: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic)),
                ),
                SizedBox(height: 40),

                //animations given for the fade appearing of continue button
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
            //on top left corner AWADH logo is placed
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Container(
            //     margin: EdgeInsets.all(16),
            //     child: Image.network(
            //       width: 50,
            //       height: 50,
            //       'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.topRight,
              child: BottomAppBar(
                elevation: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                      width: 50,
                      height: 50,
                    ),
                    TextButton(
                      onPressed: () => _changeLanguage(Locale('en')),
                      child: Text('English'),
                    ),
                    TextButton(
                      onPressed: () => _changeLanguage(Locale('hi')),
                      child: Text('हिंदी'),
                    ),
                    TextButton(
                      onPressed: () => _changeLanguage(Locale('pa')),
                      child: Text('ਪੰਜਾਬੀ'),

                    ),

                    ElevatedButton(
                      onPressed: _toggleTheme,
                      child: Text(_isDarkMode ? 'Switch to Light Theme' : 'Switch to Dark Theme'),
                    ),


                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      /*
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => _changeLanguage(Locale('en')),
              child: Text('English'),
            ),
            TextButton(
              onPressed: () => _changeLanguage(Locale('hi')),
              child: Text('हिंदी'),
            ),
            TextButton(
              onPressed: () => _changeLanguage(Locale('pa')),
              child: Text('ਪੰਜਾਬੀ'),
            ),
          ],
        ),
      ),
      */
    );
  }
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
