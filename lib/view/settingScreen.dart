import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teux_deux_app/constant/model_constant.dart';
import 'package:teux_deux_app/util/myThemes.dart';
import 'package:teux_deux_app/view/accountSettingScreen.dart';
import 'package:teux_deux_app/view/homeScreen.dart';
import 'package:teux_deux_app/view/someDayScreen.dart';
import 'package:teux_deux_app/view/todayScreen.dart';

import '../constant/screen_size_constant.dart';
import '../util/alerts.dart';
import '../util/app_color.dart';
import '../util/style.dart';
import '../widgets/custom_widgtes.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {
  String themeName="System(Auto)";
  int _selectedIndex = 0;
  int? selectedRadioTile;
  int? selectedRadio;
  int _groupValue = -1;
  int _value=0;
  Color color=Colors.red;
  bool _enableAlpha=false;
  @override
   initState(){
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }
  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    ScreenSize.height=MediaQuery.of(context).size.height;
    ScreenSize.width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton
            (icon: Icon(Icons.clear,color: Colors.white70,size: 20,),
             onPressed: (){
               MyAlert.showToast("Settings Has Been Closed Successfully", Colors.green);
               confirmationBox(context);
             },),
        ),
        title: Center(child: Text("SETTINGS",style:appbarTitleStyle(color: Colors.white70),)),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton
            (icon: Icon(Icons.check,color: Colors.white70,size: 20,),
             onPressed: (){
               MyAlert.showToast("Data Has Been Save Successfully", Colors.green);
             },),
        )],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                child: Text("ACCOUNT SETTINGS",style: headingStyle(color: Colors.white70),),
              ),
              Container(
                width: ScreenSize.width,
                height: ScreenSize.height!*0.06,
                color: AppColors.backGroundColor,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>AccountSettingScreen ()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.person_outline,size: 20,color: Colors.white70,),
                  title: Text('haneef93907@gmail.com',style: TextStyle(color: Colors.white70),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white70,size: 20,),),
                ),
              ),
              SizedBox(height: ScreenSize.height!*0.035,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                child: Text("WORKSPACES",style: headingStyle(color: Colors.white70),),
              ),
              SizedBox(height: ScreenSize.height!*0.005,),
              Container(
                width: ScreenSize.width,
                height: ScreenSize.height!*0.06,
                color: AppColors.backGroundColor,
                child: SwitchListTile(
                  activeColor: MyConstant.allcolor,
                  title: const Text('Trun on the flying cat',style: TextStyle(
                    color: Colors.white,

                  ),),
                  value: _enableAlpha,
                  onChanged: (bool value) => setState(() => _enableAlpha = !_enableAlpha),
                ),
              ),
              SizedBox(height: 1,),
              Center(
                child: Container(
                  color: AppColors.backGroundColor,
                  height: ScreenSize.height!*0.17,
                  width: ScreenSize.width,
                  child: BlockPicker(
                      availableColors: [
                        Colors.red,
                        Colors.pink,
                        Colors.purple,
                        Colors.deepPurple,
                        Colors.indigo,
                        Colors.blue,
                        Colors.lightBlue,
                        Colors.cyan,
                        Colors.teal,
                        Colors.green,
                        Colors.lightGreen,
                        Colors.lime,
                        Colors.yellow,
                        Colors.amber,
                        Colors.orange,
                        Colors.deepOrange,
                        Colors.brown,
                        Colors.grey,
                        Colors.blueGrey,
                        Colors.black,

                      ],
                      pickerColor: MyConstant.allcolor,
                      onColorChanged:(_color)
                      {
                        debugPrint("${_color}");
                        setState(() {
                          MyConstant.allcolor=_color;
                          // this.color=_color;
                          AppColors.colorPickerButtonColor=MaterialStateProperty.all<Color>(_color);
                        });
                      }),
                ),
              ),
              SizedBox(height: ScreenSize.height!*0.035,),
              Text("APP SETTINGS",style: headingStyle(color: Colors.white70),),
              SizedBox(height: ScreenSize.height!*0.005,),
              InkWell(
                onTap: (){

                },
                child: Container(
                  padding: EdgeInsets.only(top: 10,left: 10),
                  color: AppColors.backGroundColor,
                  height: ScreenSize.height!*0.08,
                  width: ScreenSize.width,
                  child: InkWell(
                    onTap: (){
                      _showMyDialog();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Theme',style: subHeadingStyle(),),
                        SizedBox(height: ScreenSize.height!*0.007,),
                        Text('$themeName',style: simpleTextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: ScreenSize.height!*0.035,),
              InkWell(
                onTap: () async {
                  final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
                  sharedPreferences.remove('email');
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>HomeScreen()));
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20,top: 12),
                  width: ScreenSize.width,
                  height: ScreenSize.height!*0.06,
                  color: AppColors.backGroundColor,
                  child: Text('Log out',style: TextStyle(
                    color: Colors.red,
                    fontSize: 16
                  ),),
                ),
              ),
              SizedBox(height: ScreenSize.height!*0.02,),
              Text('ToDobby version 1.7.0',style: simpleTextStyle(color: Colors.white),),
              SizedBox(height: ScreenSize.height!*0.02,),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  height: ScreenSize.height!*0.08,
                  width: ScreenSize.width,
                  child:buildTermPolicyButton(function:(){
                    settingTermCondition();
                  }, text:'Terms of Use\n\nPrivacy Policy',)
              ),
            ],
          ),
        ),
      ),
       bottomNavigationBar:Container(
         decoration: BoxDecoration(
           color: MyConstant.allcolor,
           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
         ),
        height: ScreenSize.height!*0.10,
       width: ScreenSize.width,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Padding(
             padding: const EdgeInsets.only(left: 15,bottom: 20,top: 10),
             child: navigationBarButton(function:(){
    todayTextButton();
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>Calendear()));
    },text: 'TODAY'),
           ),
           SizedBox(width:ScreenSize.width!*0.52 ,),
           Padding(
             padding: const EdgeInsets.only(left: 15,bottom: 20,top: 10),
             child: navigationBarButton(function:(){
               someDayTextButton();
               Navigator.push(context, MaterialPageRoute(
                   builder: (context) =>SomeDayScreen1()));
             },text: 'SOMEDAY'),
           ),
          ],
      //   ),
       )
    )
    );
  }

  void settingTermCondition() {

  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void todayTextButton() {}

  void someDayTextButton() {}
  Future _showMyDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                  child:Column(
                    children: [
                      RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile,
                        title: Text("Light"),
                        onChanged: (val) {
                          setState(() {
                            selectedRadioTile=val as int;
                            themeName='Light';
                          });
                          final provider=Provider.of<ThemeProvider>(context,listen:false );
                          provider.check(val as int);
                          Navigator.of(context).pop();

                        },
                        activeColor: Colors.red,
                        selected: true,
                      ),
                      RadioListTile(
                        value: 2,
                        groupValue: selectedRadioTile,
                        title: Text("Dark"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setState(() {
                            themeName='Dark';
                            selectedRadioTile=val as int;
                          });
                          final provider=Provider.of<ThemeProvider>(context,listen:false );
                          provider.check(val as int);
                          Navigator.of(context).pop();
                        },
                        activeColor: Colors.red,
                        selected: false,
                      ),
                      RadioListTile(
                        value: 3,
                        groupValue: selectedRadioTile,
                        title: Text("System(auto)"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setState(() {
                            selectedRadioTile=val as int;
                            themeName='System(Auto)';
                          });
                          final provider=Provider.of<ThemeProvider>(context,listen:false );
                          provider.check(val as int);
                          Navigator.of(context).pop();
                        },
                        activeColor: Colors.red,
                        selected: false,
                      ),

                    ],
                  )
              );
            }
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
