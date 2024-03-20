

import 'package:flutter/foundation.dart';
import 'package:mvvmpractice/Utils/Routes/Routesname.dart';
import 'package:mvvmpractice/View_Model/user_view_model.dart';
import 'package:flutter/material.dart';

import '../../Model/UserModel.dart';



class SplashServices {
  Future<UserModel> getUserdata() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    try {
      final UserModel value = await getUserdata();
      print("token is ${value.token}");

      if (value.token == "null" || value.token!.isEmpty) {
        // User is not authenticated, navigate to the login screen
        await Future.delayed(Duration(seconds: 4));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        // User is authenticated, navigate to the home screen
        print("got a token ${value.token}");
        await Future.delayed(Duration(seconds: 4));
        Navigator.pushNamed(context, RoutesName.home);
      }
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print("Error in checkAuthentication: $error");
      }
    }
  }
}
