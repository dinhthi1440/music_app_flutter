import 'package:music_app/entity/song_entity.dart';

class TypeSongEntity{
  final String id;
  final String type;
  final List<SongEntity> listSong;

  TypeSongEntity({required this.id, required this.type, required this.listSong});

}