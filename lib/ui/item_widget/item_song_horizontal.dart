

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/entity/song_entity.dart';
import 'package:music_app/utils/format_time.dart';

class ItemSongHorizontal extends StatelessWidget {
  const ItemSongHorizontal({super.key, required this.song});
  final SongEntity song;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: 60,
              child: Image(
                image: NetworkImage(song.thumbnail),
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(song.songName, style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontSize: 16
                          ),),
                          Text(song.singer, style: const TextStyle(
                              color: Colors.white60,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12
                          ),),
                        ],
                                           ),
                     ),
                    const SizedBox(width: 8,),
                    Text(formatMinuteTime(song.songLength.toDouble()), style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12
                    ),),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
