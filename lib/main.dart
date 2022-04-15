import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teux_deux_app/util/myThemes.dart';
import 'package:teux_deux_app/view/accountSettingScreen.dart';
import 'package:teux_deux_app/view/colorPickerScreen.dart';
import 'package:teux_deux_app/view/forgotPasswordScreen.dart';
import 'package:teux_deux_app/view/homeScreen.dart';
import 'package:teux_deux_app/view/loginScreen.dart';
import 'package:teux_deux_app/view/settingScreen.dart';
import 'package:teux_deux_app/view/singUp.dart';
import 'package:teux_deux_app/view/someDayScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      builder: (context,_)
      {
        final themeProvider=Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: HomeScreen(),
        );
      },
    );
  }
}