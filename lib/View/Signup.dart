import 'package:flutter/material.dart';

import 'package:mvvmpractice/View_Model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../Resourses/Components/round_button.dart';
import '../Utils/Routes/Routesname.dart';
import '../Utils/utils.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  ValueNotifier <bool> _obsecure=ValueNotifier<bool>(true);
  FocusNode emailFocusNode=FocusNode();
  FocusNode passFocusNode=FocusNode();
  @override
  void dispose(){
    super.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authviewMode=Provider.of<AuthViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Signup"),
          centerTitle: true,),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcontroller,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (val){
                  Utils.fieldfocus(context, emailFocusNode, passFocusNode);
                },
                decoration: InputDecoration(
                    hintText: "email",
                    labelText: "email",
                    prefixIcon: Icon(Icons.alternate_email)

                ),
              ),
              ValueListenableBuilder(valueListenable: _obsecure, builder:(context,value,child){
                return  TextFormField(
                  controller: passcontroller,
                  focusNode: passFocusNode,
                  obscureText: _obsecure.value,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(

                      hintText: "pass",
                      labelText: "password",
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                          onTap: (){
                            _obsecure.value= !_obsecure.value;
                          },
                          child: Icon(_obsecure.value? Icons.visibility_off_outlined:Icons.visibility))

                  ),
                );
              }),
              SizedBox(height: 40,),
              RoundButton(title: 'Signup',loading: authviewMode.signup, onpress: () {
                if(emailcontroller.text.isEmpty){
                  Utils.flushbar("email is empty", context);

                }else if(passcontroller.text.isEmpty){
                  Utils.flushbar("pass is empty", context);
                }else if(passcontroller.text.length<6){
                  Utils.flushbar("pass is less than 7", context);
                }else{
                  Map data={
                    "email":emailcontroller.text.toString(),
                    "password":passcontroller.text.toString(),
                  };
                  print(data);
                  authviewMode.signupApi(data, context);
                  Utils.flushbar("Register successfull", context);
                }
              },),
              SizedBox(height: 20,),
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Text("Already have account ?login")),


            ],
          ),
        )
    );
  }
}
