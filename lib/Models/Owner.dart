import 'package:flutter/material.dart';

class Owner
{
  //INITIALIZATIONS
   int _owner_id;
   String _firstName;
   String _lastName;
   String _userName;
   String _pass;
   int _nic;
   int _phoneNo;

   //CONSTRUCTORS
    Owner( this._firstName , this._lastName , this._userName , this._pass, this._nic , this._phoneNo);

    Owner.withId(this._owner_id,  this._firstName , this._lastName , this._userName , this._pass, this._nic , this._phoneNo);

  //GETTERS
   int get owner_id => _owner_id;
   String get firstName => _firstName;
   String get lastName => _lastName;
   String get userName => _userName;
   String get pass => _pass;
   int get nic => _nic;
   int get phoneNo => _phoneNo;

   //SETTERS
   set firstName (String newFirstName)
   {
     if (newFirstName.length <= 255)
     {
       this._firstName = newFirstName;
     }
   }

   set lastName (String newLastName)
   {
     if (newLastName.length <= 255)
     {
       this._lastName = newLastName;
     }
   }

   set userName (String newUserName)
   {
     if (newUserName.length >= 8)
     {
       this._userName = newUserName;
     }
   }

   set pass (String newPass)
   {
     if (newPass.length >= 8)
     {
       this._pass = newPass;
     }
   }

   set nic (int newNic)
   {
     if (newNic.toString().length == 13)
     {
       this._nic = newNic;
     }
   }

   set phoneNo (int newPhoneNo)
   {
     if (newPhoneNo.toString().length == 10)
     {
       this._phoneNo = newPhoneNo;
     }
   }

   //Extract note obj from map obj
   Owner.fromMapObject (Map<String, dynamic> map)
  {
    this._owner_id = map['owner_id'];
    this._firstName = map['firstName'];
    this._lastName = map['lastName'];
    this._userName = map['userName'];
    this._pass = map['pass'];
    this._nic = map['nic'];
    this._phoneNo = map['phoneNo'];

    //fun();
  }

  //Converting Note Object to Map Object
  Map<String, dynamic> toMap ()
  {
    var map = Map<String, dynamic>();
    if( owner_id != null)
    {
      map['owner_id'] = _owner_id;
    }
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['userName'] = _userName;
    map['pass'] = _pass;
    map['nic'] = _nic;
    map['phoneNo'] = _phoneNo;

    return map;
  }

  void fun ()
  {
    print(this._firstName);
    print(this._lastName);
    print(this._userName);
    print(this._pass);
    print(this._nic);
    print(this._phoneNo);
  }

}

/*void main ()
{
  var o1 = new Owner("Muhammad", "Jawwad", "Jayyhub", "abcxyz", 4220128401261, 03423869615);
  o1.fun();
}*/