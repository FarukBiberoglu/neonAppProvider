import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/homePage.dart';
import 'package:untitled5/model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CommunicationProvider(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

