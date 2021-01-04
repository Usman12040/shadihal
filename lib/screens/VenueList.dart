import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadihal/Models/Photo.dart';
import 'package:sqflite/sqflite.dart';
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
class VenueListState extends State<VenueList> {
  int count = 0;
  dbHelper sdbhelper = dbHelper();
  List <Venue> vlist;
  List <Photo> images;
  @override
  Widget build(BuildContext context) {
    if (vlist == null) {
      vlist = List<Venue>();
      updateListView();
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Venues"),

      ),
      body: ListVenue(),
    );
  }
  void updateListView() {
    final Future<Database> dbFuture = sdbhelper.initDb();
    dbFuture.then((database) {
      Future<List<Venue>> l1 = sdbhelper.getVenueList1();
      l1.then((vList) {
        setState(() {
          this.vlist = vList;
          this.count = vList.length;
        });
      });
    });
  }

  ListView ListVenue() {
    // return ListView(
    //   children: <Widget>[
    //     Card(
    //
    //     child:Container(
    //       color: Colors.deepPurple,
    //       child:ListTile(
    //       leading: Icon(Icons.description),
    //       title: Text("Beach Luxury Hotel",style: TextStyle(color: Colors.white),),
    //       onTap: (){
    //         Get.to(VenueDetail());
    //
    // }
    //     )))
    //
    //
    //   ],
    // );
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(

            leading: Image(image: AssetImage("assets/venue.jpg"),
            ),

            title: Text(this.vlist[position].venue_name),

            subtitle: Text("Starting from"+" "+this.vlist[position].pricelb.toString()),
            onTap: () {
              debugPrint("ListTile Tapped");
              Get.to(VenueDetail(this.vlist[position]));
            },

          ),
        );
      },
    );

  }


}