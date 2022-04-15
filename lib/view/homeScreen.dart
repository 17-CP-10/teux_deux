import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teux_deux_app/constant/screen_size_constant.dart';
import 'package:teux_deux_app/util/assets_path.dart';
import 'package:teux_deux_app/util/logoText.dart';
import 'package:teux_deux_app/util/style.dart';
import 'package:teux_deux_app/view/loginScreen.dart';
import 'package:teux_deux_app/view/singUp.dart';
import 'package:teux_deux_app/view/todayScreen.dart';
import 'package:teux_deux_app/widgets/custom_widgtes.dart';

import '../constant/model_constant.dart';
import '../util/app_color.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? finamEmail;
  Future getValiation() async
  {
    final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    var obtainedEmail=sharedPreferences.getString('email');
    setState(() {
      finamEmail=obtainedEmail!;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValiation().whenComplete(() async{
      if(finamEmail==null)
        {
          // Navigator.push(context, MaterialPageRoute(
          //     builder: (context) =>LoginScreen()
          // ));
        }
      else{
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>Calendear()
        ));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenSize.height=MediaQuery.of(context).size.height;
    ScreenSize.width=MediaQuery.of(context).size.width;
    return Stack(
      children:[
        Container(
          height: ScreenSize.height,
          width: ScreenSize.width,
        decoration:BoxDecoration(
            image: DecorationImage(
                image:AssetImage(AssetPath.backGroundImage),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black12,
                  BlendMode.darken,
                )
            )
        ),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.black12,
                      Colors.transparent,
                    ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
          ),
      ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               builOreintation(context),
              SizedBox(height: ScreenSize.height!*0.42,),
              Container(
                height: ScreenSize.height!*0.1,
                width: ScreenSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customButton('SING UP',() {
                       signUpAction();
                       Navigator.push(context, MaterialPageRoute(
                           builder: (context) =>SignUpScreen()
                       ));
                     }
                     ,btnColor:AppColors.balckButtonColor
                        ,txtColor:AppColors.btnTextColor
                    ),
                    SizedBox(width: ScreenSize.width!*0.1,),
                    customButton('LOG IN',() {
                      loginAction();
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>LoginScreen()
                      ));
                    },btnColor:AppColors.redButtonColor,txtColor:AppColors.btnTextColor),

    ],
    ),
              )
    ],
    )
        )
    ]
    );
  }

  void signUpAction() {

  }

  void loginAction() {

  }

  Widget builOreintation(BuildContext context){
    Orientation orientation =MediaQuery.of(context).orientation;
    if(orientation==Orientation.portrait)
      {
        return LogoText(subheading:'Simple as paper',size:ScreenSize.height!*0.13);
      }
    else{
      return LogoText(subheading:'Simple as paper',size:ScreenSize.height!*0.3);
    }
  }
}
