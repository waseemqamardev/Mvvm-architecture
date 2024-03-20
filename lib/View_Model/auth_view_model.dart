import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmpractice/Repository/auth_repository.dart';
import 'package:mvvmpractice/Utils/Routes/Routesname.dart';
import 'package:mvvmpractice/Utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myrep = Authrepository();
  bool _loading=false;
  bool get loading => _loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
  bool _signup=false;
  bool get signup=>_signup;
  signuploading(bool value){
    _signup=value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
       var response =   _myrep.loginApi(data).then((value)
       {

      setLoading(false);


      if(kDebugMode){
        Utils.flushbar("login successfully", context);
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        Utils.flushbar(error.toString(), context);
        print(error.toString());
      }

    });

    print("fffffffffffff");
  }
  Future<void> signupApi(dynamic data, BuildContext context) async {
    signuploading(true);
    _myrep.signpApi(data).then((value) {
      signuploading(false);

      if(kDebugMode){
        Utils.flushbar("Register successfully", context);
        Navigator.pushNamed(context, RoutesName.login);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      signuploading(false);
      if(kDebugMode){
        Utils.flushbar(error.toString(), context);
        print(error.toString());
      }

    });
  }
}
