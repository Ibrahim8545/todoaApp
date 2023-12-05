import 'package:flutter/material.dart';

import 'dart:html';

Widget defult_TFF({
  @required  TextEditingController?tntController,
  @required TextInputType? textInputType,
  @required String? label ,
   @required IconData? prefixicon ,
  double? borderSize ,
  @required String? validateText ,
  IconData? suffix ,

  void Function()? passwordshow, required TextEditingController  ,
})
=> TextFormField(
    controller:tntController,
  keyboardType: textInputType,
  decoration: InputDecoration(
    labelText: label ,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderSize != null ? borderSize : 10) ,
    ),
    border:  OutlineInputBorder() ,
    prefixIcon: Icon(
      prefixicon,
    ),
    suffixIcon: suffix !=null ? IconButton(
      onPressed: passwordshow ,
      icon: Icon(
        suffix,
      ),
    ) : null,
  ),
  validator:(value){
    if(value!.isEmpty){
      return validateText;
    }
    else{
      return null ;


    }
  },
);