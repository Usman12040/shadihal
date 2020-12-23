class Owner
{
  //int _owner_id;
   String _firstName;
   String _lastName;
   String _userName;
   String _pass;
   int _nic;
   int _phoneNo;

  Owner( this._firstName , this._lastName , this._userName , this._pass, this._nic , this._phoneNo);

  Owner.fromMapObject(Map<String, dynamic> map)
  {
    this._firstName = map['firstName'];
    this._lastName = map['lastName'];
    this._userName = map['userName'];
    this._pass = map['pass'];
    this._nic = map['nic'];
    this._phoneNo = map['phoneNo'];
  }

  Map<String, dynamic> toMap ()
  {
    var map = Map<String, dynamic>();

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