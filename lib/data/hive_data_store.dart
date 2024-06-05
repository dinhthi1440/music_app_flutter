import 'package:hive/hive.dart';
import 'package:music_app/entity/song_entity.dart';
class HiveDataStore{
  static const boxName = "songsBox";
  final Box<SongEntity> box = Hive.box<SongEntity>(boxName);


  Future<void> addSong({required SongEntity song}) async{
    await box.put(song.id, song);
  }


}