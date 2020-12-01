import "package:flutter/material.dart";

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }

}
class LoginState extends State<Login>{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),

      ),
        body: ListView(
          children: <Widget>[
            //username
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',

              ),
              onChanged: (text){
                debugPrint('$usernameController');
              },


            ),
            //password
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',

              ),
              onChanged: (text){
                //debugPrint('$text');
              },
            ),
            RaisedButton(
        color: Theme.of(context).primaryColorDark,
    textColor: Theme.of(context).primaryColorLight,
    child: Text(
    'Login',
    textScaleFactor: 1.5,
    ),
    onPressed: () {
      if(usernameController.text=='admin'){
        if(passwordController.text=='admin'){
          debugPrint('correct username and password');
        }
      }
      else{
        debugPrint("incorrect");
      }
    },



            )


          ],
        ),

    );
  }


}
