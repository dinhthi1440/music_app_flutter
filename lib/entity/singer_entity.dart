import 'package:music_app/entity/song_entity.dart';

class ListSongEntity{
  final String id;
  final String name;
  final String imgAvatar;
  final int quantitySongs;
  final List<SongEntity> listSong;
  ListSongEntity({required this.id, required this.name, required this.imgAvatar,
    required this.quantitySongs, required this.listSong});
}