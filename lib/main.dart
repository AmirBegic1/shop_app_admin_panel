import 'dart:io';

import 'package:buy_and_sell_admin_panel/views/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid
          ? FirebaseOptions(
              apiKey: "AIzaSyB2TB4ALN36fnWof4ktXvFKyCPaRbEYYDY",
              appId: "1:14264552245:web:f313698ca05da5738d5a7c",
              messagingSenderId: "14264552245",
              projectId: "shop-app-f27dd",
              storageBucket: "shop-app-f27dd.appspot.com",
            )
          : null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
