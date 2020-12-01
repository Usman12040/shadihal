import 'package:flutter/material.dart';

class RentaCarList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RentaCarListState();
  }

}
class RentaCarListState extends State<RentaCarList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Rent A Car"),

      ),
      //body: ListVenue(),
    );

  }

}
ListView ListVenue() {
  return ListView(
    children: <Widget>[],
  );
}