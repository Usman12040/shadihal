import 'package:flutter/material.dart';
import 'package:shadihal/Models/photography.dart';
import 'package:shadihal/Utils/dbhelper.dart';
import 'package:sqflite/sqflite.dart';

class PhotographyList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PhotographyListState();
  }

}
class PhotographyListState extends State<PhotographyList> {
  int count = 0;
  dbHelper sdbhelper = dbHelper();
  List <photography> vlist;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (vlist == null) {
      vlist = List<photography>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Photography"),

      ),
      body: ListPhotograpy(),
    );
  }
  void updateListView() {
    final Future<Database> dbFuture = sdbhelper.initDb();
    dbFuture.then((database) {
      Future<List<photography>> l1 = sdbhelper.getPhotographyList1();
      l1.then((vList) {
        setState(() {
          this.vlist = vList;
          this.count = vList.length;
        });
      });
    });
  }


  ListView ListPhotograpy() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(

            leading: Image(image: AssetImage("assets/photo.jpg"),
            ),

            title: Text(this.vlist[position].service_name),

            subtitle: Text("Starting from"+" "+this.vlist[position].price.toString()),
            onTap: () {
              debugPrint("ListTile Tapped");
              //  Get.to(VenueDetail(this.vlist[position]));
            },

          ),
        );
      },
    );

  }
}