
import 'package:mvvmpractice/Model/userlist.dart';
import 'package:mvvmpractice/data/network/NetworkApiServices.dart';
import 'package:mvvmpractice/data/network/baseApiServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Resourses/app_urls.dart';

class Authrepository{
  BaseApiServices _apiServices=NetworkApiService();
  Future<void> saveTokenToSharedPref(String token) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", token);
  }


  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrls.loginApiEndpoint, data);

      // Assuming you receive a token in the response
      if (response != null && response['token'] != null) {
        // Save the token to SharedPreferences
        saveTokenToSharedPref(response['token']);
      }

      print("response $response");
      return response;
    } catch (e) {
      throw e;
    }
  }
  Future<dynamic> signpApi(dynamic data)async{
    try{
dynamic response= await _apiServices.getPostApiResponse(AppUrls.registerApiEndpoint, data);
print("api asdsa hit");
return response;
    }catch(e){
      throw e;
    }

  }

  Future<UserList> userlist( )async{
    try{
      dynamic response= await _apiServices.getApiResponse(AppUrls.getApiEndpoint);
      print("api fetch $response");


      return UserList.fromJson(response);
    }catch(e){
      throw e;
    }

  }
}