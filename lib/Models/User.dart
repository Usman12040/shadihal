import 'package:shadihal/Models/Owner.dart';

class User
{
  String _firstName;
  String _lastName;
  String _userName;
  String _pass;
  int _phoneNo;

  User(this._firstName, this._lastName, this._userName, this._pass, this._phoneNo);

  Map<String, dynamic> toMAp ()
  {
    var map = Map<String, dynamic>();

    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['userName'] = _userName;
    map['pass'] = _pass;
    map['phoneNo'] = _phoneNo;

    return map;

  }

  User.fromMapObject (Map<String, dynamic> map)
  {
    this._firstName = map['firstName'];
    this._lastName = map['lastName'];
    this._userName = map['userName'];
    this._pass = map['pass'];
    this._phoneNo = map['phoneNo'];
  }

  void fun ()
  {
    print(this._firstName);
    print(this._lastName);
    print(this._userName);
    print(this._pass);
    print(this._phoneNo);
  }

}