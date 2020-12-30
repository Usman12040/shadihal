import 'package:flutter/material.dart';
class JoinUs extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() {
    return joinusstate();
  }

}
class joinusstate extends State<JoinUs> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar
          (
          title: Text("Owner Menu"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              Text("JOIN US",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
              Text("Send your CV at:"),
              Text("k180159@nu.edu.pk"),

            ]
        ));
  }
}