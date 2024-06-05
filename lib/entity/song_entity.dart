import 'package:hive/hive.dart';
part 'song_entity.g.dart';

@HiveType(typeId: 0)
class SongEntity extends HiveObject{
  @HiveField(0)
  final String songName;

  @HiveField(1)
  final String thumbnail;

  @HiveField(2)
  final String playlistId;

  @HiveField(3)
  final String songUrl;

  @HiveField(4)
  final String singer;

  @HiveField(5)
  final int songLength;

  @HiveField(6)
  final String id;

  SongEntity({
    required this.songName,
    required this.thumbnail,
    required this.playlistId,
    required this.songUrl,
    required this.singer,
    required this.songLength,
    required this.id,
  });

  factory SongEntity.fromJson(Map<String, dynamic> json) {
    return SongEntity(
      songName: json['song_name'],
      thumbnail: json['thumbnail'],
      playlistId: json['playlistId'],
      songUrl: json['song_url'],
      singer: json['singer'],
      songLength: json['songLength'],
      id: json['id'],
    );
  }
}