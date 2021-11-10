// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blog_client/NetworkHandler.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool vis = true;
  final _globalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.green.shade200],
              begin: FractionalOffset(0.0, 1.0),
              end: FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.repeated)),
      child: Form(
        key: _globalkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign up with email",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
            SizedBox(
              height: 20,
            ),
            usernameTextField(),
            emailTextField(),
            passwordTextField(),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_globalkey.currentState!.validate()) {
                  Map<String, String> data = {
                    "username": _usernameController.text,
                    "email": _emailController.text,
                    "password": _passwordController.text,
                  };
                  // print(data);
                  networkHandler.post("/user/register", data);
                }
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff00A86B)),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget usernameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text("Username"),
          TextFormField(
            controller: _usernameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Username can't be empty";
              }

              return null;
            },
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ))),
          )
        ],
      ),
    );
  }

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text("Email"),
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Email can't be empty";
              }

              if (!value.contains("@")) {
                return "Email is invalid";
              }

              return null;
            },
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ))),
          )
        ],
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text("Password"),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Password can't be empty";
              }

              if (value.length < 8) {
                return "Password length must have >=8";
              }

              return null;
            },
            obscureText: vis,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      vis = !vis;
                    });
                  },
                ),
                helperText: "Password length should have >=8",
                helperStyle: TextStyle(
                  fontSize: 16,
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ))),
          )
        ],
      ),
    );
  }
}
