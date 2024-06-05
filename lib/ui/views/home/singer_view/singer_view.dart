import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:music_app/data/provider/home_provider.dart';
import 'package:music_app/entity/singer_entity.dart';
import 'package:music_app/ui/item_widget/item_singer.dart';
import 'package:music_app/ui/views/home/singer_view/singer_detail_view.dart';
import 'package:music_app/utils/app_locale.dart';
import 'package:provider/provider.dart';

class SingerView extends StatefulWidget {
  const SingerView({super.key});

  @override
  State<SingerView> createState() => _SingerViewState();
}

class _SingerViewState extends State<SingerView> {
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
                 Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(AppLocale.listArtist.getString(context), style: const TextStyle(
                        color: Colors.white,
                      fontSize: 15
                    ))
                ),
                GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 5/6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(context.read<HomeProvider>().listSinger.length, (index) {
                    return InkWell(
                        onTap: () {
                          // singer = context.read<HomeProvider>().listSinger[index];
                          // context.read<HomeProvider>().viewSingerDetail();
                          // context.read<HomeProvider>().setSingerSelected(singer);
                        },
                        child: ItemSinger(singer: context.read<HomeProvider>().listSinger[index] ,)
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
