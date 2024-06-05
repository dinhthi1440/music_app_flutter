import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:music_app/entity/singer_entity.dart';
import 'package:music_app/utils/app_locale.dart';
import 'package:music_app/utils/color_custom.dart';

class ItemSinger extends StatelessWidget {
  const ItemSinger({super.key, required this.singer});
  final ListSongEntity singer;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(singer.imgAvatar),
            radius: 45,
          ),
          Text(singer.name, style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis
          ),),
          Text("${singer.quantitySongs} ${AppLocale.songLowercase.getString(context)}",
            style: const TextStyle(
            color: Colors.white38,
            overflow: TextOverflow.ellipsis
          ),),
        ],
      ),
    );
  }
}
