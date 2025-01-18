import 'package:drugapp/Themes/darkmode.dart';
import 'package:drugapp/Themes/lightmode.dart';
import 'package:flutter/material.dart';


class Themeprovider extends ChangeNotifier{
  ThemeData _themeData =lightmode;
  ThemeData get themeData => _themeData;

  bool get isDarkMode=>_themeData==darkmode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightmode){
      themeData = darkmode;
    }else{
      themeData = lightmode;
    }
  }

}