import 'package:music_app/entity/song_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class FavouriteSongDB{
  static Database? _db;
  static final FavouriteSongDB instance = FavouriteSongDB._constructor();
  FavouriteSongDB._constructor();

  final String _favouriteSongNameTable = "favourite_song";

  Future<Database> get database async{
    if(_db != null ) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async{
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'favourite_song.db');
    final database = await openDatabase(path,version: 1 ,onCreate: (db, version) {
      db.execute(
        'CREATE TABLE $_favouriteSongNameTable('
            'id TEXT PRIMARY KEY, '
            'songName TEXT, '
            'thumbnail TEXT, '
            'playlistId TEXT, '
            'songUrl TEXT, '
            'singer TEXT, '
            'songLength INTEGER)'
      );
    },);
    return database;
  }

  void addSong(SongEntity song) async{
    final db = await database;
    await db.insert(_favouriteSongNameTable, {
      'id': song.id,
      'songName': song.songName,
      'thumbnail': song.thumbnail,
      'playlistId': song.playlistId,
      'songUrl': song.songUrl,
      'singer': song.singer,
      'songLength': song.songLength,
    });
  }

  Future<List<SongEntity>> getSongs() async{
    final db = await database;
    final data = await db.query(_favouriteSongNameTable);
    List<SongEntity> listSong = data.map((song) =>
        SongEntity(songName: song['songName'] as String,
            thumbnail: song['thumbnail'] as String,
            playlistId: song['playlistId'] as String,
            songUrl: song['songUrl'] as String,
            singer: song['singer'] as String,
            songLength: song['songLength'] as int,
            id: song['id'] as String)).toList();
    return listSong;
  }

  void deleteSong(String id) async{
    final db = await database;
    await db.delete(_favouriteSongNameTable, where: 'id = ?', whereArgs: [id]);
  }
}