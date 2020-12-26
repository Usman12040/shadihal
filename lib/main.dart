import 'package:flutter/material.dart';
import 'package:shadihal/screens/LoginScreen.dart';
import 'package:shadihal/screens/Signup.dart';
import 'package:shadihal/screens/homescreen.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Shadihal",
    home:   MainScreen(),
    theme: ThemeData(

      primarySwatch: Colors.deepPurple,
      accentColor: Colors.indigoAccent,

    ),

  )
  );

  }
class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}
class MainScreenState extends State<MainScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("SHADIHAL"),
        actions: <Widget>[
          FlatButton(
            child: Text("SKIP"),
            onPressed: (){
             Get.to(homescreen());
            },

          )
        ],
      ),
      body:  Stack(
          alignment: Alignment.bottomCenter,

        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Carousel(

            images: carouselimages,
            borderRadius: true,
            boxFit: BoxFit.cover,

          ),

          Container(
            margin: EdgeInsets.only(top:700.0),

              child: Column(
                  children:<Widget>[
                    Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

           children: <Widget>[

          Container(
              height: 50.0,
              width: 150.0,
             child: RaisedButton(
            child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontSize: 20.0),),
            color: Colors.deepPurple,
            onPressed: (){
              Get.to(Login());
            },

          )),
              Container(
                  height: 50.0,
                  width: 150.0,
                  child: RaisedButton(
            child: Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20.0),),
            color: Colors.deepPurple,
            onPressed: (){
              Get.to(Signup());
            },
          ))
           ])]))
          // Column(
          //   children: <Widget>[
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10.0),
          //         gradient: LinearGradient(colors: [
          //           Colors.lightBlueAccent,
          //           Color(0xFF2508FF),
          //           Colors.lightBlueAccent,
          //         ], begin: Alignment.centerRight, end: Alignment.centerLeft),
          //       ),
          //       height: 50,
          //       width: MediaQuery.of(context).size.width - 20,
          //       child: RaisedButton(
          //         elevation: 0,
          //         onPressed: () {
          //           Get.to(homescreen());
          //         },
          //         color: Colors.transparent,
          //         child: Text(
          //           "Get Started",
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 22,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Text(
          //           "Don't have an account?",
          //           style: TextStyle(
          //             fontSize: 15,
          //             color: Colors.yellow,
          //           ),
          //         ),
          //         SizedBox(
          //           width: 15,
          //         ),
          //         Text(
          //           " SignUp ",
          //           style: TextStyle(
          //               fontSize: 15,
          //               color: Colors.blue,
          //               fontWeight: FontWeight.bold),
          //         ),
               // ],
              //),
           // ],
          //),
        ],
      ),



    );
  }
  final List<AssetImage> carouselimages = [
    AssetImage("assets/Mvenue.jpg"),
    AssetImage("assets/MCatering.jpg"),
    AssetImage("assets/MRent.jpg"),
    AssetImage("assets/Mphoto.jpg"),
    //AssetImage("assets/BeachLuxury.jpg"),
  ];

}
