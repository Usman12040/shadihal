import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shadihal/screens/CateringForm.dart';
import 'package:shadihal/screens/VenueForm.dart';

class Ownerprofile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return ownerprofilestate();
  }

}
class ownerprofilestate extends State<Ownerprofile>{
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    //OWNER PROFILE
    Scaffold(
        appBar: AppBar(
          title: Text("Owner Info"),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Ownername"),
        Text("CNIC"),
        Text("Phone No"),
      ],
    )),
    //OWNER VENUE LIST
    Scaffold(
      appBar: AppBar(
        title: Text('VENUES'),
      ),
      body: ListView(
        //lIST WILL BE RETRIEVED FROM DB
      ),

  floatingActionButton: FloatingActionButton(
  onPressed: () {
  debugPrint('FAB clicked');
  Get.to(VenueForm());
  },

  tooltip: 'Add Venue',
   backgroundColor: Colors.deepPurple,

  child: Icon(Icons.add_business_rounded),

  ),
    ),
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

      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clickeD');

        },

        tooltip: 'Add Photography',
        backgroundColor: Colors.deepPurple,

        child: Icon(Icons.add_box_rounded),

      ),*/
    )


    ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Center(
          child: _widgetOptions.elementAt(_selectedIndex),
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





