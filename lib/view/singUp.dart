import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teux_deux_app/util/app_color.dart';
import 'package:teux_deux_app/util/logoText.dart';
import 'package:teux_deux_app/view/colorPickerScreen.dart';
import 'package:teux_deux_app/widgets/custom_widgtes.dart';
import '../constant/screen_size_constant.dart';
import 'loginScreen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {

  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    ScreenSize.height=MediaQuery.of(context).size.height;
    ScreenSize.width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
         body: SingleChildScrollView(
           scrollDirection: Axis.vertical,
             child: buildOrientation())
      ),
    );
  }
  Widget buildOrientation(){
    Orientation orientation=MediaQuery.of(context).orientation;
    if(orientation==Orientation.portrait)
      {
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: ScreenSize.height!*0.03,),
            LogoText(subheading: 'CREATE ACCOUNT',),
            SizedBox(height: ScreenSize.height!*0.05,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Email',style: TextStyle(
                      color: Colors.white
                  ),),
                ),
                SizedBox(height: ScreenSize.height!*0.01,),
                buildEmailTextField(emailController: emailController),
              ],
            ),
            SizedBox(height: ScreenSize.height!*0.02,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Paswword",style:TextStyle(
                    color: Colors.white,
                  ),),
                ),
                SizedBox(height: ScreenSize.height!*0.01,),
                buildPasswordTextField(passwordController: passwordController,isVisiblePassword:isVisible,onValueChange: (){
                  setState(() {
                    isVisible=!isVisible;
                  });
                },)
              ],
            ),
            SizedBox(height: ScreenSize.height!*0.02,),
            customButton('Sign up',() {
              signUpButtonAction();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>ColorPickerScreen()));
            },btnColor:AppColors.redButtonColor,txtColor:AppColors.btnTextColor,widthbtn: 0.95),
            SizedBox(height: ScreenSize.height!*0.05,),
            buildTextButton(function:(){
              goToLoginTextAction();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>LoginScreen()));
            }, text:'Already Have an account?Log in',),
            SizedBox(height: ScreenSize.height!*0.25,),
            buildTermPolicyButton(function:(){
              privacyPolicayAction();
            }, text:'     Support\n\nTerms of Use\n\nPrivacy Policy',),
          ],
        );
      }
    else{
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: ScreenSize.height!*0.1,),
          LogoText(subheading: 'CREATE ACCOUNT',),
          SizedBox(height: ScreenSize.height!*0.15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('Email',style: TextStyle(
                    color: Colors.white
                ),),
              ),
              SizedBox(height: ScreenSize.height!*0.01,),
              buildEmailTextField(emailController: emailController),
            ],
          ),
          SizedBox(height: ScreenSize.height!*0.02,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("Paswword",style:TextStyle(
                  color: Colors.white,
                ),),
              ),
              SizedBox(height: ScreenSize.height!*0.01,),
              buildPasswordTextField(passwordController: passwordController,isVisiblePassword:isVisible,onValueChange: (){
                setState(() {
                  isVisible=!isVisible;
                });
              },)
            ],
          ),
          SizedBox(height: 20,),
          customButton('Sign up',() {
            signUpButtonAction();
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>ColorPickerScreen()));
          },btnColor:AppColors.redButtonColor,txtColor:AppColors.btnTextColor,widthbtn: 0.95),
          SizedBox(height:ScreenSize.height!*0.10),
          buildTextButton(function:(){
            goToLoginTextAction();
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>LoginScreen()));
          }, text:'Already Have an account?Log in',),
          SizedBox(height: ScreenSize.height!*0.25,),
          buildTermPolicyButton(function:(){
            privacyPolicayAction();
          }, text:'     Support\n\nTerms of Use\n\nPrivacy Policy',),
        ],
      );

    }
  }

  void signUpButtonAction() {}

  void goToLoginTextAction() {}

  void privacyPolicayAction() {}
}
