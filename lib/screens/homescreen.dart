import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shadihal/Models/Owner.dart';
import 'package:shadihal/Models/User.dart';
import 'package:shadihal/screens/CateringList.dart';
import 'package:shadihal/screens/PhotographyList.dart';
import 'package:shadihal/screens/RentaCarList.dart';
import 'package:shadihal/screens/LoginScreen.dart';
import 'package:shadihal/screens/Signup.dart';
import 'VenueList.dart';

class homescreen extends StatefulWidget
{
  final User user;

  homescreen([this.user]);

  @override
  State<StatefulWidget> createState() {
    return Homestate(this.user);
  }
}

class Homestate extends State<homescreen>
{
  final _minimumPadding = 5.0;
  User user;

  Homestate([this.user]);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => SystemNavigator.pop(),
        child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title:Text('Shadihal'),
           // actions: <Widget>[
            //  Padding(
              //padding: EdgeInsets.only(right: 20.0),
              //child: GestureDetector(
                //child: Icon(Icons.search),
              //onTap: (){

              //},
            //)),

          //],

        ),
        drawer: Drawer(



          child: Container(
            color: Colors.black,
           child:ListView(
            children: <Widget>[
              SizedBox(
              height: 65.0,
              child:DrawerHeader(
                //margin: EdgeInsets.only(top:5.0),
                child: Text('Menu',
                textScaleFactor: 1.7,
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,

                ),
              )
              ),
              ListTile(
                title: Text('Login',style: TextStyle(color: Colors.yellow),textScaleFactor: 1.2),
                onTap: () {
                  // Update the state of the app.
                  Get.to(Login());
                  // ...
                },
              ),
              ListTile(
                title: Text('Sign Up',style: TextStyle(color: Colors.yellow),textScaleFactor: 1.2),
                onTap: () {
                  // Update the state of the app.
                  Get.to(Signup());
                  // ...
                },
              ),
              ListTile(
                title: Text('About Us',style: TextStyle(color: Colors.yellow),textScaleFactor: 1.2),
                onTap: () {
                  // Update the state of the app.

                  // ...
                },
              ),
              ListTile(
                title: Text('Contact Us',style: TextStyle(color: Colors.yellow),textScaleFactor: 1.2),
                onTap: () {
                  // Update the state of the app.

                  // ...
                },
              ),
              ListTile(
                title: Text('Join Us',style: TextStyle(color: Colors.yellow),textScaleFactor: 1.2),
                onTap: () {
                  // Update the state of the app.

                  // ...
                },
              ),

            ],
          )),
        ),



        body: Padding(
            padding: EdgeInsets.only(
                top: _minimumPadding * 5, bottom: _minimumPadding * 5),
            child: ListView(
              children: <Widget>[
                //first Child
                venue_opt(),
                Container(height: 25.0),
                catering_opt(),
                Container(height: 25.0),
                rent_a_car(),
                Container(height: 25.0),
                Photography(),
              ],
            ))));
  }

  Widget venue_opt() {
    AssetImage assetImage = AssetImage('assets/venue.jpg');
    Image image = Image(image: assetImage, fit: BoxFit.fill,);
    return InkWell(
      child: Column(children: <Widget>[
        Container(height:10.0),
        Container(
            height: 200.0,
            width: 300.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),

              child: image,

            ),


        ),
        Container(
          height: 10.0,
        ),
        Text("VENUE",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: Colors.yellow)),
        Text("starting from Rs.10000",
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
      ]),
      onTap: () {
        Get.to(VenueList());
      },
    );
  }

  Widget catering_opt() {
    AssetImage assetImage = AssetImage('assets/Catering.jpg');
    Image image = Image(image: assetImage, fit: BoxFit.fill,);
    return InkWell(
      child: Column(children: <Widget>[
        Container(height:10.0),
        Container(
          height: 200.0,
          width: 300.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),

            child: image,

          ),


        ),
        Container(
          height: 10.0,
        ),
        Text("CATERING",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: Colors.yellow)),
        Text("starting from Rs.5000",
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
      ]),
      onTap: () {
        Get.to(CateringList());
      },


    );
  }

  Widget rent_a_car() {
    AssetImage assetImage = AssetImage('assets/Rent.jpg');
    Image image = Image(image: assetImage, fit: BoxFit.fill,);
    return InkWell(
      child: Column(children: <Widget>[
        Container(height:10.0),
        Container(
          height: 200.0,
          width: 300.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),

            child: image,

          ),


        ),
        Container(
          height: 10.0,
        ),
        Text("RENT A CAR",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: Colors.yellow)),
        Text("starting from Rs.1000",
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
      ]),
      onTap: () {
        Get.to(RentaCarList());
      },
    );
  }

  Widget Photography() {
    AssetImage assetImage = AssetImage('assets/photo.jpg');
    Image image = Image(image: assetImage, fit: BoxFit.fill);
    return InkWell(
      child: Column(children: <Widget>[
        Container(height:10.0),
        Container(
          height: 200.0,
          width: 300.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),

            child: image,

          ),


        ),
        Container(
          height: 10.0,
        ),
        Text("PHOTOGRAPHY",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: Colors.yellow)),
        Text("starting from Rs.5000",
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
      ]),
      onTap: () {
        Get.to(PhotographyList());
      },
    );
  }
}
