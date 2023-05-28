import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Login Success',
          style: TextStyle(
              fontFamily: 'Ubuntu', fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
