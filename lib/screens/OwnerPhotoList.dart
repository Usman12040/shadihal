import 'package:flutter/material.dart';
import 'package:shadihal/Models/Owner.dart';
import 'package:shadihal/screens/PhotoGraphyForm.dart';
import 'package:get/get.dart';
class Ownerphotolist extends StatefulWidget
{
  Owner owner;

  Ownerphotolist(this.owner);

  @override
  State<StatefulWidget> createState() {
    return ownerphotoliststate(this.owner);
  }

}
class ownerphotoliststate extends State<Ownerphotolist> {
  Owner owner;

  ownerphotoliststate(this.owner);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text('PHOTOGRAPHY'),
      ),
      body: ListView(
        //lIST WILL BE RETRIEVED FROM DB
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          Get.to(PhotographyForm());

        },

        tooltip: 'Add Service',
        backgroundColor: Colors.deepPurple,

        child: Icon(Icons.add_box_rounded),

      ),
    );
  }
}