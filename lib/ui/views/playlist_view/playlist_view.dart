import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:music_app/ui/item_widget/item_playlist.dart';
import 'package:music_app/utils/app_locale.dart';

import '../../../utils/color_custom.dart';
class PlaylistView extends StatefulWidget {
  const PlaylistView({super.key});

  @override
  State<PlaylistView> createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCustom.purpleBackground,
      appBar: AppBar(
        leading: const Icon(Icons.library_music, color: Colors.yellow,),
        title: const Text("Musici",
          style: TextStyle(color: Colors.pinkAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
          backgroundColor: ColorsCustom.purpleBackground,
        ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text(AppLocale.playList.getString(context), style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(AppLocale.sort.getString(context), style: const TextStyle(
                          color: Colors.white
                      ),),
                    )
                  ],
                ),
                ListView.builder(
                  itemCount: 13,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const ItemPlaylist();
                  },
                )
              ],
            ),
          ),
          SizedBox(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              margin: const EdgeInsets.only(right: 24, bottom: 32),
              decoration: const BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.all(Radius.circular(24))
              ),
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add, color: Colors.white,),
                  const SizedBox(width: 8),
                  Text(AppLocale.add.getString(context), style: const TextStyle(
                    color: Colors.white
                  ),)
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
