import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/data/service/api_service.dart';
import 'package:music_app/entity/song_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier{
  bool isLoadingSong = false;
  late List<SongEntity> song;
  late SongEntity currentSong;
  late int currentIndex;
  bool isPlaying = false;
  bool isENLanguage = false;
  bool isPause = true;
  bool isLooping = false;
  bool isShuffle = false;
  bool isAddedDay = false;
  double currentPositionValue=0;
  double lengthSong=0;
  AudioPlayer player = AudioPlayer();


  int selectedIndexScreen = 0;

  bool isDarkTheme = false;
  bool isNotification = false;

  //Music audio player
  void setLooping(){
    isLooping =!isLooping;
    notifyListeners();
    isLooping?player.setReleaseMode(ReleaseMode.loop):player.setReleaseMode(ReleaseMode.release);
  }

  void setShuffle(){
    isShuffle =!isShuffle;
    notifyListeners();
  }
  void setAddedDay(){
    isAddedDay =!isAddedDay;
    notifyListeners();
  }


  Future<void> setSongList(List<SongEntity> songList) async{
    song = songList;
  }


  Future<void> setCurrentSong(SongEntity songEntity, int currentIndexSong) async{
    player.dispose();
    player = AudioPlayer();
    await player.setSource(UrlSource(songEntity.songUrl));
    await player.resume();
    player.getDuration().then((value) => lengthSong = value!.inSeconds.toDouble());
    currentSong = songEntity;
    currentIndex = currentIndexSong;
    currentPositionValue =0;
    isPlaying = true;
    isPause = false;
    notifyListeners();
    if(!isLooping){
      player.onPlayerComplete.listen((event) {nextSong();});
    }
  }
  void nextSong(){
    if(currentIndex<song.length){
      setCurrentSong(song[currentIndex+1], currentIndex+1);
    }
  }
  void backSong(){
    if(currentIndex>0){
      setCurrentSong(song[currentIndex-1], currentIndex-1);
    }
  }
  void pauseSong(){
    isPause?player.resume():player.pause();
    isPause=!isPause;
    notifyListeners();
  }
  void closeSong(){
    player.dispose();
    isPlaying = false;
    isPause = true;
    notifyListeners();
  }
  void setCurrentValueSong(){
    player.getCurrentPosition().then((value) {
      currentPositionValue = value!.inSeconds.toDouble();
      notifyListeners();
    });
  }

  //app
  void setCurrentScreen(int index){
    selectedIndexScreen = index;
    notifyListeners();
  }

}