import 'package:flutter_firebase_auth/src/constants/firebase_const.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print('Error');
    }
  }
}
