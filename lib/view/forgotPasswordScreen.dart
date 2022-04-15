import 'package:flutter/material.dart';
import 'package:teux_deux_app/util/alerts.dart';
import 'package:teux_deux_app/util/app_color.dart';
import '../constant/screen_size_constant.dart';
import '../util/logoText.dart';
import '../widgets/custom_widgtes.dart';
class ForgotPasswordSceen extends StatefulWidget {
  const ForgotPasswordSceen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordSceen> createState() => _ForgotPasswordSceenState();
}

class _ForgotPasswordSceenState extends State<ForgotPasswordSceen> {
  final emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenSize.height=MediaQuery.of(context).size.height;
    ScreenSize.width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor:AppColors.backGroundColor,
        body: SingleChildScrollView(
           scrollDirection: Axis.vertical,
            child: buildOrientation())
      ),
    );
  }
  Widget buildOrientation()
  {
    Orientation orientation =MediaQuery.of(context).orientation;
    if(orientation==Orientation.portrait)
      {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenSize.height!*0.05,),
            LogoText(subheading: 'LOGIN',),
            SizedBox(height: ScreenSize.height!*0.05,),
            Center(
              child: Text('   Forgot Password?\nLet’s help you reset it.',style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: ScreenSize.height!*0.03,),
            Center(
              child: Text('Enter your email address and we will send \n      you the link to reset your password.',style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: ScreenSize.height!*0.03,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Email',style: TextStyle(
                  color: Colors.white
              ),),
            ),
            SizedBox(height: ScreenSize.height!*0.01,),
            buildEmailTextField(emailController: emailController),
            SizedBox(height: ScreenSize.height!*0.35,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: customButton('Send Email',() {
                sendEmailAction();
              },btnColor:AppColors.redButtonColor,txtColor:AppColors.btnTextColor,widthbtn: 0.95),
            ),
          ],
        );
      }
    else
      {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenSize.height!*0.05,),
            LogoText(subheading: 'LOGIN',),
            SizedBox(height: ScreenSize.height!*0.05,),
            Center(
              child: Text('   Forgot Password?\nLet’s help you reset it.',style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: ScreenSize.height!*0.05,),
            Center(
              child: Text('Enter your email address and we will send \n      you the link to reset your password.',style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: ScreenSize.height!*0.05,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Email',style: TextStyle(
                  color: Colors.white
              ),),
            ),
            SizedBox(height: ScreenSize.height!*0.02,),
            buildEmailTextField(emailController: emailController),
            SizedBox(height: ScreenSize.height!*0.4,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: customButton('Send Email',() {
                sendEmailAction();
              },btnColor:AppColors.redButtonColor,txtColor:AppColors.btnTextColor,widthbtn: 0.95),
            ),
            SizedBox(height: ScreenSize.height!*0.1,),
          ],
        );

      }
  }
  void sendEmailAction() {
    MyAlert.showToast("PLEAS CHECK YOUR MAIL ",AppColors.showToastSuccesColor);
  }
}
