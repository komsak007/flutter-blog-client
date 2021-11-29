// ignore_for_file: file_names, prefer_const_constructors

import 'dart:io';

import 'package:blog_client/Model/addBlogModels.dart';
import 'package:blog_client/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BlogCard extends StatelessWidget {
  const BlogCard(
      {Key? key, required this.addBlogModel, required this.networkHandler})
      : super(key: key);

  final AddBlogModel addBlogModel;
  final NetworkHandler networkHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: networkHandler.getImage(addBlogModel.id),
                      fit: BoxFit.fitWidth)),
            ),
            Positioned(
                bottom: 2,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    addBlogModel.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
