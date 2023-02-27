import 'package:flutter/material.dart';
import 'package:m1/maingrid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myscreen.dart';

Future<void> saveSignInInfo(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
  await prefs.setString('password', password);
}

// Retrieve sign in info
Future<Map<String, String>> getSignInInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String email = prefs.getString('email') ?? '';
  String password = prefs.getString('password') ?? '';
  return {'email': email, 'password': password};
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Retrieve sign in info and pre-fill email and password fields
    getSignInInfo().then((signInInfo) {
      setState(() {
        _emailController.text = signInInfo['email'] ?? '';
        _passwordController.text = signInInfo['password'] ?? '';
      });
      if (signInInfo['email'] != '' && signInInfo['password'] != '') {
        // If the user is signed in, redirect to the home page
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => TwoColumnCardScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Save sign in info when the user signs in
                saveSignInInfo(_emailController.text, _passwordController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TwoColumnCardScreen()),
                );
                // TODO: Handle sign in logic
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
