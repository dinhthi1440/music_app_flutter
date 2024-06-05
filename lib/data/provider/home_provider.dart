import 'dart:async';
import 'package:flutter/material.dart';
import 'package:music_app/data/service/api_service.dart';
import 'package:music_app/entity/singer_entity.dart';
import 'package:music_app/entity/song_entity.dart';
import 'package:music_app/entity/type_song_entity.dart';

class HomeProvider extends ChangeNotifier{
  bool isLoadingSong = false;
  bool isViewSingerDetail = false;
  late ListSongEntity currentSingerSelected;
  late List<SongEntity> song;
  late List<TypeSongEntity> listType;
  late List<String> listCategoryName;
  late List<ListSongEntity> listSinger;

  Future<void> getSongListData() async{
    List<TypeSongEntity> listTypeData = [];
    List<ListSongEntity> listSingerData = [];
    isLoadingSong = true;
    song = await ApiService().getSongListData();
    Set<String> playlistIds = song.map((song) => song.playlistId).toSet();
    listCategoryName = playlistIds.toList();
    int i=0;
    for(String type in playlistIds){
      List<SongEntity> filteredSongs = song.where((song) => song.playlistId == type).toList();
      listTypeData.add(TypeSongEntity(id: i.toString(), type: type, listSong: filteredSongs));
      i++;
    }
    listType = listTypeData;
    Set<String> singerName = song.map((song) => song.singer).toSet();
    int j=0;
    for(String name in singerName){
      List<SongEntity> filteredSongs = song.where((song) => song.singer == name).toList();
      listSingerData.add(ListSongEntity(id: j.toString(), name: name,
          imgAvatar: filteredSongs.first.thumbnail,
          quantitySongs: filteredSongs.length, listSong:  filteredSongs));
      j++;
    }
    listSinger = listSingerData;
    isLoadingSong = false;
    notifyListeners();
  }

  void viewSingerDetail(){
    isViewSingerDetail = !isViewSingerDetail;
    notifyListeners();
  }
  void setSingerSelected(ListSongEntity singer){
    currentSingerSelected = singer;
  }
}