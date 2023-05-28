import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/gredient_button.dart';
import '../components/input_field.dart';
import '../root.dart';

class Resister extends StatefulWidget {
  const Resister({super.key});

  @override
  State<Resister> createState() => _ResisterState();
}

class _ResisterState extends State<Resister> {
  final email = TextEditingController();
  final password = TextEditingController();
  var isLoading = false;

  void signUp() {
    setState(() {
      isLoading = true;
    });
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.value.text.trim(),
              password: password.value.text.trim())
          .then((value) {
        setState(() {
          isLoading = false;
        });
        showResisterDialog();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint('에러');
    }
  }

  void showResisterDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('환영합니다 !'),
              content: const Text('회원가입을 완료했습니다 ! 확인 버튼을 클릭하면 로그인 화면으로 이동합니다.'),
              actions: [
                TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => const Root(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text('확인'))
              ],
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
            children: [_title(), _input(), _button()],
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
          child: Text('Sign Up',
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
          onPressed: signUp,
          width: double.infinity,
          height: 20,
          child: (isLoading) ? _loading() : _resisterText()),
    );
  }

  Widget _resisterText() {
    return const Text(
      'Resister',
      style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white),
    );
  }

  Widget _loading() {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(color: Colors.white),
    );
  }
}
