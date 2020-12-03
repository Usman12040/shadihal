import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Venue{
  int _venue_id;
  String _venue_name;
  String _price;
  String _area;
  String _contact_no;
  String _type;
  int _owner_id;
  String _address;
  String _capacity;
  int _rating;
  String _description;

  Venue(this._venue_id,this._venue_name,this._price,this._area,this._contact_no,this._type,this._owner_id,this._address, this._capacity, this._rating, this._description);

  int get venue_id=>_venue_id;
  String get venue_name => _venue_name;
  String get price =>_price;
  String get area => _area;
  String get contact_no=>_contact_no;
  String get type=>_type;
  int get owner_id=>_owner_id;
  String get address=>_address;
  String get capacity=>_capacity;
  int get rating=>_rating;
  String get description=>_description;

  set venue_name(String newVenueName){
    this._venue_name=newVenueName;
  }

  set price(String newPrice){
    this._price =newPrice;
  }

  set area(String newArea){
    this._area =newArea;
  }

  set contact_no(String newContact_no){
    this._contact_no =newContact_no;
  }

  set type(String newType){
    this._type=newType;
  }

  set owner_id(int newOwner_id){
    this._owner_id=newOwner_id;
  }

  set address(String newAddress){
    this._address=newAddress;
  }
  set capacity(String newCapacity){
    this._capacity=newCapacity;
  }
  set rating(int newRating){
    this._rating=newRating;
  }
  set description(String newDescription){
    this._description=newDescription;

  }

  //Convert venue cobject into a map object
  Map<String,dynamic> toMap(){
    var map=Map<String,dynamic>();
    if(venue_id!=null) {
      map['venue_id'] = _venue_id;
    }
    map['venue_name']=_venue_name;
    map['price']=_price;
    map['area']=_area;
    map['contact_no']=_contact_no;
    map['type']=_type;
    map['owner_id']=_owner_id;
    map['address']=_address;
    map['capacity']=_capacity;
    map['rating']=_rating;
    map['_description']=_description;
    return map;
  }
  //Extract a venue object from a Map object
  Venue.fromMapObject(Map<String,dynamic> map){
   this._venue_id =map['id'];
    this._venue_name =map['venue_name'];
    this._price=map['price'];
    this._area=map['area'];
    this._contact_no=map['contact_no'];
    this._type=map['type'];
    this._owner_id=map['owner_id'];
    this._address=map['address'];
    this._capacity=map['capacity'];
    this._rating=map['rating'];
    this._description=map['_description'];

  }
}


