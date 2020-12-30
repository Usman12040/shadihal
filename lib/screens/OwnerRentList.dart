import 'package:flutter/material.dart';
import 'package:shadihal/Models/Owner.dart';
import 'package:shadihal/screens/RentaCarForm.dart';
import 'package:get/get.dart';

class Ownerrentlist extends StatefulWidget
{
  Owner owner;

  Ownerrentlist(this.owner);

  @override
  State<StatefulWidget> createState() {
    return ownerrentliststate(this.owner);
  }

}
class ownerrentliststate extends State<Ownerrentlist> {
  Owner owner;

  ownerrentliststate(this.owner);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text('RENTACAR'),
      ),
      body: ListView(
        //lIST WILL BE RETRIEVED FROM DB
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          Get.to(RentaCarForm());

        },

        tooltip: 'Add Rent a Car',
        backgroundColor: Colors.deepPurple,

        child: Icon(Icons.add_box_rounded),

      ),
    ),
  }
}