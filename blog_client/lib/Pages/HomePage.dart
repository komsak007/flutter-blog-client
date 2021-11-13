// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:blog_client/Screen/HomeScreen.dart';
import 'package:blog_client/Screen/ProfileScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentState = 0;
  List<Widget> widgets = [HomeScreen(), ProfileScreen()];
  List<String> titleString = ["Home Page", "Profile Page"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("@Username")
              ],
            )),
            ListTile(
              title: Text("all post"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(titleString[currentState]),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {},
        child: Text(
          "+",
          style: TextStyle(fontSize: 35),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentState = 0;
                    });
                  },
                  icon: Icon(Icons.home),
                  iconSize: 40,
                  color: currentState == 0 ? Colors.white : Colors.white54,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentState = 1;
                    });
                  },
                  icon: Icon(Icons.person),
                  iconSize: 40,
                  color: currentState == 1 ? Colors.white : Colors.white54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: widgets[currentState],
    );
  }
}
