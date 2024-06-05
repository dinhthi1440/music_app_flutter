
import 'package:flutter/material.dart';
import 'package:music_app/data/provider/app_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/format_time.dart';
import '../../item_widget/item_disk.dart';


class SongPlayingView extends StatefulWidget {
  const SongPlayingView({super.key});
  @override
  State<SongPlayingView> createState() => _SongPlayingViewState();
}

class _SongPlayingViewState extends State<SongPlayingView> {

  @override
  Widget build(BuildContext context) {
    context.read<AppProvider>().setCurrentValueSong();
    return SafeArea(
        child: Scaffold(
          body: context.watch<AppProvider>().isPlaying?Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                color: Colors.grey[890],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(child: Icon(Icons.arrow_back, color: Colors.white,),
                    onTap: () => Navigator.pop(context),),
                    const Text("Musici", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    Icon(Icons.more_vert, color: Colors.white,),
                  ],
                ),
              ),
              DiskSpin(image: context.watch<AppProvider>().currentSong.thumbnail),
              Container(
                child: Column(
                  children: [
                    Text(context.watch<AppProvider>().currentSong.songName, style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 10,),
                    Text(context.watch<AppProvider>().currentSong.singer,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                    ),),
                  ],
                ),
              ),
              Container(
                height: 150,
                margin: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Slider(
                          max: context.watch<AppProvider>().lengthSong,
                          value: context.watch<AppProvider>().currentPositionValue,
                          activeColor: Colors.pinkAccent,
                          onChanged: (value) {
                            context.read<AppProvider>().player.seek(Duration(seconds: value.toInt()));
                            },),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatMinuteTime(context.watch<AppProvider>().currentPositionValue), style: const TextStyle(
                              color: Colors.white
                            ),),
                            Text(formatMinuteTime(context.watch<AppProvider>().lengthSong), style: const TextStyle(
                                color: Colors.white
                            ),)
                          ],
                        ),

                      ],
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: const Icon(Icons.shuffle, color: Colors.white,),
                          onTap: () {

                        },),
                        InkWell(
                            child: const Icon(Icons.skip_previous,  color: Colors.white,),
                          onTap: () {
                            context.read<AppProvider>().backSong();
                          },
                        ),
                        InkWell(
                          child: Icon(
                            context.watch<AppProvider>().isPause?Icons.play_circle :Icons.pause_circle ,
                            size: 54,
                            color: Colors.white,),
                          onTap: () {
                            context.read<AppProvider>().pauseSong();
                          },
                        ),
                        InkWell(
                          child: const Icon(Icons.skip_next,  color: Colors.white),
                          onTap: () {
                            context.read<AppProvider>().nextSong();
                          },
                        ),
                        InkWell(
                          child: context.watch<AppProvider>().isLooping
                              ?const Icon(Icons.repeat_on, color: Colors.white)
                              :const Icon(Icons.repeat, color: Colors.white),
                          onTap: () {
                            context.read<AppProvider>().setLooping();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ): const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.grey[900],
        )
    );
  }

}
