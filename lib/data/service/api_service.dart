import 'dart:convert';

import 'package:music_app/utils/api_constant.dart';
import 'package:http/http.dart' as http;

import '../../entity/song_entity.dart';

class ApiService{
  Future<List<SongEntity>> getSongListData() async {
    late List<SongEntity> songList;
    var response = await http.get(Uri.parse('${Constant.baseSongURL}/songs'));
    if(response.statusCode == 200){
      String decodeResponse = utf8.decode(response.body.codeUnits);
      List<dynamic> jsonData = jsonDecode(decodeResponse);
      songList = jsonData.map((json) => SongEntity.fromJson(json)).toList();
    }else{

    }
    return songList;
  }
}