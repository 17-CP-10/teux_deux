import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_color.dart';


class MyAlert{

  static void showToast(String txt,Color color){
    Fluttertoast.showToast(
        msg:txt,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  static SnackBar snackBar = SnackBar(
    content:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        const Text('Please wait',),
        Container(
            height: 20,
            width: 20,
            child: const CircularProgressIndicator(strokeWidth: 2,)),
      ],
    ),
    backgroundColor: Colors.blue,
    duration:  Duration(days: 365),
  );

}