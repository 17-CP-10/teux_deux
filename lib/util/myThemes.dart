import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode =ThemeMode.dark;
  void check(int value) {
    if(value==1)
    {
      themeMode=ThemeMode.light;
    }
    else if(value==2){
      themeMode=ThemeMode.dark;
    }
    else{
      themeMode=ThemeMode.system;
    }
    notifyListeners();
  }
}
class MyThemes{
  static final darkTheme=ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
  );
  static final lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );
}