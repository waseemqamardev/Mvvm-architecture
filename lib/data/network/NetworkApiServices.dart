import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvmpractice/data/app_exception.dart';
import 'package:mvvmpractice/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    dynamic responsejson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responsejson=returnResponse(response);
    } on SocketException {
      throw FetchDataException("no internet connection");
    }
    return responsejson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async{
    dynamic responsejson;
    try {
      print(url);
     Response response= await post(Uri.parse(url),
       headers: {'content-type':"Application/json"},
       body:jsonEncode(data)

     ).timeout(Duration(seconds:10));
      responsejson=returnResponse(response);
    } on SocketException {
      throw FetchDataException("no internet connection");
    }
    return responsejson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(

                response.statusCode.toString());
    }
  }
}
