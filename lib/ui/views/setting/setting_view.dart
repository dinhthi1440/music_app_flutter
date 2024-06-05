import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:music_app/data/provider/setting_provider.dart';
import 'package:music_app/utils/app_locale.dart';
import 'package:music_app/utils/color_custom.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  FlutterLocalization localization = FlutterLocalization.instance;
  late SharedPreferences sharedPreferences;

  Future<void> setData() async{
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getBool("isENLanguage")!){
      localization.translate('vi');
      sharedPreferences.setBool("isENLanguage", false);
    }else{
      localization.translate('en');
      sharedPreferences.setBool("isENLanguage", true);
    }
  }

  bool isEN = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCustom.purpleBackground,
      appBar: AppBar(
        leading: const Icon(Icons.library_music, color: Colors.yellow,),
        title: const Text("Musici", style: TextStyle(
            color: Colors.pinkAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),),
        backgroundColor: ColorsCustom.purpleBackground,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://images2.thanhnien.vn/528068263637045248/2023/8/30/1-1693385246169701996465.jpg'),
                      radius: 30,
                    ),
                    SizedBox(width: 16,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Taylor swift", style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                        Text("@taylorswift", style: TextStyle(
                            color: Colors.white38,
                            fontSize: 14
                        ),)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {

                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                          color: Colors.orange,
                          width: 2
                      )
                  ),
                  child:  Text(AppLocale.editingPersonInfor.getString(context),
                    style: const TextStyle(
                      color: Colors.orange,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  setData();
                },
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.language, color: Colors.white,),
                          const SizedBox(width: 16),
                          Text(AppLocale.language.getString(context), style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14, )
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(
                        children: [
                          const Icon(Icons.dark_mode_outlined, color: Colors.white,),
                          const SizedBox(width: 16),
                          Text(AppLocale.backGrColor.getString(context),  style: const TextStyle(color: Colors.white))
                        ],
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: Provider.of<SettingProvider>(context).isDarkTheme,
                          activeColor: Colors.orange,
                          onChanged: (value) {
                            context.read<SettingProvider>().setDarkTheme(value);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(
                        children: [
                          Icon(Icons.notifications, color: Colors.white,),
                          SizedBox(width: 16),
                          Text(AppLocale.notification.getString(context),  style: TextStyle(color: Colors.white))
                        ],
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: context.watch<SettingProvider>().isNotification,
                          activeColor: Colors.orange,
                          onChanged: (value) {
                            context.read<SettingProvider>().setNotification(value);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.help, color: Colors.white,),
                          const SizedBox(width: 16),
                          Text(AppLocale.help.getString(context), style: const TextStyle(color: Colors.white),)
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14, )
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                },
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.info, color: Colors.white,),
                          const SizedBox(width: 16),
                          Text(AppLocale.information.getString(context), style: const TextStyle(color: Colors.white),)
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14, )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {

              },
              child: Text(AppLocale.logOut.getString(context), style: const TextStyle(
                  color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),),
            ),
          )
        ],
      ),
    );
  }
}
