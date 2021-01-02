import 'package:flutter/material.dart';

import '../Models/Owner.dart';
import '../Models/catering.dart';
import '../Utils/dbhelper.dart';
import 'dart:async';

class CateringForm extends StatefulWidget 
{
  final Owner owner;

  CateringForm(this.owner);
  @override
  CateringFormState createState() 
  {
    return CateringFormState(this.owner);
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CateringFormState extends State<CateringForm>
{
  Owner owner;
  dbHelper sdbHelper = dbHelper();
  
  CateringFormState(this.owner);

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  TextEditingController CaternameController = TextEditingController();
  TextEditingController CatercontactController = TextEditingController();
  TextEditingController CaterareaController = TextEditingController();
  TextEditingController CateraddressController = TextEditingController();
  TextEditingController CaterdescriptionController = TextEditingController();
  TextEditingController CaterpriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    return  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Catering Form"),
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
                    controller: CaternameController,
                    decoration: InputDecoration(
                        labelText: 'Catering Name *',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter your Catering Service Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text){
                      debugPrint('$CaternameController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      //if(value=="Catering"){
                        //return 'This venue already exist';
                      //}
                      if(value.length>20){
                        return 'Venue name should be less than 20';
                      }
                      return null;
                    },


                  )),
              //Contact No.
              TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                controller: CatercontactController,
                decoration: InputDecoration(
                    labelText: 'Contact No. *',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter your 11-Digit Phone No.',
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
                  if (value.length!=11) {
                    return 'Phone No. should be 11 Digits ';
                  }
                  return null;
                },
              ),
             //Catering Area
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: CaterareaController,
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
                      debugPrint('$CaterareaController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      if(value.length>30){
                        return 'Area name length should be less than 30';
                      }
                      return null;
                    },


                  )),
              //Catering Price
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: CaterpriceController,
                    decoration: InputDecoration(
                        labelText: 'Price per Head*',
                        hintText: 'Enter minimum price',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text){
                      debugPrint('$CaterpriceController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      if(value.length>30){
                        return 'Price length should be less than 30';
                      }
                      return null;
                    },


                  )),

              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(

                    style: TextStyle(color: Colors.white),
                    controller: CateraddressController,
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
                      debugPrint('$CateraddressController');
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

          //CATERING DESCRIPTION
              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 20,
                    style: TextStyle(color: Colors.white),
                    controller: CaterdescriptionController,
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
                      debugPrint('$CaterdescriptionController');
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
                            catering caterS = catering(CaternameController.text, int.parse(CatercontactController.text), CaterareaController.text , CateraddressController.text, int.parse(CaterpriceController.text), CaterdescriptionController.text, this.owner.owner_id);
                            _insertcatservice(caterS);
                            int x = await _getId(caterS.owner_id, caterS.price);

                          }
                        },


                      )))




            ],
          ),

        ));
  }

  void _insertcatservice (catering c1) async
  {
    await sdbHelper.insertCateringService(c1);
  }

  Future<int> _getId (int ownerid, int cntctno) async
  {
    catering ct = await sdbHelper.getCateringMapList1(ownerid, cntctno);
    return ct.caterer_id;
  }
}