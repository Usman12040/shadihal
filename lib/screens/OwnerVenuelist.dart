import 'package:shadihal/Models/Owner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadihal/screens/VenueForm.dart';
class OwnerVenueList extends StatefulWidget
{
  final Owner owner;

  OwnerVenueList(this.owner);

  @override
  State<StatefulWidget> createState() {
    return ownervenueliststate(this.owner);
  }

}
class ownervenueliststate extends State<OwnerVenueList> {
  Owner owner;

  ownervenueliststate(this.owner);

  @override
  Widget build(BuildContext context)
  {
   return Scaffold(
      appBar: AppBar(
        title: Text('VENUES'),
      ),
      body: ListView(

        children: <Widget>
        [
          Text(owner.phoneNo.toString()),
        ],
        //lIST WILL BE RETRIEVED FROM DB
        //List<Venue> l1 = getVenueList (this.owner.owner_id);
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          Get.to(VenueForm(this.owner));
        },

        tooltip: 'Add Venue',
        backgroundColor: Colors.deepPurple,

        child: Icon(Icons.add_business_rounded),

      ),
    );
  }
}