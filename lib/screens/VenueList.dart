import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'VenueDetails.dart';
import 'package:shadihal/Models/Owner.dart';
import 'package:shadihal/Utils/dbhelper.dart';
import 'package:shadihal/Models/Venue.dart';

class VenueList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VenueListState();
  }

}
class VenueListState extends State<VenueList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Venues"),

      ),
      body: ListVenue(),
    );

  }

}
ListView ListVenue() {
  return ListView(
    children: <Widget>[
      Card(

      child:Container(
        color: Colors.deepPurple,
        child:ListTile(
        leading: Icon(Icons.description),
        title: Text("Beach Luxury Hotel",style: TextStyle(color: Colors.white),),
        onTap: (){
          Get.to(VenueDetail());

  }
      )))


    ],
  );
}