import 'package:flutter/material.dart';


import '../View_Model/Services/splash_services.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashServices splashServices=SplashServices();
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("splash Screen",style:Theme.of(context).textTheme.headlineLarge ,),
      )
    );
  }
}
