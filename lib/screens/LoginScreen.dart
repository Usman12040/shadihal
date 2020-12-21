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
  TextEditingController userpasswordController = TextEditingController();
  TextEditingController ownernameController = TextEditingController();
  TextEditingController ownerpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child:Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Login"),
        bottom: TabBar(
          tabs: [
            Tab(text: "USER"),
            Tab(text: "MEMBER"),
          ],

        ),

      ),
        body: TabBarView(

        children:<Widget>[
          ListView(
          children: <Widget>[
            //username
            Padding(
          padding: EdgeInsets.only(top: 10.0,bottom:10.0),

          child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                  hintText: 'Enter Username',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )

              ),
              onChanged: (text){
                debugPrint('$usernameController');
              },


            )),
            //password
            TextField(
              controller: userpasswordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter 8-digit Password',
                hintStyle: TextStyle(color: Colors.grey),
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )

              ),
              onChanged: (text){
                //debugPrint('$text');
              },
            ),
            Padding(
              padding: EdgeInsets.only(top:20.0,left: 120.00,right: 120.00),
            child: RaisedButton(
        color: Theme.of(context).primaryColorDark,
    textColor: Theme.of(context).primaryColorLight,
    child: Text(
    'Login',
    textScaleFactor: 1.5,
    ),
    onPressed: () {
      if(usernameController.text=='admin'){
        if(userpasswordController.text=='admin'){
          debugPrint('correct username and password');
        }
      }
      else{
        debugPrint("incorrect");
      }
    },



            ))


          ],
        ),
        //2nd tab
          ListView(
            children: <Widget>[
              //username
              Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                child: TextField(
                controller: ownernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter Username',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )

                ),
                onChanged: (text){
                  debugPrint('$ownernameController');
                },


              )),
              //password
              TextField(
                controller: ownerpasswordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )

                ),
                onChanged: (text){
                  //debugPrint('$text');
                },
              ),
    Padding(
    padding: EdgeInsets.only(top:20.0,left: 120.00,right: 120.00),
              child: RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                child: Text(
                  'Login',
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  if(ownernameController.text=='admin'){
                    if(ownerpasswordController.text=='admin'){
                      debugPrint('correct username and password');
                    }
                  }
                  else{
                    debugPrint("incorrect");
                  }
                },



              ))


            ],
          ),


    ])));
  }


}
