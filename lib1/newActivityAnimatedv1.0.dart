
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      begin: 0,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Image.network(
                  //'https://pbs.twimg.com/profile_images/1457950809623187463/N8F-A4xt_400x400.jpg',
                  //size: 100
                  'data:image/png;base64,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',
                ),
              ),
            ),
            SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
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
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

