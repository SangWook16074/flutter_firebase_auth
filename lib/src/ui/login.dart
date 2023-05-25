import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/components/gredient_button.dart';

import '../components/input_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _title(),
              _input(),
              _button(),
              _signUp(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text('Sign In',
            style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 40,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _input() {
    return Column(
      children: const [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            child: InputField(
                hintText: 'E-mail',
                prefixIcon: Icon(Icons.email),
                obscure: false)),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            child: InputField(
              hintText: 'password',
              prefixIcon: Icon(Icons.lock),
              obscure: true,
              type: TextInputType.text,
            )),
      ],
    );
  }

  Widget _button() {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: GradientButton(
        width: double.infinity,
        height: 20,
      ),
    );
  }

  Widget _signUp() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'join us',
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
