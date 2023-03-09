//  flutter build apk --split-per-abi
import 'package:flutter/material.dart';
import 'package:m1/sigin.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_messaging.dart';
import 'myscreen.dart';

// Save sign in info

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: unused_local_variable
  FirebaseMessagingService messagingService = FirebaseMessagingService();
  await messagingService.setupFirebaseMessaging();
  String? token = await messagingService.getToken();

  // Subscribe to a topic
  messagingService.subscribeToTopic('test_topic');

  // Listen for push notifications
  messagingService.setupMessageHandler((Map<String, dynamic> message) {
    print('Received message: $message');
  });
  print(token);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
    );
  }
}
