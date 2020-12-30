import 'dart:io';
import 'package:get/get.dart';
import 'package:shadihal/Models/Owner.dart';
import 'package:flutter/material.dart';
import 'package:shadihal/Models/Photo.dart';
import 'package:shadihal/Models/Venue.dart';
import 'package:shadihal/Utils/imgutility.dart';
import 'package:shadihal/Utils/dbhelper.dart';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shadihal/Utils/dbhelper.dart';
import 'AddImage.dart';


class VenueForm extends StatefulWidget
{
  final Owner owner;

  VenueForm(this.owner);

  @override
  VenueFormState createState()
  {
    return VenueFormState(this.owner);
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class VenueFormState extends State<VenueForm>
{
  Owner owner;
  dbHelper sdbHelper = dbHelper();

  VenueFormState(this.owner);


  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var maskFormatter = new MaskTextInputFormatter(mask: '##:##-##:##', filter: { "#": RegExp(r'[0-9]') });
  String dropdownValue = 'Banquet';
  TextEditingController venuenameController = TextEditingController();
  TextEditingController venueminpriceController = TextEditingController();
  TextEditingController venuemaxpriceController = TextEditingController();
  TextEditingController venueoffhrsController = TextEditingController();
  TextEditingController venueareaController = TextEditingController();
  TextEditingController venuecontactController = TextEditingController();
  TextEditingController venuetypeController = TextEditingController();
  TextEditingController venueaddressController = TextEditingController();
  TextEditingController venuecapacityController = TextEditingController();
  TextEditingController venueratingController = TextEditingController();
  TextEditingController venuedescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    return  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Venue Form"),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              //username
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: venuenameController,
                    decoration: InputDecoration(
                        labelText: 'Venue Name *',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter a Venue Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text){
                      debugPrint('$venuenameController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      if(value=="Venue"){
                        return 'This venue already exist';
                      }
                      if(value.length>20){
                        return 'Venue name should be less than 20';
                      }
                      return null;
                    },


                  )),
              //VENUE MIN PRICE
              TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                controller: venueminpriceController,
                decoration: InputDecoration(
                    labelText: 'Price(Min) *',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter Minimum Price',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )

                ),
                onChanged: (text){
                  //debugPrint('$text');
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This Field is Required ';
                  }
                  return null;
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: venuemaxpriceController,
                    decoration: InputDecoration(
                        labelText: 'Price(Max) *',
                        hintText: 'Enter Maximum Price',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text){
                      debugPrint('$venuemaxpriceController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      return null;
                    },


                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    inputFormatters: [maskFormatter],
                    style: TextStyle(color: Colors.white),
                    controller: venueoffhrsController,
                    decoration: InputDecoration(
                        labelText: 'Office Hours *',
                        hintText: 'In Hour:Min - Hour:Min',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text){
                      debugPrint('$venueoffhrsController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      return null;
                    },


                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: venueareaController,
                    decoration: InputDecoration(
                        labelText: 'Area*',
                        hintText: 'Enter Area',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text){
                      debugPrint('$venueareaController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      if(value.length>20){
                        return 'Area name length should be less than 20';
                      }
                      return null;
                    },


                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    controller: venuecontactController,
                    decoration: InputDecoration(
                        labelText: 'Contact No*',
                        hintText: 'Enter Your 11-Digit Phone No',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text){
                      debugPrint('$venuecontactController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      if(value.length!=11){
                        return 'Phone No length should be 11';

                      }
                      return null;
                    },


                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(

                    style: TextStyle(color: Colors.white),
                    controller: venueaddressController,
                    decoration: InputDecoration(
                        labelText: 'Address *',
                        hintText: 'Enter full Address ',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text)
                    {
                      debugPrint('$venueaddressController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      if(value.length>256){
                        return 'This Field is too large';
                      }
                      return null;
                    },


                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    controller: venuecapacityController,
                    decoration: InputDecoration(
                        labelText: 'Capacity *',
                        hintText: 'Enter Capacity ',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text)
                    {
                      debugPrint('$venueaddressController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      if(int.parse(value) > 1000){
                        return 'Capacity should be less than 1000';
                      }
                      return null;
                    },


                  )),
              Padding(
                  padding: EdgeInsets.only(top:20.0,left:20,right: 180),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget>[
                        Expanded(
                          child: Text('Type *', textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0,color: Colors.white)),),
                        Expanded(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                                venuetypeController.text= dropdownValue;
                                debugPrint('$venuetypeController');
                              },
                              items: <String>['Banquet', 'Hall', 'Lawn']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ))])),
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 20,
                    style: TextStyle(color: Colors.white),
                    controller: venuedescriptionController,
                    decoration: InputDecoration(
                        labelText: 'Description *',
                        hintText: 'Enter Description ',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                    onChanged: (text)
                    {
                      debugPrint('$venuedescriptionController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      if(value.length>500){
                        return 'This Field is too large';
                      }
                      return null;
                    },


                  )),
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children:<Widget>[
              //       OutlinedButton(
              //         style: OutlinedButton.styleFrom(backgroundColor: Colors.deepPurple),
              //         child: Text("Add Images", style: TextStyle(fontSize: 20.0,color: Colors.white)),
              //
              //         onPressed: ()
              //         {
              //               pickImageFromGallery();
              //
              //         },
              //       )]),
              //     SizedBox(
              //         height: 800.0,
              //         child: GridView.count(
              //           crossAxisCount: 2,
              //           childAspectRatio: 1.0,
              //           mainAxisSpacing: 4.0,
              //           crossAxisSpacing: 4.0,
              //           children: images.map((photo) {
              //             return Utility.imageFromBase64String(photo.photo_name);
              //           }).toList(),
              //         ),
              //         ),

              Padding(
                  padding: EdgeInsets.only(top:20.0,left: 120.00,right: 120.00),
                  child: Builder(
                      builder:(context)=> RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,

                        child: Text(
                          'Submit',
                          textScaleFactor: 1.5,
                        ),

                        onPressed: () async
                        {
                          if(_formKey.currentState.validate())
                          {
                            Venue v1 = Venue(venuenameController.text, int.parse(venueminpriceController.text), int.parse(venuemaxpriceController.text), venueareaController.text , int.parse(venuecontactController.text), venuetypeController.text, venueoffhrsController.text, venueaddressController.text, int.parse(venuecapacityController.text), venuedescriptionController.text, this.owner.owner_id);
                            _insertvenue(v1);
                            int x = await _getId(v1.owner_id, v1.contact_no);
                            Get.to(AddImage(this.owner, x));

                          }
                        },


                      )))




            ],
          ),

        ));
  }

  void _insertvenue (Venue ven) async
  {
    await sdbHelper.insertVenue(ven);
  }

  Future<int> _getId (int ownerid, int cntctno) async
  {
    Venue v = await sdbHelper.getVenuesMapList1(ownerid, cntctno);
    return v.venue_id;
  }
}