import 'package:flutter/material.dart';

class PaymetType extends StatelessWidget {
  const PaymetType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Comming Soon',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
