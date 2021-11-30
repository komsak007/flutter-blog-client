// ignore_for_file: file_names

import 'package:blog_client/Blog/Blog.dart';
import 'package:blog_client/CustomWidget/BlogCard.dart';
import 'package:blog_client/Model/SuperModels.dart';
import 'package:blog_client/Model/addBlogModels.dart';
import 'package:blog_client/NetworkHandler.dart';
import 'package:flutter/material.dart';

class Blogs extends StatefulWidget {
  Blogs({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  NetworkHandler networkHandler = NetworkHandler();
  SuperModels superModels = SuperModels(data: []);
  List<AddBlogModel> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get(widget.url);
    superModels = SuperModels.fromJson(response);
    setState(() {
      data = superModels.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return data.length > 0
        ? Column(
            children: data
                .map((item) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Blog(
                                        addBlogModel: item,
                                        networkHandler: networkHandler)));
                          },
                          child: BlogCard(
                            addBlogModel: item,
                            networkHandler: networkHandler,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ))
                .toList(),
          )
        : Center(
            child: Text("We don't have any Blog Yet."),
          );
  }
}
