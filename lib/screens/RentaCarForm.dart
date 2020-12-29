import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RentaCarForm extends StatefulWidget {
  @override
  RentaCarFormState createState() {
    return RentaCarFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class RentaCarFormState extends State<RentaCarForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var maskFormatter = new MaskTextInputFormatter(mask: '##:##-##:##', filter: { "#": RegExp(r'[0-9]') });
  TextEditingController rentnameController = TextEditingController();
  TextEditingController rentoffhrsController = TextEditingController();
  TextEditingController rentareaController = TextEditingController();
  TextEditingController rentcontactController = TextEditingController();
  TextEditingController rentaddressController = TextEditingController();
  TextEditingController rentdescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    return  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Rent a Car Form"),
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
                    controller: rentnameController,
                    decoration: InputDecoration(
                        labelText: 'Service Name *',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter a Service Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text){
                      debugPrint('$rentnameController');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required ';
                      }
                      if(value=="Rent"){
                        return 'This Service already exist';
                      }
                      if(value.length>20){
                        return 'Servide name should be less than 20';
                      }
                      return null;
                    },


                  )),
              //


              Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:10.0),

                  child: TextFormField(
                    inputFormatters: [maskFormatter],
                    style: TextStyle(color: Colors.white),
                    controller: rentoffhrsController,
                    decoration: InputDecoration(
                        labelText: 'Office Hours *',
                        hintText: 'In Hours:Min-Hours:Min',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )

                    ),
                    onChanged: (text){
                      debugPrint('$rentoffhrsController');
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
                    controller: rentareaController,
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
                      debugPrint('$rentareaController');
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
                    controller: rentcontactController,
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
                      debugPrint('$rentcontactController');
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
                    controller: rentaddressController,
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
                      debugPrint('$rentaddressController');
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
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                    minLines: 1,
                    style: TextStyle(color: Colors.white),
                    controller: rentdescriptionController,
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
                      debugPrint('$rentdescriptionController');
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(backgroundColor: Colors.deepPurple),
                      child: Text("Add Cars", style: TextStyle(fontSize: 20.0,color: Colors.white)),

                      onPressed: () {
                      

                      },
                    )]),
          SizedBox(
            height: 200.0,
            child: ListView(

            ),
          ),
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

                        onPressed: ()
                        {
                          if(_formKey.currentState.validate())
                          {
                            //DB function here
                          }
                        },


                      )))




            ],
          ),

        ));
  }
}