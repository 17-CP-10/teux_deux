import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors{
  static Color navigationBarColor=const Color(0xfff31d12);
  static Color backGroundColor =const Color(0xff1e1e1e);
  static  Color redTextColor= const Color(0xfff31d12);
  static  Color appBgColor= const Color(0xffffffff);
  static Color showToastSuccesColor=const Color(0xff10de47);
  static Color showToastFailColor=const Color(0xfff31d12);
  //static Color blueTextColor=const Color(0xFF2196F3);
  static Color blueTextColor=const Color(0xfff14739);
  static Color blackTextColor=const Color(0xFF000000);
  static Color btnColor=const Color(0xfff14739);
  static Color bottomNavColor=const Color(0xfff14739);
  static Color? btnTextColor=const Color(0xffffffff);
  static Color appBarColor=const Color(0xfff14739);
  static Color iconColor=const Color(0xfff14739);
  static Color circularIndicatorColor=const Color(0xfff14739);
  static Color lightGreyColor=const Color(0xff494949);
  static Color darkGreyColor=const Color(0xff404040);


  static MaterialStateProperty<Color?>? customBtnColor=MaterialStateProperty.all<Color>(Color(0xfff14739));
  static MaterialStateProperty<Color?>? whiteBtnColor=MaterialStateProperty.all<Color>(Color(0xffffffff));
  static MaterialStateProperty<Color?>? balckButtonColor=MaterialStateProperty.all<Color>(Color(0xff000000));
  static MaterialStateProperty<Color?>? redButtonColor=MaterialStateProperty.all<Color>(Color(0xfff31d12));
  static MaterialStateProperty<Color?>? colorPickerButtonColor=MaterialStateProperty.all<Color>(Color(0xfff31d12));
  static MaterialStateProperty<Color?>? dragAbleButtonColor=MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.3));


}