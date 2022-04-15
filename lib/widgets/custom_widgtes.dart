import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/model_constant.dart';
import '../constant/screen_size_constant.dart';
import '../util/app_color.dart';
import '../util/assets_path.dart';
import '../util/routes.dart';
import '../util/style.dart';
import 'package:cached_network_image/cached_network_image.dart';


Widget buildTermPolicyButton({required Function function,required String text}) =>InkWell(
  onTap: (){
    function();
  },
  child: Text(text,
      style: termPolicyButtonStyle(color: Colors.white70)),
);
Widget buildTextButton({required Function function,required String text}) =>InkWell(
  onTap: (){
    function();
  },
  child: Text(text,
    style: textButtonStyle(color: Colors.white70)),
);
Widget simpleTextButton({required Function function,required String text}) =>InkWell(
  onTap: (){
    function();
  },
  child: Text(text,
      style: termPolicyButtonStyle(color: Colors.white70)),
);
Widget navigationBarButton({bool? activeCheck,required Function function,required String text}) =>InkWell(
  onTap: (){
    function();
  },
  child: Text(text,
      style: navigationBarButtonStyle(color: Colors.white)),
);
Widget buildPasswordTextField({TextEditingController? passwordController,required bool isVisiblePassword,Function? onValueChange}) =>Container(
  margin: EdgeInsets.only(left: 10,right: 10),
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(10)
  ),
  child:   TextField(

    controller: passwordController,

    decoration: InputDecoration(

      border: InputBorder.none,

      contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),

      suffixIcon: IconButton(

        icon:isVisiblePassword ?Icon(Icons.visibility_off,color: Colors.white70,):Icon(Icons.visibility,color: Colors.white70,),

        onPressed: () {

          onValueChange!();

    },

      ),

    ),

    obscureText: isVisiblePassword,

    keyboardType: TextInputType.visiblePassword,

    textInputAction: TextInputAction.done,

  ),
);
Widget buildEmailTextField({String? label,String? hint,TextEditingController? emailController,TextInputType? keyboard,Function? onValueChange})=>
    Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      height: keyboard==TextInputType.multiline?ScreenSize.height!*0.2:ScreenSize.textFieldHeight,
      width: ScreenSize.width,
      child: TextField(
  controller: emailController,
  decoration: InputDecoration(
      border:InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      labelText:label,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      hintText: hint
  ),
  keyboardType:keyboard,
  textInputAction: TextInputAction.next,
  onChanged: (value){
      if(onValueChange!=null) {
        onValueChange();
      }
  },
),
    );
Widget customPasswordTextField({required TextEditingController controller, required bool showPassword,TextInputType? keyboard,}) {
  return Padding(
    padding:EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
    child: Container(
      width: ScreenSize.width,
      // height: 55,
      height: keyboard==TextInputType.multiline?ScreenSize.height!*0.2:ScreenSize.textFieldHeight,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.white70
              ),
              controller: controller,
              obscureText: showPassword?false:true,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      decoration: textFieldDecoration(),
    ),
  );
}



Widget customTextField({String? iconPath,String? hint, TextEditingController? controller,TextInputType? keyboard,Icon? icon,bool? hide,bool? enable,Function? onSubmit,Function? onValueChange,String? trailingIconPath,Function? trailingAction}) {
  return Padding(
    padding: EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
    child: Container(
      height: keyboard==TextInputType.multiline?ScreenSize.height!*0.2:ScreenSize.textFieldHeight,
      width: ScreenSize.width,
      child: Center(
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            iconPath==null?SizedBox():Align(
                alignment: Alignment.center,
                child: Image.asset(iconPath,height: ScreenSize.iconSize,)),
            icon??SizedBox(),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height:ScreenSize.height!*0.3,
                child: TextField(
                  style: TextStyle(
                      color: Colors.white70
                  ),
                  controller: controller,
                  keyboardType: keyboard,
                  obscureText: hide??false,
                  enabled: enable??true,
                  onChanged: (val) {

                      onValueChange!();

                  },
                  onSubmitted: (value)
                  {
                     onSubmit!();
                  },
                  maxLines: keyboard==TextInputType.multiline?null:1,
                  decoration: InputDecoration(
                    hintText: hint,
                    // label: Text(hint!),
                    suffixIcon:trailingIconPath!=null?InkWell(
                        onTap: (){
                          trailingAction!();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 10,left: 10,),
                          child: Image.asset(trailingIconPath),
                        )):SizedBox(),
                    suffixIconConstraints: BoxConstraints(
                        minHeight: ScreenSize.iconSize,
                        maxHeight:ScreenSize.iconSize,
                    ),
                    hintStyle: hintStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      decoration: textFieldDecoration(),
    ),
  );
}
Widget customButton(String _text,Function f,{MaterialStateProperty<Color?>? btnColor,Color? txtColor,double widthbtn=0.35}){
  return Container(
    width:ScreenSize.width!*(widthbtn),
    height: 45,
    child: ElevatedButton(
        onPressed: (){
          f();
        },
        child: Text(_text,style: btnTextStyle(color:txtColor),),
        style:ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              )
          ),
          backgroundColor:btnColor??AppColors.customBtnColor,
        )
    ),
  );
}
   Widget customDragSheetButton(String _text,Function f,{MaterialStateProperty<Color?>? btnColor,Color? txtColor,double widthbtn=0.35}){
     return InkWell(
       onTap: (){
         f();
       },
       child: Container(
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20)
    ),
    alignment: Alignment.topLeft,
    padding: EdgeInsets.symmetric(vertical: 10),
    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
    width:ScreenSize.width!*widthbtn,
    height: ScreenSize.height!*0.05,
         child:Text(_text,style: btnTextStyle(color:txtColor),),
    ),
     );
}




Widget messageItemPicture(String path){
  return  Container(
    height: ScreenSize.height!*0.2,
    width: ScreenSize.width!*0.2,
      child: CachedNetworkImage(
        imageUrl: path,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
      ),
  );
}

Widget imageLogo() {
  return Image.asset(AssetPath.circularLogoPath,height: ScreenSize.height!*0.15,);

}
Widget customDialogBox(BuildContext context,String title,String subtitle){
  return Scaffold(
    backgroundColor:Colors.transparent,
    body: Center(
      child: Container(
        height: 200,
        width: ScreenSize.width!*0.9,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title,style: headingStyle(),textAlign: TextAlign.center,),
            Text(subtitle,style: greyTextStyle(),textAlign: TextAlign.center),
            Container(
              width: ScreenSize.width!*0.5,
              child: customButton("Close",(){
                Navigator.pop(context);
              }),
            ),
          ],
        )),
        decoration:BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}

Widget confirmationBox(BuildContext context){
  return Scaffold(
    backgroundColor:Colors.transparent,
    body: Center(
      child: Container(
         height: 250,
        width: ScreenSize.width!*0.9,
        child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
            Image.asset(AssetPath.confirmIcon,height: 70,),
            SizedBox(height: 10,),
            Text("Great !",style: TextStyle(color: AppColors.appBarColor,fontSize: 32),textAlign: TextAlign.center,),
               SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.screenPadding,right: ScreenSize.screenPadding,bottom: ScreenSize.screenPadding),
              child: Text("Your deal is confirmed. Someone from InstaHeat will contact you soon.",style: TextStyle(color: AppColors.appBarColor),textAlign: TextAlign.center),
            ),
               SizedBox(height: 10,),
            InkWell(
                onTap: (){
                  MyConstant.currentScreenIndex=0;
                  Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.bottomNavScreen, (Route<dynamic> route) => false);

                },
                child: Image.asset(AssetPath.okIcon,height: 35,)),
          ],
        )),
        decoration:BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}