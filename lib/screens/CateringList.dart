import 'package:flutter/material.dart';

class CateringList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CateringListState();
  }

}
class CateringListState extends State<CateringList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Catering"),

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