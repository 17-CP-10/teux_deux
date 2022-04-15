import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:teux_deux_app/view/someDayScreen.dart';
import '../constant/model_constant.dart';
import '../constant/screen_size_constant.dart';
import '../util/app_color.dart';
import '../util/assets_path.dart';
import '../widgets/custom_widgtes.dart';
class ColorPickerScreen extends StatefulWidget {
  const ColorPickerScreen({Key? key}) : super(key: key);

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  Color color=Colors.red;
   bool _enableAlpha=false;
  @override
  Widget build(BuildContext context) {
    ScreenSize.height=MediaQuery.of(context).size.height;
    ScreenSize.width=MediaQuery.of(context).size.width;
    return Scaffold(
         appBar: AppBar(
           backgroundColor: AppColors.backGroundColor,
           elevation: 0,
           actions: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
               child: buildTermPolicyButton(function: (){skipButtonAction();}, text: 'SKIP'),
             )
           ],
         ),
         backgroundColor: AppColors.backGroundColor,
      body:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: buildOreintation())
    );
  }
Widget buildOreintation()
{
  Orientation orientation =MediaQuery.of(context).orientation;
  if(orientation==Orientation.portrait)
    {
      return Column(
        children: [
          SizedBox(height: ScreenSize.height!*0.13,),
          Container(
            margin: EdgeInsets.only(left: ScreenSize.width!*0.05,right:ScreenSize.width!*0.05),
            padding: EdgeInsets.only(top: 10),
            height: ScreenSize.height!*0.6,
            width: ScreenSize.width!*0.9,
            decoration: BoxDecoration(
                color: AppColors.backGroundColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,

                )
            ),
            child: Column(
              children: [
                Container(
                  margin:EdgeInsets.only(top: ScreenSize.height!*0.035),
                  height: ScreenSize.height!*0.05,
                  width: ScreenSize.width!*0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(AssetPath.appIcon)
                      )
                  ),),
                SizedBox(height: ScreenSize.height!*0.002,),
                Text("MAKE IT YOURS",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                ),),
                SizedBox(height:ScreenSize.height!*0.055,),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Customize Your color palette:",style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.white
                    ),),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left:ScreenSize.height!*0.025,right:ScreenSize.height!*0.025),
                  height: ScreenSize.height!*0.2,
                  width: ScreenSize.width!*0.9,
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
                      ],
                      // layoutBuilder: (context,colors,child){
                      // },
                      pickerColor:MyConstant.allcolor,
                      onColorChanged:(_color)
                      {
                        debugPrint("${_color}");
                        setState(() {
                          MyConstant.allcolor=_color;
                          AppColors.colorPickerButtonColor=MaterialStateProperty.all<Color>(_color);
                        });
                      }),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 5,left: 30),
                    height: 20,
                    width: 80,
                    color: Colors.black,
                    child: Text('${color.red}',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white
                    ),),
                  ),
                ),
                SizedBox(height: 30,),
                SwitchListTile(
                  activeColor:MyConstant.allcolor,
                  title: const Text('Trun on the flying cat',style: TextStyle(
                    color: Colors.white,

                  ),),
                  value: _enableAlpha,
                  onChanged: (bool value) => setState(() => _enableAlpha = !_enableAlpha),
                ),

              ],
            ),
          ),
          SizedBox(height: 30,),
          customButton(
              'Done',
                  (){
            colorChooserAction();
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>SomeDayScreen1()));
            },
              btnColor: AppColors.colorPickerButtonColor,
              txtColor: AppColors.btnTextColor,
              widthbtn: 0.8 )
        ],
      );

    }
  else
    {
      return Column(
        children: [
          SizedBox(height: 80,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            padding: EdgeInsets.only(top: 10),
            height: 460,
            width: ScreenSize.width!*0.9,
            decoration: BoxDecoration(
                color: AppColors.backGroundColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,

                )
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: ScreenSize.height!*0.05,
                  width: ScreenSize.width!*0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(AssetPath.appIcon)
                      )
                  ),),
                SizedBox(height: 2,),
                Text("MAKE IT YOURS",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                ),),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Customize Your color palette:",style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.white
                    ),),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  height: 160,
                  width: ScreenSize.width!*0.9,
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
                      ],
                      pickerColor: color,
                      onColorChanged:(_color)
                      {
                        debugPrint("${_color}");
                        setState(() {
                          MyConstant.allcolor=_color;
                          AppColors.colorPickerButtonColor=MaterialStateProperty.all<Color>(_color);
                        });
                      }),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 5,left: 30),
                    height: 20,
                    width: 80,
                    color: Colors.black,
                    child: Text('${color.red}',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white
                    ),),
                  ),
                ),
                SizedBox(height: 30,),
                SwitchListTile(
                  activeColor: color,
                  title: const Text('Trun on the flying cat',style: TextStyle(
                    color: Colors.white,

                  ),),
                  value: _enableAlpha,
                  onChanged: (bool value) => setState(() => _enableAlpha = !_enableAlpha),
                ),

              ],
            ),
          ),
          SizedBox(height: 30,),
          customButton('Done',(){colorChooserAction();
          Navigator.push(context, MaterialPageRoute(
              builder: (context) =>SomeDayScreen1()));
            },btnColor: AppColors.colorPickerButtonColor,txtColor: AppColors.btnTextColor,widthbtn: 0.8 )
        ],
      );
    }
}
  void colorChooserAction() {}

  void skipButtonAction() {}


}
