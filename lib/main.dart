import 'package:flutter/material.dart';
import 'package:shadihal/screens/LoginScreen.dart';
import 'package:shadihal/screens/homescreen.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Shadihal",
    home:   homescreen(),
    theme: ThemeData(

      primarySwatch: Colors.deepPurple,
      accentColor: Colors.indigoAccent,

    ),

  )
  );

}
