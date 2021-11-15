// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfile extends StatefulWidget {
  CreateProfile({Key? key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  XFile? _imageFile;
  // late File pickedFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            imageProfile(),
            SizedBox(
              height: 20,
            ),
            nameTextField(),
            SizedBox(
              height: 20,
            ),
            professionTextField(),
            SizedBox(
              height: 20,
            ),
            dobField(),
            SizedBox(
              height: 20,
            ),
            titleTextField(),
            SizedBox(
              height: 20,
            ),
            aboutTextField(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile == null
                ? AssetImage("assets/profile.jpeg")
                : FileImage(File(_imageFile!.path)) as ImageProvider,
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                icon: Icon(Icons.camera),
                label: Text("Camera"),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                label: Text("Gallary"),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 2)),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          labelText: "Name",
          helperText: "Name can't be empty",
          hintText: "Komsak007"),
    );
  }

  Widget professionTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 2)),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          labelText: "Profession",
          helperText: "Profession can't be empty",
          hintText: "Full Stack Developer"),
    );
  }

  Widget dobField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 2)),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          labelText: "Date of Birth",
          helperText: "Provide dob on dd/mm/yyyy",
          hintText: "01/01/2020"),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 2)),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          labelText: "Title",
          helperText: "It can't be empty",
          hintText: "Flutter Developer"),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2)),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "About",
        helperText: "Write about yourself",
        hintText: "I am Dev Stack",
      ),
    );
  }
}
