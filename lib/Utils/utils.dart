import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
      toastLength: Toast.LENGTH_SHORT


    );
  }
  static void flushbar(String message,BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      title: "Hi",
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInOut,
      flushbarPosition: FlushbarPosition.TOP,
      messageColor: Color(0xff123132),
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xff990909),
    )..show(context));
  }
  static void fieldfocus(BuildContext context,FocusNode current,FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}