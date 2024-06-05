import 'package:flutter/material.dart';
import 'package:music_app/data/database/favourite_song_db.dart';
import 'package:music_app/entity/song_entity.dart';

class FavSongProvider extends ChangeNotifier{
  final FavouriteSongDB database = FavouriteSongDB.instance;
  bool isShuffle = false;
  bool isAddedDay = false;
  bool isLoading = false;
  late List<SongEntity> listSongFav;
  late List<SongEntity> listSongSort;

  Future<void> getListSong() async{
    isLoading = true;
    listSongFav = await database.getSongs();
    isLoading = false;
    notifyListeners();
  }

  void setShuffle(){
    isShuffle =!isShuffle;
    notifyListeners();
  }
  void setAddedDay(){
    isAddedDay =!isAddedDay;
    notifyListeners();
  }


}