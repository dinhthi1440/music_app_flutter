import 'package:flutter/material.dart';
import 'package:music_app/ui/views/sign_up/sign_up_view.dart';
import 'package:music_app/utils/color_custom.dart';

import '../../item_widget/item_input_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                        labelText: "Email",isPassWord: false, textEditingController: email,),
                      SizedBox(height: 16,),
                      CustomPasswordField(icon: Icons.lock_outline,
                        labelText: "Mật khẩu",isPassWord: true, textEditingController: password,),
                    ],
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Colors.teal
                      ),
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Or connect with",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 8,),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 1, // Border width
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Image(
                            image: AssetImage("assets/images/google.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Chưa có tài khoản?  ", style: TextStyle(
                          color: Colors.white
                      ),),
                      InkWell(
                        child: const Text("Đăng ký", style: TextStyle(
                            color: Colors.white
                        ),),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpView(),));
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
