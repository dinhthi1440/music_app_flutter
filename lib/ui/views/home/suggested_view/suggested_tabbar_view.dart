
import 'package:flutter/material.dart';
import 'package:music_app/data/provider/app_provider.dart';
import 'package:music_app/data/provider/home_provider.dart';
import 'package:provider/provider.dart';
import '../../../item_widget/song_view.dart';

class SuggestedTabBarView extends StatefulWidget {
  const SuggestedTabBarView({super.key});

  @override
  State<SuggestedTabBarView> createState() => _SuggestedTabBarViewState();
}

class _SuggestedTabBarViewState extends State<SuggestedTabBarView> {

  @override
  Widget build(BuildContext context) {
    context.watch<HomeProvider>().isLoadingSong?null:context.read<AppProvider>().setSongList(context.watch<HomeProvider>().song);
    return context.watch<HomeProvider>().isLoadingSong?const Center(
      child: CircularProgressIndicator(),
    ):ListView.builder(
        itemCount: context.watch<HomeProvider>().listType.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return songCategoryView(context, index, context.watch<HomeProvider>().listType[index]);
        },
    );
  }
}




