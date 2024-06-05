import 'package:flutter/cupertino.dart';

class SettingProvider extends ChangeNotifier{
  bool isDarkTheme = false;
  bool isNotification = false;

  void setDarkTheme(bool value){
    isDarkTheme = value;
    notifyListeners();
  }

  void setNotification(bool value){
    isNotification = value;
    notifyListeners();
  }
}