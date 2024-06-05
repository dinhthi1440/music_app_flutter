import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/data/provider/app_provider.dart';
import 'package:music_app/entity/song_entity.dart';
import 'package:music_app/ui/views/home/song_playing_view.dart';
import 'package:provider/provider.dart';

class PlayerHome extends StatefulWidget {
  final SongEntity song;
  PlayerHome(this.song);

  @override
  _PlayerHomeState createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, _, __) => SongPlayingView()));
      },
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.black,),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.song.thumbnail),
                      radius: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.song.songName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,

                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold)),
                        Text(widget.song.singer,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white54,
                            ))
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<AppProvider>().backSong();
                      },
                      child: const Icon(Icons.skip_previous_outlined,
                          color: Colors.white, size: 25),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        context.read<AppProvider>().pauseSong();
                      },
                      child: context.watch<AppProvider>().isPause?Icon(Icons.play_arrow, color: Colors.white, size: 25):
                      Icon(Icons.pause, color: Colors.white, size: 25),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        context.read<AppProvider>().nextSong();
                      },
                      child: const Icon(Icons.skip_next_outlined,
                          color: Colors.white, size: 25),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      context.read<AppProvider>().closeSong();
                    },
                    child: Icon(Icons.close, color: Colors.white, size: 20,),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}