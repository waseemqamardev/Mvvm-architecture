import 'package:flutter/material.dart';
import 'package:mvvmpractice/Utils/Routes/Routesname.dart';
import 'package:mvvmpractice/View_Model/auth_view_model.dart';
import 'package:mvvmpractice/View_Model/user_view_model.dart';
import 'package:mvvmpractice/View_Model/userlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utils/Routes/routes.dart';
import 'View/Login.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:  [
      ChangeNotifierProvider(create: (_)=>AuthViewModel()),
      ChangeNotifierProvider(create: (_)=>UserViewModel()),
      ChangeNotifierProvider(create: (_)=>UserListProvider())
    ],
    child:  MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,

    ),
    initialRoute: RoutesName.splash,
    onGenerateRoute: Routes.generateRoute,
    ),
    );
  }
}



