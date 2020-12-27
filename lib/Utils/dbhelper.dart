import 'dart:async';
import 'dart:io';
import 'package:shadihal/Models/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shadihal/Models/Owner.dart';
//import 'package:shadihal/Models/User.dart';

class dbHelper
{
  static dbHelper _helper;
  static Database _database;

  //OWNER COLUMNS
  String otablename = 'owner';
  String ocolid = 'owner_id';
  String ocolfname = 'first_name';
  String ocollname = 'last_name';
  String ocolusername = 'username';
  String ocolpass = 'password';
  String ocolnicno = 'nic_no';
  String ocolphoneno = 'phone_no';

  //USER COLUNS
  String utablename = 'user';
  String ucolid = 'user_id';
  String ucolfname = 'first_name';
  String ucollname = 'last_name';
  String ucolusername = 'username';
  String ucolpass = 'password';
  String ucolphoneno = 'phone_no';

  dbHelper._createInstance();

  factory dbHelper ()
  {
    if (_helper == null)
    {
      _helper = dbHelper._createInstance();
    }
    return _helper;
  }

  Future<Database> get database async
  {
    if (_database == null)
    {
      _database = await initDb();
    }
    return _database;
  }

  Future<Database> initDb ( ) async
  {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'Shadihal.db';
    
    var sdb = await openDatabase(path, version: 1, onCreate: _createDb);
    return sdb;
  }

  void _createDb (Database db, int newVersion) async
  {
    await db.execute(
        """CREATE TABLE $otablename (
          $ocolid	INTEGER NOT NULL,
          $ocolfname	TEXT NOT NULL,
          $ocollname	TEXT NOT NULL,
          $ocolusername	TEXT NOT NULL CHECK(length(username) > 7) UNIQUE,
          $ocolpass	TEXT NOT NULL CHECK(length(password) > 7),
          $ocolnicno	NUMERIC NOT NULL CHECK(length(nic_no) = 13) UNIQUE,
          $ocolphoneno	NUMERIC NOT NULL CHECK(length(phone_no) = 10),
          PRIMARY KEY( $ocolid AUTOINCREMENT)
          );
          """
    );
    await db.execute(
        """CREATE TABLE $utablename (
	        $ucolid	INTEGER NOT NULL,
          $ucolfname	TEXT NOT NULL,
	        $ucollname	TEXT NOT NULL,
	        $ucolusername	TEXT NOT NULL CHECK(length(username) > 7) UNIQUE,
	        $ucolpass	TEXT NOT NULL CHECK(length(password) > 7),
	        $ucolphoneno	NUMERIC CHECK(length(phone_no) = 10) UNIQUE,
	        PRIMARY KEY($ucolid AUTOINCREMENT)
          );
          """
    );
  }

  //OWNER CRUD OPERATIONS
    //GET OPERATIONS
      Future<List<Map<String, dynamic>>> getOwnersMapList() async
        {
          //debugPrint("Hello");
          Database db = await this.database;
          //debugPrint("Hello1");
          var result = await db.rawQuery('SELECT * FROM $otablename');
          //debugPrint("Hello2");
          return result;
        }
    //INSERT OPERATIONS
      Future<int> insertOwner (Owner owner) async
      {
        // debugPrint(owner.firstName);
        // debugPrint(owner.lastName);
        // debugPrint(owner.userName);
        // debugPrint(owner.pass);
        // debugPrint(owner.nic.toString());
        // debugPrint(owner.phoneNo.toString());
        Database db = await this.database;
        var result = await db.insert(otablename, owner.toMap());
        return result;
      }
    //UPDATE OPERATIONS
      Future<int> updateOwner (Owner owner) async
      {
        Database db = await this.database;
        var result = await db.update(otablename, owner.toMap(), where: '$ocolid ?', whereArgs: [owner.owner_id]);
        return result;
      }
    //DELETE OPERATIONS
      Future<int> deleteOwner (int id) async
      {
      var db = await this.database;
      int result = await db.rawDelete('DELETE FROM $otablename WHERE $ocolid = $id');
      return result;
      }
    //GET NUMBER OF ROWS
      Future<int> getCount () async
      {
        Database db = await this.database;
        List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT(*) FROM $otablename');
        int result = Sqflite.firstIntValue(x);
        return result;
      }

    //OWNER RETRIEVE OPERATIONS
      Future<List<Owner>> getOwnerList ( ) async
      {
        var ownerMapList = await getOwnersMapList();
        int count = ownerMapList.length;

        List<Owner> ownerList = List<Owner>();

        for(int i=0; i<count; i++)
        {
          ownerList.add(Owner.fromMapObject(ownerMapList[i]));
        }

        return ownerList;
      }

    //OWNER PROFILE CHECK
      Future<dynamic> checkOwnerProfie (String oname, String opass) async
      {
        Database db = await this.database;
        var result = await db.rawQuery('SELECT * FROM $otablename WHERE $otablename.$ocolusername = "$oname" AND $otablename.$ocolpass = "$opass"');
        if (result.length != 0)
        {
          //debugPrint("Success");
          Owner owner = Owner.fromMapObject(result[0]);
          // debugPrint(user.firstName);
          // debugPrint(user.lastName);
          // debugPrint(user.userName);
          // debugPrint(user.pass);
          // debugPrint(user.phoneNo.toString());
          return owner;
        }
        else
        {
          return 0;
        }
      }

  //USER CRUD OPERATIONS
    //GET OPERATIONS
    Future<List<Map<String, dynamic>>> getUsersMapList() async
    {
      //debugPrint("Hello");
      Database db = await this.database;
      //debugPrint("Hello1");
      var result = await db.rawQuery('SELECT * FROM $utablename');
      //debugPrint("Hello2");
      return result;
    }
    //INSERT OPERATIONS
    Future<int> insertUser (User user) async
    {
      debugPrint(user.firstName);
      debugPrint(user.lastName);
      debugPrint(user.userName);
      debugPrint(user.pass);
      debugPrint(user.phoneNo.toString());
      Database db = await this.database;
      var result = await db.insert(utablename, user.toMap());
      return result;
    }
    //UPDATE OPERATIONS
    Future<int> updateUser (User user) async
    {
      Database db = await this.database;
      var result = await db.update(utablename, user.toMap(), where: '$ucolid ?', whereArgs: [user.user_id]);
      return result;
    }
    //DELETE OPERATIONS
    Future<int> deleteUser (int id) async
    {
      var db = await this.database;
      int result = await db.rawDelete('DELETE FROM $utablename WHERE $ucolid = $id');
      return result;
    }
    //GET NUMBER OF ROWS
    Future<int> getoCount () async
    {
      Database db = await this.database;
      List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT(*) FROM $utablename');
      int result = Sqflite.firstIntValue(x);
      return result;
    }

  //USER RETRIEVE OPERATIONS
  Future<List<User>> getUsersList ( ) async
  {
    var userMapList = await getUsersMapList();
    int count = userMapList.length;

    List<User> userList = List<User>();

    for (int i = 0; i < count; i++) {
      userList.add(User.fromMapObject(userMapList[i]));
    }
  }

  //USER PROFILE CHECK
  Future<dynamic> checkUserProfie (String uname, String upass) async
  {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $utablename WHERE $utablename.$ucolusername = "$uname" AND $utablename.$ucolpass = "$upass"');
    if (result.length != 0)
    {
      //debugPrint("Success");
      User user = User.fromMapObject(result[0]);
      // debugPrint(user.firstName);
      // debugPrint(user.lastName);
      // debugPrint(user.userName);
      // debugPrint(user.pass);
      // debugPrint(user.phoneNo.toString());
      return user;
    }
    else
    {
      return 0;
    }
  }
}