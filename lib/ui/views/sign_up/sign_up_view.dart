import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/data/firebase/firebase_auth_service.dart';
import 'package:music_app/data/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/color_custom.dart';
import '../../item_widget/item_input_text.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordAgain = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            backgroundColor: ColorsCustom.purpleBackground,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.library_music, color: Colors.yellow, size: 40,),
                      Text('Musici', style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      CustomPasswordField(icon: Icons.email_outlined,
                          labelText: "Email",isPassWord: false,textEditingController: email,),
                      const SizedBox(height: 16,),
                      CustomPasswordField(icon: Icons.lock_outline,
                          labelText: "Mật khẩu",isPassWord: true, textEditingController: password,),
                      const SizedBox(height: 16,),
                      CustomPasswordField(icon: Icons.lock_outline,
                          labelText: "Mật khẩu",isPassWord: true, textEditingController: passwordAgain,),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      context.read<AuthenProvider>().signUp(email.text, password.text);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Colors.teal
                      ),
                      child: const Text(
                        "Đăng ký",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Đã có tài khoản?  ", style: TextStyle(
                          color: Colors.white
                      ),),
                      InkWell(
                        child: const Text("Đăng nhập ", style: TextStyle(
                            color: Colors.white
                        ),),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )
                ],
              ),
            )
        )
    );
  }
}
