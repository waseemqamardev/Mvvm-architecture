import 'package:flutter/material.dart';
import 'package:mvvmpractice/Model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{
  Future<bool> saveUser(UserModel user)async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());

    notifyListeners();
    return true;

  }
  Future<UserModel> getUser()async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    final String? token=sp.getString("token");
    print("sss ${token.toString()}");

    return UserModel(
      token: token.toString()
    );
  }
  Future<bool> remove()async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    notifyListeners();

    sp.remove("token");

    return true;

  }
}