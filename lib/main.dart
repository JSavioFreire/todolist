import 'package:flutter/material.dart';

import 'screens/bottom_navigation_bar/bottom_navigation_bar.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.blue[50],
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          )),
      home: const BottomNavigationBarCustom(),
    );
  }
}
