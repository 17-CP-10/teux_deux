import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:teux_deux_app/util/alerts.dart';
import 'package:teux_deux_app/util/app_color.dart';
import 'package:teux_deux_app/view/settingScreen.dart';

import '../constant/screen_size_constant.dart';
import '../widgets/custom_widgtes.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({Key? key}) : super(key: key);

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _confirmPasswordController=TextEditingController();
  String _timezone = 'Unknown';
  @override
   initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }
  @override
  Widget build(BuildContext context) {
    ScreenSize.height=MediaQuery.of(context).size.height;
    ScreenSize.width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width:ScreenSize.width,
                height: ScreenSize.height!*0.1,
                color: AppColors.backGroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    simpleTextButton(function: (){

                    },text: 'ToDobby'),
                    SizedBox(width: ScreenSize.width!*0.62,),
                    simpleTextButton(function: (){

                    },text: 'Settings')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Text("Account",style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24,
                  color: Colors.white70
                ),),
              ),
              SizedBox(height: ScreenSize.height!*0.02,),
              Divider(
                color: Colors.white70,
              ),
              SizedBox(height: ScreenSize.height!*0.05,),
              customTextField(hint: 'Display Name',onValueChange: (){},keyboard: TextInputType.text,),
              SizedBox(height: ScreenSize.height!*0.02,),
              customTextField(hint: 'Email Address',onValueChange: (){},keyboard: TextInputType.emailAddress,),
              SizedBox(height: ScreenSize.height!*0.02,),
              customPasswordTextField(controller: _passwordController,showPassword: false,keyboard: TextInputType.text,),
              SizedBox(height: ScreenSize.height!*0.02,),
              customPasswordTextField(controller: _confirmPasswordController,showPassword: false,keyboard: TextInputType.text,),
              SizedBox(height: ScreenSize.height!*0.02,),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                width:ScreenSize.width,
                height: ScreenSize.height!*0.06,
                decoration: BoxDecoration(
                    color: AppColors.backGroundColor,
                     borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white70
                  )
                ),
                child: Center(child: Text(_timezone,style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),)),
              ),
              SizedBox(height: ScreenSize.height!*0.03,),
              customButton('UPDATE RECORD',(){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>SettingScreen()));
                MyAlert.showToast("Data Has Been Updated Successfully", Colors.green);
              },btnColor:AppColors.customBtnColor,txtColor:AppColors.btnTextColor,widthbtn: 0.95)
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _initData() async {
    try {
      _timezone = await FlutterNativeTimezone.getLocalTimezone();
    } catch (e) {
      print('Could not get the local timezone');
    }
    // try {
    //   _availableTimezones = await FlutterNativeTimezone.getAvailableTimezones();
    //   _availableTimezones.sort();
    // } catch (e) {
    //   print('Could not get available timezones');
    // }
    if (mounted) {
      setState(() {});
    }
  }
}
