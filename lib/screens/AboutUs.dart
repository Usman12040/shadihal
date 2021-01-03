import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class aboutus extends StatelessWidget
{
  @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar
            (
            title: Text("ABOUT US"),
          ),
          body: Center(

                   child: Container(
                     margin: EdgeInsets.only(top: 20.0),
                   child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>
                  [
                    Container(height: 50.0,
                      child:Text("Our Company", textAlign:TextAlign.center,
                        style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),),
                    Text("Shadihal is an official product of ASUM Technologies."
                        "At ASUM Technologies we provide  Top Quality Software Solutions."),


                    Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Container(height: 50.0,
                          child:Text("Our Team", textAlign:TextAlign.center,
                            style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),), ),

                    Text("Usman Yousuf",style: TextStyle(fontSize: 20.0),),



                                  ]),)));



    }
  }



