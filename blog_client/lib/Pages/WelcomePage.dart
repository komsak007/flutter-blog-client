// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:blog_client/Pages/SignInPage.dart';
import 'package:blog_client/Pages/SignUpPage.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<Offset> animation1;
  late AnimationController _controller2;
  late Animation<Offset> animation2;

  bool _isLogin = false;
  // final facebookLogin = FacebookLogin();
  late Map data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Animation 1
    _controller1 = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

    animation1 = Tween<Offset>(begin: Offset(0.0, 6.0), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller1, curve: Curves.easeOut));

    //Animation 2
    _controller2 = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);

    animation2 = Tween<Offset>(begin: Offset(0.0, 6.0), end: Offset(0.0, 0.0))
        .animate(
            CurvedAnimation(parent: _controller2, curve: Curves.elasticInOut));

    _controller1.forward();
    _controller2.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.green.shade200],
                begin: FractionalOffset(0.0, 1.0),
                end: FractionalOffset(0.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.repeated)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: Column(
            children: [
              SlideTransition(
                position: animation1,
                child: Text(
                  "Komsak007",
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              SlideTransition(
                position: animation1,
                child: Text(
                  "Great stories for greate people",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              boxContainer("assets/google.png", "Sign up with Google", null),
              SizedBox(
                height: 20,
              ),
              boxContainer(
                  "assets/facebook1.png", "Sign up with Facebook", onFBLogin),
              SizedBox(
                height: 20,
              ),
              boxContainer(
                  "assets/email2.png", "Sign up with E-mail", onEmailClick),
              SizedBox(
                height: 20,
              ),
              SlideTransition(
                position: animation2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInPage()));
                      },
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onFBLogin() async {
    // final result = await facebookLogin.logIn(['email']);
    // switch (result.status) {
    //   case FacebookLoginStatus.loggedIn:
    //     final token = result.accessToken;
    //     final response = await http.get(Uri.parse(
    //         "http://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}"));

    //     final data1 = json.decode(response.body);
    //     print(data1);

    //     setState(() {
    //       _isLogin = true;
    //       data = data1;
    //     });
    //     break;

    //   case FacebookLoginStatus.cancelledByUser:
    //     setState(() {
    //       _isLogin = false;
    //     });
    //     break;

    //   case FacebookLoginStatus.error:
    //     setState(() {
    //       _isLogin = false;
    //     });
    //     break;
    // }
  }

  onEmailClick() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  Widget boxContainer(String path, String text, onClick) {
    return SlideTransition(
      position: animation2,
      child: InkWell(
        onTap: onClick,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width - 120,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Image.asset(
                    path,
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
