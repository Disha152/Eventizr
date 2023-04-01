import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internet_folks/screens/event_details_screen.dart';
import 'package:internet_folks/screens/search_event_screen.dart';
import 'dart:convert';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Search_events(),
      initialRoute: 'home',
      routes: {
        'home':(context) => HomeScreen(),
        'details':(context) => Event_details(),
        'search':(context) => Search_events(),
      },
     
    );
  }
}


