
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:music_app/data/provider/home_provider.dart';
import 'package:music_app/entity/type_song_entity.dart';
import 'package:music_app/utils/app_locale.dart';
import 'package:provider/provider.dart';

import '../../data/provider/app_provider.dart';
import '../../entity/song_entity.dart';
import '../../utils/color_custom.dart';
import '../views/home/song_playing_view.dart';

Widget songCategoryView(BuildContext context, int songIndex, TypeSongEntity typeSong){
  return Container(
    margin: const EdgeInsets.all(16),
    child: Column(
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(typeSong.type, style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14
            ),),
            InkWell(
               child: Text(AppLocale.seeMore.getString(context), style: TextStyle(
                  color: ColorsCustom.orange
               ),),
              onTap: () {

              },
             )
          ],
        ),
        SizedBox(
          height: 160,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ListView.builder(
              itemCount:typeSong.listSong.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return songView(typeSong.listSong[index], context, index);
              },),
          ),
        )
      ],
    ),
  );
}

Widget songView(SongEntity song, BuildContext context, int songIndex){
  return InkWell(
    child: Container(
      width: 100,
      height: 150,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(song.thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(song.songName, style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              overflow: TextOverflow.ellipsis
          )),
          Text(song.singer, style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              overflow: TextOverflow.ellipsis
          ))
        ],
      ),
    ),
    onTap: () {
      context.read<AppProvider>().setCurrentSong(song, songIndex);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SongPlayingView(),));
    },
  );
}