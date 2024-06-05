import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FireBaseAuthService{

  Future<void> logIn() async {
    await Firebase.initializeApp();
  }

  Future<void> signUp(String email, String password) async {
    try{
      final userCreate = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      print("Thành công");
    }on FirebaseAuthException catch (e){
      print("Lỗi" + e.toString());
    }
  }
}