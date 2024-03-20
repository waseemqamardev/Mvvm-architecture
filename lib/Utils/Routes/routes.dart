  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvmpractice/View/Login.dart';
import 'package:mvvmpractice/View/createjob.dart';
import 'package:mvvmpractice/View/splash_screen.dart';

import '../../View/Signup.dart';
import '../../View/home.dart';
import 'Routesname.dart';

class Routes{
  static Route<dynamic>
  generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>Home());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>login());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context)=>Signup());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=>Splash());
      case RoutesName.create:
        return MaterialPageRoute(builder: (BuildContext context)=>Createjob());
      default: return MaterialPageRoute(builder: (_){
        return Scaffold(
        body: Center(
        child:Text("no route is found") ,
        ),
        );
      });
    }
  }

  }