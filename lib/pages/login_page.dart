import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/custom_shape.dart';
import 'package:flutter_app/utils/custom_toast.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  child: SlideInDown(
                      delay: Duration(milliseconds: 250),
                      duration: Duration(milliseconds: 300),
                      child: Transform(
                        transform: Matrix4Transform()
                            .flipHorizontally(origin: Offset(width / 2, 0.0))
                            .matrix4,
                        child: CustomShape(
                            one: Colors.deepPurple,
                            two: Colors.deepPurpleAccent,
                            height: 260,
                            width: MediaQuery.of(context).size.width),
                      )),
                ),
                Positioned(
                  child: SlideInDown(
                      delay: Duration(milliseconds: 350),
                      duration: Duration(milliseconds: 300),
                      child: CustomShape(
                          one: Colors.deepPurpleAccent,
                          two: Colors.deepPurple[300],
                          height: 260,
                          width: MediaQuery.of(context).size.width)),
                ),
                BounceInLeft(
                  delay: Duration(milliseconds: 550),
                  duration: Duration(milliseconds: 500),
                  child: Align(
                    alignment: Alignment.center,
                    heightFactor: 2.5,
                    child: Image.asset(
                      "assets/images/rose.png",
                      height: 100,
                      fit: BoxFit.cover,
                    ),
//                    child: Text(
//                      "Roses",
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 40,
//                          fontWeight: FontWeight.bold),
//                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SlideInDown(
              delay: Duration(milliseconds: 550),
              duration: Duration(milliseconds: 300),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SlideInDown(
              delay: Duration(milliseconds: 550),
              duration: Duration(milliseconds: 300),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.deepPurple[200],
                          spreadRadius: 2.0,
                          blurRadius: 2.0)
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        cursorColor: Colors.deepPurpleAccent,
                        decoration: InputDecoration(
                            hintText: "Username...", border: InputBorder.none),
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        obscureText: passwordVisible ? false : true,
                        cursorColor: Colors.deepPurpleAccent,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              child: Icon(
                                passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            hintText: "Password...",
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Forgotten password?"),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    showShortToast("helping you out with that...", context);
                  },
                  child: Text(
                    "Click here",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SlideInDown(
              delay: Duration(milliseconds: 550),
              duration: Duration(milliseconds: 300),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.deepPurpleAccent)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("home");
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    splashColor: Colors.deepPurpleAccent,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
