import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:music_app/data/provider/favourite_song_provider.dart';
import 'package:music_app/ui/item_widget/item_song_favourite.dart';
import 'package:music_app/utils/app_locale.dart';
import 'package:music_app/utils/color_custom.dart';
import 'package:provider/provider.dart';

import '../../../entity/song_entity.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  late List<SongEntity> listSong;
  @override
  Widget build(BuildContext context) {
    context.read<FavSongProvider>().getListSong();
    context.watch<FavSongProvider>().isLoading?listSong=[]:listSong = context.watch<FavSongProvider>().listSongFav;
    Color addedDayColor = context.watch<FavSongProvider>().isAddedDay?Colors.orange:Colors.white;
    return Scaffold(
      backgroundColor: ColorsCustom.purpleBackground,
      appBar: AppBar(
        leading: const Icon(Icons.library_music, color: Colors.yellow,),
        title: Text(AppLocale.favourite.getString(context), style: const TextStyle(
            color: Colors.pinkAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),),
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
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                    color: context.watch<FavSongProvider>().isShuffle?Colors.orange:Colors.grey[500],
                    borderRadius: const BorderRadius.all(Radius.circular(25))
                  ),
                  child: InkWell(
                    onTap: () {
                      context.read<FavSongProvider>().setShuffle();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shuffle, color: Colors.white, size: 18,),
                        SizedBox(width: 8,),
                        Text("Ngẫu nhiên", style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                    color: context.watch<FavSongProvider>().isShuffle?Colors.grey[500]:Colors.orange,
                    borderRadius: const BorderRadius.all(Radius.circular(25))
                  ),
                  child: InkWell(
                    onTap: () {
                      context.read<FavSongProvider>().setShuffle();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_circle, color: Colors.white, size: 18,),
                        SizedBox(width: 8,),
                        Text("Lần lượt", style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${listSong.length} favourites", style: const TextStyle(color: Colors.white, fontSize: 18),),
                  InkWell(
                    onTap: () {
                      context.read<FavSongProvider>().setAddedDay();
                    },
                    child: Row(
                      children: [
                        Text("Theo tên", style: TextStyle(color: addedDayColor),),
                        const SizedBox(width: 4,),
                        Icon(Icons.swap_vert, color: addedDayColor,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider( color: Colors.white38,),
            context.watch<FavSongProvider>().isLoading?ListView.builder(
              itemCount: listSong.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemSongFavourite(song: listSong[index],);
              },
            ):const Center(
              child: CircularProgressIndicator(color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
