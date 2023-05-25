import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final double width;
  final double height;
  const GradientButton({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Positioned.fill(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.blue,
              Colors.lightBlue,
            ],
          )),
          child: const Center(
            child: Text(
              'Login',
              style: TextStyle(
                  fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
