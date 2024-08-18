import 'package:flutter/material.dart';
import 'package:neshkola_links/linkscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'neshkolavokala_istra',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF000000),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LinkScreen(),
    );
  }
}
