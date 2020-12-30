import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shadihal/screens/CateringForm.dart';
import 'package:shadihal/screens/OwnerCatList.dart';
import 'package:shadihal/screens/OwnerVenuelist.dart';
import 'package:shadihal/screens/OwnerPhotolist.dart';
import 'package:shadihal/screens/RentaCarForm.dart';
import 'package:shadihal/screens/OwnerRentlist.dart';
import 'package:shadihal/screens/VenueForm.dart';
import 'PhotoGraphyForm.dart';
import 'package:shadihal/Models/Owner.dart';

class Ownerprofile extends StatefulWidget
{
   Owner owner;

  Ownerprofile(this.owner);

  @override
  State<StatefulWidget> createState() {
      return ownerprofilestate(this.owner);
  }

}
class ownerprofilestate extends State<Ownerprofile>
{
  Owner owner;
  ownerprofilestate(this.owner);
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar
          (
          title: Text("Owner Menu"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>
          [
            Text(owner.firstName+owner.lastName),
            Text(owner.phoneNo.toString()),
            Text(owner.nic.toString()),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: Colors.deepPurple),
                    child: Text("Your Venues", style: TextStyle(fontSize: 20.0,color: Colors.white)),

                    onPressed: ()
                    {
                      Get.to(OwnerVenueList(this.owner));

                    },
                  )]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: Colors.deepPurple),
                    child: Text("Your Catering Services", style: TextStyle(fontSize: 20.0,color: Colors.white)),

                    onPressed: ()
                    {
                      Get.to(OwnerCatlist(owner));

                    },
                  )]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: Colors.deepPurple),
                    child: Text("Your RentaCar Services", style: TextStyle(fontSize: 20.0,color: Colors.white)),

                    onPressed: ()
                    {
                      Get.to(Ownerrentlist(owner));

                    },
                  )]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: Colors.deepPurple),
                    child: Text("Your RentaCar Services", style: TextStyle(fontSize: 20.0,color: Colors.white)),

                    onPressed: ()
                    {
                      Get.to(Ownerphotolist(owner));

                    },
                  )]),



          ],
        ));

  }

}





