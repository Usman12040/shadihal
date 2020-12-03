import 'package:flutter/material.dart';
class VenueDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return VenueDetailState();
  }

}
class VenueDetailState extends State<VenueDetail>{
  @override
  Widget build(BuildContext context) {
    var description= Container(
      child: Text(
        "Beach Luxury is famous for its unique"
          " location in front of the sea"
          " It provides you a best place for"
            " your outdoor wedding.",
        style: TextStyle(color: Colors.yellow),
        textAlign: TextAlign.justify,
        textScaleFactor: 1.5,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Beach Luxury Hotel"),

      ),
      body: ListView(
        children: <Widget>[
          getImageAsset(),
          Container(height: 10.0),
          description,

        ],
      ),
    );
  }

}
Widget getImageAsset() {
  AssetImage assetImage = AssetImage("assets/BeachLuxury.jpg");
  Image image = Image(image: assetImage, width: 250.0, height: 300.0);
  return Container(
    child: image,
    margin: EdgeInsets.all(2.0),
  );
}