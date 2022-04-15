import 'package:flutter/material.dart';
import 'app_color.dart';

BoxDecoration textFieldDecoration(){
  return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.white70)
    //shape: BoxShape.circle,
  );
}
TextStyle uncompeleteTextStyle=TextStyle(
color: Colors.white,
);

TextStyle compelteTextStyle=TextStyle(
    color: Colors.white,
    decoration: TextDecoration.lineThrough
);
TextStyle uncompeleteTextStyle1=TextStyle(
  color: Colors.black,
);

TextStyle compelteTextStyle1=TextStyle(
    color: Colors.black,
    decoration: TextDecoration.lineThrough
);
TextStyle termPolicyButtonStyle({required Color color})
{
  return TextStyle(
      fontSize: 16,
      color:color,
      fontWeight: FontWeight.normal,
  );
}
TextStyle textButtonStyle({required Color color})
{
  return TextStyle(
    fontSize: 16,
    color:color,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline
  );
}
TextStyle logoTextHeading({required Color color})
{
  return  TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.bold,
      color:color,
  );
}
TextStyle logoTextSubHeading({required Color color})
{
  return  TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color:color,
  );
}
TextStyle btnTextStyle({Color? color}){
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: color??AppColors.btnTextColor
  );
}

TextStyle headingStyle({Color? color}){
  return  TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    color: color,
   
  );
}

TextStyle hintStyle(){
  return  TextStyle(
      fontSize: 18,
    color: Colors.white70
  );
}

TextStyle subHeadingStyle(){
  return  TextStyle(
       color: Colors.white,
      fontSize: 14,
    fontWeight: FontWeight.bold
  );
}


TextStyle greyTextStyle({Color? color}){
  return  TextStyle(
    fontSize: 14,
    color: color,
  );
}

TextStyle simpleTextStyle({Color? color}){
  return  TextStyle(
    fontSize: 14,
    color: color,
  );
}
TextStyle navigationBarButtonStyle({Color? color}){
  return  TextStyle(
    fontSize: 18,
    color: color,
    fontWeight: FontWeight.bold,
  );
}
TextStyle simpleItalic(){
  return  TextStyle(
      fontSize: 14,
      color: AppColors.lightGreyColor.withOpacity(0.8),
      fontStyle: FontStyle.italic
  );
}

TextStyle appbarSubtitleStyle(){
  return  TextStyle(
      fontSize: 14,
      color: Colors.white
  );
}


TextStyle forgetPasswordAppbarStyle(){
  return  TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600
  );
}

TextStyle appbarTitleStyle({Color? color}){
  return  TextStyle(
      fontSize: 20,
      color: color,
    fontWeight: FontWeight.w600
  );
}