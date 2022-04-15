import 'package:flutter/material.dart';
import 'package:teux_deux_app/util/style.dart';

import '../constant/screen_size_constant.dart';
import 'app_color.dart';
class LogoText extends StatelessWidget {
  String? subheading;
  double? size=ScreenSize.height!*0.13;
  LogoText({Key? key,this.subheading,this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.height=MediaQuery.of(context).size.height;
    ScreenSize.width=MediaQuery.of(context).size.width;
    return Container(
        height: size,
        width: ScreenSize.width,
        child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("To",style: logoTextHeading(color:Colors.white)),
                Text("Dobby",style:logoTextHeading(color:AppColors.redTextColor)),
              ],
            ),
            SizedBox(height: ScreenSize.height!*0.008,),
            Text("$subheading",style:logoTextSubHeading(color:Colors.white),),
          ],
        )
    );
  }
}