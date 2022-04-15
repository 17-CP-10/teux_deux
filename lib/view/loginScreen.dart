import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teux_deux_app/util/app_color.dart';
import 'package:teux_deux_app/util/logoText.dart';
import 'package:teux_deux_app/view/forgotPasswordScreen.dart';
import 'package:teux_deux_app/view/singUp.dart';
import 'package:teux_deux_app/view/todayScreen.dart';
import 'package:teux_deux_app/widgets/custom_widgtes.dart';

import '../constant/screen_size_constant.dart';
import '../main.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  bool isVisible=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenSize.height=MediaQuery.of(context).size.height;
    ScreenSize.width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
         body:SingleChildScrollView(
              scrollDirection: Axis.vertical,
             child: buildOreintation()),
      ),
    );
  }
  Widget buildOreintation()
  {
    Orientation orientation=MediaQuery.of(context).orientation;
    if(orientation==Orientation.portrait)
      {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: ScreenSize.height!*0.05,),
            LogoText(subheading: 'LOGIN',),
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
            customButton('Login',() {
              loginButtonAction();
            },btnColor:AppColors.redButtonColor,txtColor:AppColors.btnTextColor,widthbtn: 0.95),
            SizedBox(height: ScreenSize.height!*0.05,),
            buildTextButton(function:(){
              forgetPasswordAction();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>ForgotPasswordSceen()));
            }, text:'Forgot Password',),
            SizedBox(height: ScreenSize.height!*0.02,),
            buildTextButton(function:(){
              creatNewAcountAction();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>SignUpScreen()));
            }, text:'New here? Create an account',),
            SizedBox(height: ScreenSize.height!*0.19,),
            buildTermPolicyButton(function:(){
              forgetPasswordAction();
            }, text:'     Support\n\nTerms of Use\n\nPrivacy Policy',),
          ],
        );
      }
    else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: ScreenSize.height!*0.09,),
          LogoText(subheading: 'LOGIN',),
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
          SizedBox(height: ScreenSize.height!*0.06,),
          customButton('Login',() async {
            final SharedPreferences sharedPreference=await SharedPreferences.getInstance();
            sharedPreference.setString('email', emailController.text);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>Calendear()));
            loginButtonAction();

          },btnColor:AppColors.redButtonColor,txtColor:AppColors.btnTextColor,widthbtn: 0.95),
          SizedBox(height: ScreenSize.height!*0.09,),
          buildTextButton(function:(){
            forgetPasswordAction();
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>ForgotPasswordSceen()));
          }, text:'Forgot Password',),
          SizedBox(height: ScreenSize.height!*0.05,),
          buildTextButton(function:(){
            creatNewAcountAction();
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>SignUpScreen()));
          }, text:'New here? Create an account',),
          SizedBox(height: ScreenSize.height!*0.19,),
          buildTermPolicyButton(function:(){
            forgetPasswordAction();
          }, text:'     Support\n\nTerms of Use\n\nPrivacy Policy',),
        ],
      );

    }
  }

  void loginButtonAction() {
  }

  void forgetPasswordAction() {}

  void creatNewAcountAction() {}

}
