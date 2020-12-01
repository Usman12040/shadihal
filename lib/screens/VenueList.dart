import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text("Venues"),

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