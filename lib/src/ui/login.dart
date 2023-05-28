import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/components/gredient_button.dart';
import 'package:flutter_firebase_auth/src/ui/resister.dart';
import 'package:rive/rive.dart';

import '../components/input_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  late var isLoading = false;

  void validate() {
    if (email.value.text.trim() == '' || password.value.text.trim() == '') {
      return;
    }

    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        isLoading = false;
        signIn();
      });
    });
  }

  void signIn() {
    try {
      showCheck();

      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.value.text.trim(),
              password: password.value.text.trim())
          .then((value) => Navigator.of(context).pop());
    } catch (e) {
      debugPrint('에러');
    }
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
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
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
      children: [
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            child: InputField(
                controller: email,
                hintText: 'E-mail',
                prefixIcon: const Icon(Icons.email),
                obscure: false)),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            child: InputField(
              controller: password,
              hintText: 'password',
              prefixIcon: const Icon(Icons.lock),
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
      onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const Resister())),
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
