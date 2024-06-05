import 'package:flutter/material.dart';
import 'package:music_app/data/provider/home_provider.dart';
import 'package:music_app/entity/singer_entity.dart';
import 'package:music_app/ui/item_widget/item_album.dart';
import 'package:music_app/ui/item_widget/item_singer.dart';
import 'package:music_app/ui/views/home/singer_view/singer_detail_view.dart';
import 'package:provider/provider.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ListSongEntity singer;

  @override
  Widget build(BuildContext context) {
    //context.watch<HomeProvider>().isLoadingSong?null:context.read<AppProvider>().setSongList(context.watch<HomeProvider>().song);
    return context.watch<HomeProvider>().isLoadingSong?const Center(
      child: CircularProgressIndicator(),
    ):Stack(
      children: [
        SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: Text("Album hot", style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                    ))
                ),
                GridView.count(
                  padding: EdgeInsets.all(16),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1/1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(context.read<HomeProvider>().listSinger.length, (index) {
                    return InkWell(
                        onTap: () {

                        },
                        child: ItemAlbum(album: context.read<HomeProvider>().listSinger[index],)
                    );
                  }),
                ),
              ],
            )
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: context.read<HomeProvider>().isViewSingerDetail
              ? Positioned.fill(
              child: SingerDetailView(singer: singer))
              : const SizedBox.shrink(key: ValueKey(0)),
        ),
      ],
    );
  }
}
