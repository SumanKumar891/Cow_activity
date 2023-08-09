import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'NodeList.dart';

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
          child: Icon(Icons.arrow_back),
        ),
        title: Text(' Login '),
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
            MaterialPageRoute(builder: (context) => ThirdPage(email: email)),
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
              Icon(Icons.person),
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
          child: Icon(Icons.arrow_back),
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
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
