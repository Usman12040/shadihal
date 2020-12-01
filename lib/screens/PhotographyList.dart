import 'package:flutter/material.dart';

class PhotographyList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PhotographyListState();
  }

}
class PhotographyListState extends State<PhotographyList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Photography"),

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