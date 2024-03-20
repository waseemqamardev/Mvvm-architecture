import 'package:flutter/cupertino.dart';
import 'package:mvvmpractice/Model/userlist.dart';
import 'package:mvvmpractice/data/response/api_response.dart';

import '../Repository/auth_repository.dart';

class UserListProvider with ChangeNotifier{
  final _myrep = Authrepository();

  ApiResponse<UserList> userlist =ApiResponse.loading();
  setUserlist(ApiResponse<UserList> response) {
userlist=response;
notifyListeners();
  }
  Future<void> fetchuserlist() async {
    setUserlist(ApiResponse.loading());

  var response = _myrep.userlist().then((value) {

setUserlist(ApiResponse.completed(value));
  }).onError((error, stackTrace) {
    setUserlist(ApiResponse.error(error.toString()));
  }

  );
}



  }
