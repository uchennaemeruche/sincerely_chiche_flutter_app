import 'package:flutter/material.dart';
import 'dart:math';

class CustomShape extends StatelessWidget {

  final double height;
  final double width;
  final Color one, two;

  CustomShape({this.one, this.two, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: myClipper(),
      child: Container(

        height: height,
        width: width,

        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft,end:Alignment.bottomRight, colors: [one,two])
        )
      ),
    );
  }

}

class myClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = new  Path();

    path.lineTo(0, size.height-20);

    path.quadraticBezierTo(size.width * 0.25, size.height - 70, size.width * 0.5, size.height - 20);


    path.quadraticBezierTo((size.width/2) + (size.width/4), size.height+20, size.width, size.height-40);


    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }


}
