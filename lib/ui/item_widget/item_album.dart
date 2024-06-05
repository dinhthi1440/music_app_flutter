import 'package:flutter/material.dart';
import 'package:music_app/entity/singer_entity.dart';

class ItemAlbum extends StatelessWidget {
  const ItemAlbum({super.key, required this.album});
  final ListSongEntity album;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Image(image: NetworkImage(album.imgAvatar), fit: BoxFit.fill,)
        ),
        Text(album.name, style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis
        ),),
      ],
    ) ;
  }
}
