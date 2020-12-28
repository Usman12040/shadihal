import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Ownername"),
        Text("CNIC"),
        Text("Phone No"),
      ],
    ),
    Text(
      'Venue',
      style: optionStyle,
    ),
    Text(
      'Catering',
      style: optionStyle,
    ),
    Text(
      'Rent a Car',
        style: optionStyle,
    ),
    Text(
      'Photography',style: optionStyle,
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
      appBar: AppBar(
        title: Text("Owner Menu"),
      ),
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





