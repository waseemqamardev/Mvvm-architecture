import 'package:flutter/material.dart';


import '../colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
   RoundButton({super.key,required this.title,required this.onpress,this.loading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,

      child: Container(

        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: Appcolor.buttoncolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: loading? CircularProgressIndicator():Text(title,style: TextStyle(color: Appcolor.whitecolor),)),
      ),
    );
  }
}
