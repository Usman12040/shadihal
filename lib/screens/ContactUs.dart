import 'package:flutter/material.dart';
class ContactUs extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() {
    return contactusstate();
  }

}
class contactusstate extends State<ContactUs> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar
          (
          title: Text("JOIN US"),
        ),
        body:Padding(
            padding: EdgeInsets.only(left: 100.0,top: 100.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>
                [
                  Container(height: 50.0,
                    child:Text("Connect with US", textAlign:TextAlign.center, style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),),
                  Container(height: 50.0,
                    child: Text("Send your CV at:",style: TextStyle(fontSize: 20.0,color: Colors.white),),),
                  Container(height: 50.0,
                    child: Text("k180159@nu.edu.pk", textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)),)

                ]
            )));
  }
}