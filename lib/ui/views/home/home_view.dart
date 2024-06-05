import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive/hive.dart';
import 'package:music_app/data/database/favourite_song_db.dart';
import 'package:music_app/data/hive_data_store.dart';
import 'package:music_app/data/provider/app_provider.dart';
import 'package:music_app/entity/song_entity.dart';
import 'package:music_app/ui/views/home/album_view/album_view.dart';
import 'package:music_app/ui/views/home/singer_view/singer_detail_view.dart';
import 'package:music_app/ui/views/home/singer_view/singer_view.dart';
import 'package:music_app/ui/views/home/suggested_view/suggested_tabbar_view.dart';
import 'package:music_app/utils/app_locale.dart';
import 'package:music_app/utils/color_custom.dart';
import 'package:provider/provider.dart';
import '../../item_widget/item_player_home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FavouriteSongDB database = FavouriteSongDB.instance;
  final FlutterLocalization localization = FlutterLocalization.instance;
  TabBar get _tabBar => TabBar(
    labelColor: Colors.orange,
    unselectedLabelColor: Colors.white,
    tabs: [
      Tab(child: Text(AppLocale.suggest.getString(context)) ),
      Tab(child: Text(AppLocale.song.getString(context)),),
      Tab(child: Text(AppLocale.artist.getString(context)),),
      const Tab(child: Text("Albums"),),
    ],
    indicatorColor: Colors.orange,
    indicatorSize: TabBarIndicatorSize.tab,
  );

  Future<void> get()async{
    List<SongEntity> list = await database.getSongs();
    print("Thành phần đầu tiên: ${list.first.singer}");
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ColorsCustom.purpleBackground,
        appBar: AppBar(
          leading: const Icon(Icons.library_music, color: Colors.yellow,),
          title: InkWell(
            onTap: () {
              //get();
            },
            child: const Text('Musici', style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
          ),
          backgroundColor: ColorsCustom.purpleBackground,
          actions: <Widget>[
            InkWell(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Icon(Icons.search, size: 32, color: Colors.white,)),
              onTap: () {
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              color: ColorsCustom.purpleBackground,
              child: _tabBar,
            ),
          ),
        ),
        body:  Stack(
          children: [
            const TabBarView(
              children: [
                SuggestedTabBarView(),
                SuggestedTabBarView(),
                SingerView(),
                AlbumView(),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: context.watch<AppProvider>().isPlaying?PlayerHome(context.watch<AppProvider>().currentSong):null,
                )
            )
          ],
        ),
      )
    );
  }
}
