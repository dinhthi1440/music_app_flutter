import 'package:flutter/material.dart';
import 'package:music_app/entity/song_entity.dart';
import 'package:music_app/utils/format_time.dart';

class ItemSongFavourite extends StatelessWidget {
  const ItemSongFavourite({super.key, required this.song});
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
              height: 60,
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
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(song.songName, style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      Text('${song.singer} - ${formatMinuteTime(song.songLength.toDouble())}', style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 12
                      ),),
                    ],
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: const Icon(Icons.more_horiz, color: Colors.white,)
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
