import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:music_app/data/provider/app_provider.dart';
import 'package:music_app/ui/views/favourite/favourite_view.dart';
import 'package:music_app/ui/views/home/home_view.dart';
import 'package:music_app/ui/views/playlist_view/playlist_view.dart';
import 'package:music_app/ui/views/setting/setting_view.dart';
import 'package:music_app/utils/app_locale.dart';
import 'package:provider/provider.dart';

import '../../utils/color_custom.dart';

class BottomNavigationCustom extends StatefulWidget {
  BottomNavigationCustom({super.key});
  static TextStyle optionStyle =
  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> widgetOptions = <Widget>[
    const HomeView(),
    const FavouriteView(),
    const PlaylistView(),
    const SettingView(),
  ];
  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {



  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocale.home.getString(context),
            backgroundColor: ColorsCustom.purpleBackground
        ),
        BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: AppLocale.favourite.getString(context),
            backgroundColor: ColorsCustom.purpleBackground
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.featured_play_list),
          label: "Playlist",
          backgroundColor: ColorsCustom.purpleBackground
        ),
        BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppLocale.setting.getString(context),
            backgroundColor: ColorsCustom.purpleBackground
        ),
      ],
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white60,
      currentIndex: context.watch<AppProvider>().selectedIndexScreen,
      onTap: (value) => context.read<AppProvider>().setCurrentScreen(value),
    );
  }
}
