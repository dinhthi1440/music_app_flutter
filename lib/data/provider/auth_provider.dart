import 'package:flutter/material.dart';

import '../firebase/firebase_auth_service.dart';

class AuthenProvider extends ChangeNotifier{
  bool isSignUp = false;

  Future<void> signUp(String email, String password) async{
    isSignUp = true;
    await FireBaseAuthService().signUp(email, password);
    isSignUp = false;
    notifyListeners();
  }
}