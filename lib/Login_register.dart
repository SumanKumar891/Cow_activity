/*

    Sarthak @2023

 */

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'NodeList.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';

//this is the second page

class SeparatePage extends StatefulWidget {
  final AppLocalizations appLocalizations;
  SeparatePage(this.appLocalizations);
  @override
  _SeparatePageState createState() => _SeparatePageState(appLocalizations);
}

//login and register page context(page 2)
class _SeparatePageState extends State<SeparatePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;

  final AppLocalizations appLocalizations;
  _SeparatePageState(this.appLocalizations);
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
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;

      showDialog(
        context: context,
        builder: (context) => Center(
          child: SizedBox(
            //width: 400, // Set the width of the login dialog
            width: screenWidth * 0.8,
            height: screenHeight * 0.9,
            child: AnimatedLoginDialog(appLocalizations),
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
          child: Icon(Icons.arrow_back),
        ),
        //title: Text(appLocalizations.localizedValues[' ']),
      ),
    );
  }
}

//popped up animation or floating window for second page
class AnimatedLoginDialog extends StatefulWidget {
  final AppLocalizations appLocalizations;
  AnimatedLoginDialog(this.appLocalizations);
  @override
  _AnimatedLoginDialogState createState() => _AnimatedLoginDialogState();
}

/*


class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _openRegisterPage(
      BuildContext context, AppLocalizations appLocalizations) {
    showDialog(
      context: context,
      builder: (context) {
        return RegisterPage(appLocalizations);
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

  void _openForgetPasswordPage(
      BuildContext context, AppLocalizations appLocalizations) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ForgetPasswordPage(appLocalizations)),
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

  Future<void> _callLoginApi(
      BuildContext context, AppLocalizations appLocalizations) async {
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
            MaterialPageRoute(
                builder: (context) => ThirdPage(
                    email: email, appLocalizations: appLocalizations)),
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
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email and password are required.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          // width: screenWidth * 0.4,
          // height: screenHeight * 0.68,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.appLocalizations.localizedValues['login_page_welcome'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              //Icon(Icons.person),
              Image.asset(
                'assets/images/login.png',
                width : 80,
                height: 80,
              ),
              //SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: widget
                      .appLocalizations.localizedValues['enter_Farmer_ID'],
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText:
                      widget.appLocalizations.localizedValues['enter_password'],
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    _callLoginApi(context, widget.appLocalizations),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)),
                ),
                child: Text(widget.appLocalizations.localizedValues['login']),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () =>
                    _openRegisterPage(context, widget.appLocalizations),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)),
                ),
                child:
                    Text(widget.appLocalizations.localizedValues['register']),
              ),
              SizedBox(
                  height:
                      10), // Add space between the buttons and the text link
              TextButton(
                onPressed: () =>
                    _openForgetPasswordPage(context, widget.appLocalizations),
                child: Text(
                  widget.appLocalizations.localizedValues['forget_passwd'],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

//popped up animation or floating window for second page
class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _openRegisterPage(
      BuildContext context, AppLocalizations appLocalizations) {
    showDialog(
      context: context,
      builder: (context) {
        return RegisterPage(appLocalizations);
      },
    ).then((value) {
      if (value != null) {
        print('Registration data: $value');
      }
    });
  }

  void _openForgetPasswordPage(
      BuildContext context, AppLocalizations appLocalizations) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ForgetPasswordPage(appLocalizations)),
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

  Future<void> _callLoginApi(
      BuildContext context, AppLocalizations appLocalizations) async {
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
            MaterialPageRoute(
                builder: (context) => ThirdPage(
                    email: email, appLocalizations: appLocalizations)),
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
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email and password are required.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.appLocalizations.localizedValues['login_page_welcome'],
                style: GoogleFonts.kalam(
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/login.png',
                width: 80,
                height: 80,
              ),
              // TextFormField(
              //   controller: _emailController,
              //   decoration: InputDecoration(
              //     labelText:
              //     widget.appLocalizations.localizedValues['enter_Farmer_ID'],
              //   ),
              // ),
              TextFormField(
                controller: _emailController,
                style: GoogleFonts.kalam(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    //color: Colors.black,
                  ),
                ),
                decoration: InputDecoration(
                  labelText: widget
                      .appLocalizations.localizedValues['enter_Farmer_ID'],
                ),
              ),
              SizedBox(height: 20),

              // TextFormField(
              //   controller: _passwordController,
              //   decoration: InputDecoration(
              //     labelText:
              //     widget.appLocalizations.localizedValues['enter_password'],
              //     suffixIcon: IconButton(
              //       icon: Icon(
              //         _isPasswordVisible
              //             ? Icons.visibility
              //             : Icons.visibility_off,
              //       ),
              //       onPressed: () {
              //         setState(() {
              //           _isPasswordVisible = !_isPasswordVisible;
              //         });
              //       },
              //     ),
              //   ),
              //   obscureText: !_isPasswordVisible,
              // ),
              TextFormField(
                controller: _passwordController,
                style: GoogleFonts.kalam(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    //color: Colors.black,
                  ),
                ),
                decoration: InputDecoration(
                  labelText:
                      widget.appLocalizations.localizedValues['enter_password'],
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () =>
                    _callLoginApi(context, widget.appLocalizations),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)),
                ),
                child: Text(
                  widget.appLocalizations.localizedValues['login'],
                  style: GoogleFonts.kalam(
                      textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  )),
                ),
              ),
              SizedBox(height: 50),

              ElevatedButton(
                onPressed: () =>
                    _openRegisterPage(context, widget.appLocalizations),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)),
                ),
                child: Text(
                  widget.appLocalizations.localizedValues['register'],
                  style: GoogleFonts.kalam(
                      textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  )),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () =>
                    _openForgetPasswordPage(context, widget.appLocalizations),
                child: Text(
                  widget.appLocalizations.localizedValues['forget_passwd'],
                  style: GoogleFonts.kalam(
                      textStyle: TextStyle(fontSize: 16.0
                          //color: Colors.white,
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//forget password page, opens on clicking the highlighted forget password text link
class ForgetPasswordPage extends StatelessWidget {
  final AppLocalizations appLocalizations;
  ForgetPasswordPage(this.appLocalizations);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        // title: Text(appLocalizations.localizedValues['forget_passwd'],
        //   style: GoogleFonts.kalam (
        //       textStyle: TextStyle(
        //         fontSize: 16.0,
        //         //color: Colors.white,
        //       )
        //   ),
        // ),
      ),
      body: Center(
        child: Text(
          'Site under maintenance ~sarthak@2023',
          style: GoogleFonts.kalam(
              textStyle: TextStyle(
            fontSize: 20.0,
            // color: Colors.white,
          )),
        ),
      ),
    );
  }
}

//new farmer ID registeration
class RegisterPage extends StatefulWidget {
  final AppLocalizations appLocalizations;
  RegisterPage(this.appLocalizations);
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
        SnackBar(
            content: Text(
          'Passwords do not match!',
          style: GoogleFonts.kalam(
              textStyle: TextStyle(
            fontSize: 16.0,
            //color: Colors.white,
          )),
        )),
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
          SnackBar(
              content: Text(
            'Failed to register. Please try again!',
            style: GoogleFonts.kalam(
                textStyle: TextStyle(
              fontSize: 16.0,
              //color: Colors.white,
            )),
          )),
        );
      }
    } catch (error) {
      // Show an error message if an error occurs during the API call
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'An error occurred. Please try again later!',
          style: GoogleFonts.kalam(
              textStyle: TextStyle(
            fontSize: 16.0,
            //color: Colors.white,
          )),
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TextFormField(
            //   controller: _nameController,
            //   decoration: InputDecoration(
            //     labelText:
            //         widget.appLocalizations.localizedValues['enter_name'],
            //
            //   ),
            //   onChanged: (value) {
            //     setState(() {
            //       name = value;
            //     });
            //   },
            // ),
            TextFormField(
              controller: _nameController,
              style: GoogleFonts.kalam(
                textStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  //color: Colors.black,
                ),
              ),
              decoration: InputDecoration(
                labelText:
                    widget.appLocalizations.localizedValues['enter_name'],
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
              style: GoogleFonts.kalam(
                textStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  //color: Colors.black,
                ),
              ),
              decoration: InputDecoration(
                labelText:
                    widget.appLocalizations.localizedValues['set_farmer_id'],
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
              style: GoogleFonts.kalam(
                textStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  //color: Colors.black,
                ),
              ),
              decoration: InputDecoration(
                labelText:
                    widget.appLocalizations.localizedValues['set_Password'],
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
              style: GoogleFonts.kalam(
                textStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  //color: Colors.black,
                ),
              ),
              decoration: InputDecoration(
                labelText:
                    widget.appLocalizations.localizedValues['re_enter_passwd'],
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
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70)),
              ),
              child: Text(
                widget.appLocalizations.localizedValues['register'],
                style: GoogleFonts.kalam(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    //color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
