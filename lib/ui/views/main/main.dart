import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:music_app/data/provider/auth_provider.dart';
import 'package:music_app/data/provider/favourite_song_provider.dart';
import 'package:music_app/data/provider/home_provider.dart';
import 'package:music_app/data/provider/setting_provider.dart';
import 'package:music_app/ui/item_widget/bottom_navigation.dart';
import 'package:music_app/ui/views/login/login_view.dart';
import 'package:music_app/ui/views/sign_up/sign_up_view.dart';
import 'package:music_app/utils/app_locale.dart';
import 'package:provider/provider.dart';
import 'package:music_app/data/provider/app_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavSongProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthenProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;
  late SharedPreferences sharedPreferences;

  Future<void> initData() async{
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getBool("isENLanguage") != null){
      if(sharedPreferences.getBool("isENLanguage")!){
        localization.translate('en');
      }else{
        localization.translate('vi');
      }
    }else{
      sharedPreferences.setBool("isENLanguage", false);
    }
  }

  @override
  void initState() {
    super.initState();
    initData();
    context.read<HomeProvider>().getSongListData();
    localization.init(
        mapLocales: [
          const MapLocale('vi', AppLocale.VI),
          const MapLocale('en', AppLocale.EN),
        ],
        initLanguageCode: 'vi'
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
  }
  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      home: LoginView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomNavigationCustom().widgetOptions.elementAt(context.watch<AppProvider>().selectedIndexScreen),
        bottomNavigationBar: BottomNavigationCustom(),
      ),
    );
  }
}


