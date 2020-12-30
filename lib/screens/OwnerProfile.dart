import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shadihal/screens/CateringForm.dart';
import 'package:shadihal/screens/OwnerVenuelist.dart';
import 'package:shadihal/screens/RentaCarForm.dart';
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   List<Widget> _widgetOptions = <Widget>[

    //OWNER PROFILE
    Scaffold(
        appBar: AppBar
        (
          title: Text("Owner Info"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>
      [
        Text("abc"),
        Text("CNIC"),
        Text("Phone No"),
      ],
    )),

    Scaffold(
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
    ),
    Scaffold(
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
    Scaffold(
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

        tooltip: 'Add Photography',
        backgroundColor: Colors.deepPurple,

        child: Icon(Icons.add_box_rounded),

      ),
    )


    ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==0){

      }
      if(_selectedIndex==1){

        Get.to(OwnerVenueList(this.owner));

      }

    });
  }

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

          ],
        ),


      bottomNavigationBar: Theme(
    data: Theme.of(context).copyWith(
      // sets the background color of the `BottomNavigationBar`
        canvasColor: Colors.deepPurple,
     ),
    child: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Venues',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wine_bar),
            label: 'Catering',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture_sharp),
            label: 'Rent a Car',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Photography',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    ));


  }

}





