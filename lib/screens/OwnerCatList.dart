import 'package:flutter/material.dart';
import 'package:shadihal/Models/Owner.dart';
import 'package:shadihal/screens/CateringForm.dart';
import 'package:get/get.dart';

class OwnerCatlist extends StatefulWidget
{
  Owner owner;

  OwnerCatlist(this.owner);

  @override
  State<StatefulWidget> createState() {
    return ownercatliststate(this.owner);
  }

}
class ownercatliststate extends State<OwnerCatlist> {
  Owner owner;

  ownercatliststate(this.owner);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text('CATERING'),
      ),
      body: ListView(
        //lIST WILL BE RETRIEVED FROM DB
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          Get.to(CateringForm());

        },

        tooltip: 'Add Catering',
        backgroundColor: Colors.deepPurple,

        child: Icon(Icons.add_box_rounded),

      ),
    );
  }
}