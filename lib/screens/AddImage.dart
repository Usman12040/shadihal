import 'package:flutter/material.dart';
import 'package:shadihal/Utils/dbhelper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shadihal/Models/Owner.dart';
import 'package:shadihal/Models/Photo.dart';
import 'package:shadihal/Utils/imgutility.dart';
class AddImage extends StatefulWidget
{
  final Owner owner;
  int ven_id;
  AddImage(this.owner,this.ven_id);

  @override
  AddImageState createState() {
    return AddImageState(this.owner,this.ven_id);
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AddImageState extends State<AddImage>
{
  int ven_id;
  Future<File> imageFile;
  Image image;
  dbHelper sdbHelper;
  List<Photo> images;
  Owner owner;
  AddImageState(this.owner,this.ven_id);
  @override
  void initState() {
  super.initState();
  images = [];
  sdbHelper = dbHelper();
  refreshImages();
  }

  refreshImages()
  {
    sdbHelper.getPhotos().then((imgs) {
      setState(() {
        images.clear();
        images.addAll(imgs);
      });
    });
  }

  pickImageFromGallery()
  {
    ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile)
    {
      String imgString = Utility.base64String( imgFile.readAsBytesSync() );
      Photo photo = Photo(imgString, ven_id, this.owner.owner_id);
      sdbHelper.save(photo);
      refreshImages();
    });
  }
  gridView() {
  return Padding(
  padding: EdgeInsets.all(5.0),
  child: GridView.count(
  crossAxisCount: 2,
  childAspectRatio: 1.0,
  mainAxisSpacing: 4.0,
  crossAxisSpacing: 4.0,
  children: images.map((photo) {
  return Utility.imageFromBase64String(photo.photo_name);
  }).toList(),
  ),
  );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
            title: Text("Add Image"),
            actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: ()
                {
                  pickImageFromGallery();
                },
            )
            ],
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: gridView(),
                )
              ],
            ),
        ),
      );
    }
  }