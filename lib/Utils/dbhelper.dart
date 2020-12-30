import 'dart:async';
import 'dart:io';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shadihal/Models/Rent_a_car.dart';
import 'package:shadihal/Models/User.dart';
import 'package:shadihal/Models/Venue.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shadihal/Models/Owner.dart';
import 'package:shadihal/Models/Photo.dart';

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

  //USER COLUMNS
  String utablename = 'user';
  String ucolid = 'user_id';
  String ucolfname = 'first_name';
  String ucollname = 'last_name';
  String ucolusername = 'username';
  String ucolpass = 'password';
  String ucolphoneno = 'phone_no';

  //VENUE COLUMNS
  String vtablename = "venue";
  String vid = "venue_id";
  String vname = "venue_name";
  String vpricelb = "price_lb";
  String vpriceub = "price_ub";
  String varea = "area";
  String vcontact = "contact_no";
  String vtype = "type";
  String voffhrs = "office_hrs";
  String vaddress = "address";
  String vcapacity = "capacity";
  String vrating = "rating";
  String vdescription = "description";
  String vfkey = "owner_id";

  //RENT A CAR COLUMNS
  String rtablename = "rent_a_car" ;
  String rid = "service_id"	;
  String rname = "service_name"	;
  String rcontact = "phone_no"	;
  String rarea = "area";
  String raddress = "address";
  String roffhrs = "office_hrs";
  String rrating = "rating";
  String rdescription = "description";
  String rfkey = "owner_id";

  //CAR COLUMNS
  String ctablename = "car"  ;
  String cid = "car_id"		;
  String cname = "car_name"		;
  String cmodel = "model"		;
  String cseats = "seats"	;
  String cmileage = "mileage"	;
  String ccolor = "color"		;
  String crentperday = "rent_per_day"	;
  String cfueltype = "fuel_type"	;
  String ctransmission = "transmission"	;
  String cfkey = "service_id"	;

  //CATERING COLUMNS
  String cat_tablename = "catering" 	 ;
  String cat_id = 	"caterer_id"		;
  String cat_name = "caterer_name"		;
  String cat_contact = "phone_no"		;
  String cat_area = "area"	;
  String cat_address = "address"	;
  String cat_price = "price"	;
  String cat_description = "description"	;
  String cat_rating = "rating" ;
  String cat_fkey = "owner_id"	;

  //PHOTOGRAPHY COLUMNS
  String p_tablename = "photography"  	 ;
  String p_id = 	"service_id"			;
  String p_name = "service_name"			;
  String p_contact = "phone_no"			;
  String p_price = "price"		;
  String p_rating = "rating"	 ;
  String p_description = "description"		;
  String p_fkey = "owner_id"		;

  //REVIEWS COLUMNS
  String rev_tablename = "reviews"   	 ;
  String rev_content = "content"				;
  String rev_fkey = "service_id"			;
  String rev_fkey1 = "user_id"				;

  //FAVORITES COLUMNS
  String fav_tablename = "favorites"    	 ;
  String fav_fkey = "user_id"				;
  String fav_fkey1 = "service_id"					;

  //IMAGE COLUMN
  String img_table = "image";
  String id = 'id' ;
  String img = "image";
  String img_fkey = "service_id";
  String img_fkey1 = "owner_id";
  String img_fkey2 = "c_id";

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
    await db.execute(
      """CREATE TABLE $vtablename (
	       $vid	INTEGER NOT NULL,
	       $vname	TEXT NOT NULL CHECK(length("venue_name") < 21),
	       $vpricelb	INTEGER NOT NULL,
	       $vpriceub	INTEGER NOT NULL,
	       $varea	TEXT NOT NULL CHECK(length("area") < 30),
	       $vcontact	INTEGER NOT NULL CHECK(length("contact_no") = 11) UNIQUE,
	       $vtype	TEXT NOT NULL,
         $voffhrs	TEXT NOT NULL,
         $vaddress	TEXT NOT NULL CHECK(length("address") < 256) UNIQUE,
         $vcapacity	INTEGER NOT NULL CHECK("capacity" < 1000),
         $vrating	REAL,
         $vdescription	TEXT CHECK(length("description") < 500),
         $vfkey	INTEGER,
        PRIMARY KEY($vid AUTOINCREMENT),
        FOREIGN KEY($vfkey) REFERENCES $otablename ($ocolid) ON DELETE CASCADE
        );
        """
    );

    await db.execute(
        """CREATE TABLE $rtablename (
          $rid	INTEGER NOT NULL,
          $rname	TEXT NOT NULL CHECK(length(service_name) < 20),
          $rcontact	INTEGER NOT NULL CHECK(length(phone_no) = 11) UNIQUE,
          $rarea	TEXT NOT NULL CHECK(length(area) < 30),
          $raddress	TEXT NOT NULL CHECK(length(address)<256) UNIQUE,
          $roffhrs TEXT NOT NULL,
          $rrating	REAL,
          $rdescription	TEXT CHECK(length(description) < 500),
          $rfkey	INTEGER,
          FOREIGN KEY($rfkey) 
            REFERENCES $otablename ($ocolid) ON DELETE CASCADE,
          PRIMARY KEY($rid AUTOINCREMENT)
          );
          """
    );

    await db.execute(
        """CREATE TABLE $ctablename (
          $cid	INTEGER NOT NULL,
          $cname	TEXT NOT NULL CHECK(length("car_name") < 20),
          $cmodel	TEXT NOT NULL CHECK(length("model") = 4),
          $cseats	INTEGER NOT NULL,
          $cmileage	REAL NOT NULL,
          $ccolor	TEXT NOT NULL,
          $crentperday	INTEGER NOT NULL,
          $cfueltype	TEXT NOT NULL,
          $ctransmission	TEXT NOT NULL,
          $cfkey	INTEGER NOT NULL,
          FOREIGN KEY($cfkey) REFERENCES $rtablename ($rid) ON DELETE CASCADE,
          PRIMARY KEY($cid AUTOINCREMENT)
          );
          """
    );

    await db.execute(
        """CREATE TABLE $cat_tablename (
          $cat_id	INTEGER NOT NULL,
          $cat_name	TEXT NOT NULL CHECK(length(caterer_name) < 20),
          $cat_contact	INTEGER NOT NULL CHECK(length(phone_no) = 11) UNIQUE,
          $cat_area	TEXT NOT NULL CHECK(length(area) <30),
          $cat_address	TEXT NOT NULL CHECK(length(address) < 256) UNIQUE,
          $cat_price	INTEGER NOT NULL,
          $cat_description	TEXT CHECK(length(description) < 500),
          $cat_rating REAL,
          $cat_fkey	INTEGER,
          PRIMARY KEY($cat_id AUTOINCREMENT),
          FOREIGN KEY($cat_fkey) REFERENCES $otablename ($ocolid) ON DELETE CASCADE
          );
          """
    );

    await db.execute(
        """CREATE TABLE $p_tablename (
          $p_id	INTEGER NOT NULL,
          $p_name	TEXT NOT NULL CHECK(length(service_name) < 20),
          $p_contact	INTEGER NOT NULL CHECK(length(phone_no) = 11) UNIQUE,
          $p_price	INTEGER NOT NULL,
          $p_rating	REAL,
          $p_description	TEXT NOT NULL CHECK(length(description) < 256),
          $p_fkey	INTEGER,
          FOREIGN KEY($p_fkey) REFERENCES $otablename($ocolid) ON DELETE CASCADE,
          PRIMARY KEY($p_id AUTOINCREMENT)
          )
          """
    );

    await db.execute(
        """CREATE TABLE $rev_tablename (
          $rev_content	TEXT NOT NULL CHECK(length(content) < 300),
          $rev_fkey	INTEGER,
          $rev_fkey1	INTEGER,
          FOREIGN KEY($rev_fkey) REFERENCES $vtablename ($vid) ON DELETE CASCADE,
          FOREIGN KEY($rev_fkey) REFERENCES $rtablename ($rid) ON DELETE CASCADE,
          FOREIGN KEY($rev_fkey) REFERENCES $p_tablename ($p_id) ON DELETE CASCADE,
          FOREIGN KEY($rev_fkey) REFERENCES $cat_tablename ($cat_id) ON DELETE CASCADE,
          FOREIGN KEY($rev_fkey1) REFERENCES $utablename($ucolid) ON DELETE CASCADE
          );
          """
    );

    await db.execute(
        """CREATE TABLE $fav_tablename (
          $fav_fkey	INTEGER,
          $fav_fkey1	INTEGER,
          FOREIGN KEY($fav_fkey) REFERENCES $utablename($ucolid) ON DELETE CASCADE,
          FOREIGN KEY($fav_fkey1) REFERENCES $vtablename ($vid) ON DELETE CASCADE,
          FOREIGN KEY($fav_fkey1) REFERENCES $rtablename ($rid) ON DELETE CASCADE,
          FOREIGN KEY($fav_fkey1) REFERENCES $p_tablename ($p_id) ON DELETE CASCADE,
          FOREIGN KEY($fav_fkey1) REFERENCES  $cat_tablename ($cat_id) ON DELETE CASCADE
          );
          """
    );

    await db.execute(
        """CREATE TABLE $img_table (
          $id INTEGER,
          $img	BLOB NOT NULL,
          $img_fkey INTEGER NOT NULL,
          $img_fkey1	INTEGER NOT NULL,
          $img_fkey2		INTEGER,
          FOREIGN KEY($img_fkey) REFERENCES $vtablename ($vid) ON DELETE CASCADE,
          FOREIGN KEY($img_fkey) REFERENCES $rtablename ($rid) ON DELETE CASCADE,
          FOREIGN KEY($img_fkey) REFERENCES $p_tablename ($p_id) ON DELETE CASCADE,
          FOREIGN KEY($img_fkey) REFERENCES  $cat_tablename ($cat_id) ON DELETE CASCADE,
          FOREIGN KEY($img_fkey1) REFERENCES $otablename($ocolid) ON DELETE CASCADE,
          FOREIGN KEY($img_fkey2) REFERENCES  $ctablename ($cid) ON DELETE CASCADE
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
        var result = await db.update(otablename, owner.toMap(), where: '$ocolid = ?', whereArgs: [owner.owner_id]);
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

      Future<int> checkOwnerUsername (String str) async
      {
        Database db = await this.database;
        List<Map<String, dynamic>> x = await db.rawQuery('SELECT * FROM $otablename WHERE $ocolusername = "$str"');
        int result;
        if (x.length > 0)
        {
          //Username found in databse, Hence restrict
          result = 0;
        }
        else
        {
          result = 1;
        }

        return result;
      }

      Future<int> checkOwnerNic (int tocheck) async
      {
        Database db = await this.database;
        List<Map<String, dynamic>> x = await db.rawQuery('SELECT * FROM $otablename WHERE $ocolnicno = $tocheck');
        int result;
        if (x.length > 0)
        {
          //Username found in databse, Hence restrict
          result = 0;
        }
        else
        {
          result = 1;
        }

        return result;
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
      var result = await db.update(utablename, user.toMap(), where: '$ucolid = ?', whereArgs: [user.user_id]);
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

  Future<int> checkUserUsername (String str) async
  {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT * FROM $utablename WHERE $ucolusername = "$str"');
    int result;
    if (x.length > 0)
    {
      //Username found in databse, Hence restrict
      result = 0;
    }
    else
    {
      result = 1;
    }

    return result;
  }

  Future<int> checkUserPhoneNo (int phno) async
  {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT * FROM $utablename WHERE $ucolphoneno = "$phno"');
    int result;
    if (x.length > 0)
    {
      //Username found in databse, Hence restrict
      result = 0;
    }
    else
    {
      result = 1;
    }

    return result;
  }

  //IMAGE CRUD OPERATIONS
    Future<Photo> save(Photo employee) async
    {
    var dbClient = await this.database;
    employee.id = await dbClient.insert(img_table , employee.toMap());
    return employee;
    }

    Future<List<Photo>> getPhotos() async
    {
    var dbClient = await this.database;
    List<Map> maps = await dbClient.rawQuery('SELECT * FROM $img_table');
    List<Photo> employees = [];
    if (maps.length > 0)
    {
      for (int i = 0; i < maps.length; i++)
      {
        employees.add(Photo.fromMap(maps[i]));
      }
    }
    return employees;
  }

  //VENUE CRUD OPERATIONS
  //GET OPERATIONS
  Future<List<Map<String, dynamic>>> getVenuesMapList(int ownerid) async
  {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $vtablename WHERE $vfkey = $ownerid');
    return result;
  }

  Future<Venue> getVenuesMapList1(int ownerid, int cntctno) async
  {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $vtablename WHERE $vfkey = $ownerid AND $vcontact = $cntctno');
    Venue venue = Venue.fromMapObject(result[0]);
    return venue;
  }

  //INSERT OPERATIONS
  Future<int> insertVenue (Venue venue) async
  {
    Database db = await this.database;
    var result = await db.insert(vtablename, venue.toMap());
    return result;
  }

  //UPDATE OPERATIONS
  Future<int> updateVenue (Venue venue) async
  {
    Database db = await this.database;
    var result = await db.update(vtablename, venue.toMap(), where: '$vid = ?', whereArgs: [venue.venue_id]);
    return result;
  }
  //DELETE OPERATIONS
  Future<int> deleteVenue (int id) async
  {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $vtablename WHERE $vid = $id');
    return result;
  }
  //GET NUMBER OF ROWS
  Future<int> getVenueCount (int ownerid) async
  {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT(*) FROM $vtablename where $vfkey = $ownerid');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //VENUE RETRIEVE OPERATIONS
  Future<List<Venue>> getVenueList (int ownerid) async
  {
    var venueMapList = await getVenuesMapList(ownerid);
    int count = venueMapList.length;

    List<Venue> venueList = List<Venue>();

    for(int i=0; i<count; i++)
    {
      venueList.add(Venue.fromMapObject(venueMapList[i]));
    }

    return venueList;
  }

  //RENT A CAR CRUD OPERATIONS
  //GET OPERATIONS
  Future<List<Map<String, dynamic>>> getrRentServiceMapList(int ownerid) async
  {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $rtablename WHERE $rfkey = $ownerid');
    return result;
  }

  //INSERT OPERATIONS
  Future<int> insertRentService (rent_a_Car r1) async
  {
    Database db = await this.database;
    var result = await db.insert(rtablename, r1.toMap());
    return result;
  }

  //UPDATE OPERATIONS
  Future<int> updateRentService (rent_a_Car r) async
  {
    Database db = await this.database;
    var result = await db.update(rtablename, r.toMap(), where: '$rid = ?', whereArgs: [r.service_id]);
    return result;
  }

  //DELETE OPERATIONS
  Future<int> deleteRentService (int id) async
  {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $rtablename WHERE $rid = $id');
    return result;
  }
  //GET NUMBER OF ROWS
  Future<int> getRentServiceCount (int ownerid) async
  {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT(*) FROM $rtablename where $rfkey = $ownerid');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //VENUE RETRIEVE OPERATIONS
  Future<List<rent_a_Car>> getRentServiceList (int ownerid) async
  {
    var RentServiceMapList = await getrRentServiceMapList(ownerid);
    int count = RentServiceMapList.length;

    List<rent_a_Car> rentServiceList = List<rent_a_Car>();

    for(int i=0; i<count; i++)
    {
      rentServiceList.add(rent_a_Car.fromMapObject(RentServiceMapList[i]));
    }

    return rentServiceList;
  }

}
