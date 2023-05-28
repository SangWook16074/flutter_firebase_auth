import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Success',
              style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            ElevatedButton(onPressed: signOut, child: const Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
