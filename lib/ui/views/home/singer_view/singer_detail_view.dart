import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/data/provider/app_provider.dart';
import 'package:music_app/data/provider/home_provider.dart';
import 'package:music_app/entity/singer_entity.dart';
import 'package:music_app/ui/item_widget/item_song_horizontal.dart';
import 'package:music_app/utils/color_custom.dart';
import 'package:provider/provider.dart';

class SingerDetailView extends StatefulWidget {
  const SingerDetailView({super.key, required this.singer});
  final ListSongEntity singer;
  @override
  State<SingerDetailView> createState() => _SingerDetailViewState();
}

class _SingerDetailViewState extends State<SingerDetailView> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: ColorsCustom.purpleBackground,
        child: Column(
          children: [
            const SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 8,),
                InkWell(
                  onTap: () {
                    context.read<HomeProvider>().viewSingerDetail();
                  },
                    child: Icon(Icons.arrow_back, color: Colors.white,)
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.singer.imgAvatar),
                        radius: 40,
                      ),
                      SizedBox(width: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.singer.name, style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold
                          ),),
                          Text("${widget.singer.quantitySongs} bài hát", style: const TextStyle(
                            color: Colors.white60
                          ),)
                        ],
                      ),
                      const SizedBox(width: 16,),
                      InkWell(
                        onTap: () {

                        },
                          child: Icon(Icons.play_circle, size: 40, color: Colors.white,)
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Bài hát nổi bật", style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.singer.listSong.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // context.read<AppProvider>().setSongList(widget.singer.listSong);
                          // context.read<AppProvider>().setCurrentSong(widget.singer.listSong[index],
                          //     index);
                        },
                        child: ItemSongHorizontal(song: widget.singer.listSong[index]),

                      );
                    },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
