import 'package:flutter/material.dart';

import 'cartPage.dart';
import 'welcomepage.dart';
import 'homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mym Bazar',
      home: WelcomePage(),
    );
  }
}
