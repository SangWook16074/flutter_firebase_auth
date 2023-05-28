import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/components/gredient_button.dart';
import 'package:flutter_firebase_auth/src/ui/home.dart';
import 'package:rive/rive.dart';

import '../components/input_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late var isLoading = false;

  void validate() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        isLoading = false;
        moveToNext();
      });
    });
  }

  void moveToNext() async {
    showCheck();
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const Home()));
    });
  }

  void showCheck() {
    showDialog(
        context: context,
        barrierColor: Colors.black26,
        builder: (context) => Center(
              child: _accept(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_title(), _input(), _button(), _signUp()],
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
                  fontWeight: FontWeight.bold))),
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
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GradientButton(
          onPressed: validate,
          width: double.infinity,
          height: 20,
          child: (isLoading) ? _loading() : _loginText()),
    );
  }

  Widget _signUp() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Sign Up',
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _loading() {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(color: Colors.white),
    );
  }

  Widget _accept() {
    return const SizedBox(
        width: 100,
        height: 100,
        child: RiveAnimation.asset('asset/riveasset/check_icon.riv'));
  }

  Widget _loginText() {
    return const Text(
      'Login',
      style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white),
    );
  }
}
