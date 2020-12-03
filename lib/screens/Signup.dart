import "package:flutter/material.dart";

class Signup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignupState();
  }

}
class SignupState extends State<Signup>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),

      ),
      body: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Enter Username",
              ),
            ),



          ],
        ),

    );
  }


}
