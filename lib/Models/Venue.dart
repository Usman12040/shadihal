import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class Owner{
   int _owner_id;
   String _owner_name;
   String _NIC;
   String _contact_no;

  Owner(this._owner_id,this._owner_name,[this._NIC],this._contact_no);

  int get owner_id=>_owner_id;
  String get owner_name=>_owner_name;
  String get NIC =>_NIC;
  String get contact_no=> _contact_no;
  set owner_name(String newOwnername){
    if(newOwnername.length<=20) {
      this._owner_name = newOwnername;
    }
  }
  set NIC(String newNIC){
    if(newNIC.length<=14){
      this._NIC=newNIC;

    }

  }
  set contact_no(String newContactno){
    if(newContactno<=11){
      this._contact_no=newContactno;
    }
  }




}
class Venue{
  final int venue_id;
  final String venue_name;
  final String price;
  final String area;
  final String contact_no;
  final String type;
  final int owner_id;
  final String address;
  final String capacity;
  final String rating;
  final String description;

  Venue(this.venue_id,this.venue_name,this.price,this.area,this.owner_id,this.contact_no,this.type,this.address, this.capacity, this.rating, this.description)
}


