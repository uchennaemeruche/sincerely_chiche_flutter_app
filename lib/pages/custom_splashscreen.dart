import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:page_transition/page_transition.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen>
    with TickerProviderStateMixin {
  AnimationController _slideFromUp,
      _scaleAnimationController,
      _widthAnimationController,
      _positionedAnimationController,
      _scaleAnimationController2,
      _rotateAnimationController;

  Animation<double> _slideFromUpAnimation,
      _scaleAnimation,
      _widthAnimation,
      _positionedAnimation,
      _scaleAnimation2,
      _rotateAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    super.initState();
    _slideFromUp =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _scaleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _scaleAnimationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _widthAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _positionedAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _rotateAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _slideFromUpAnimation =
        Tween<double>(begin: -5, end: 150).animate(_slideFromUp);
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleAnimationController)
          ..addStatusListener((status) => {
                if (status == AnimationStatus.completed)
                  {_widthAnimationController.forward()}
              });
    _scaleAnimation2 =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scaleAnimationController2)
          ..addStatusListener((status) {
            setState(() {
              hideIcon = true;
            });
            if (status == AnimationStatus.completed) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      curve: Curves.easeInOut,
                      child: LoginPage()));
            }
          });
    _widthAnimation =
        Tween<double>(begin: 80, end: 400).animate(_widthAnimationController)
          ..addStatusListener((status) => {
                if (status == AnimationStatus.completed)
                  _positionedAnimationController.forward()
              });
    _positionedAnimation = Tween<double>(begin: 0.0, end: 290)
        .animate(_positionedAnimationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              _scaleAnimationController2.forward();
          });

    _rotateAnimation = Tween<double>(begin: 0, end: 2 * pi)
        .animate(_rotateAnimationController);

    _slideFromUp.forward();
    _rotateAnimationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[600],
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              AnimatedBuilder(
                animation: _slideFromUp,
                builder: (context, child) => Positioned(
                  top: _slideFromUpAnimation.value,
                  child: AnimatedBuilder(
                    animation: _rotateAnimationController,
                    child: Image.asset(
                      "assets/images/rose.png",
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    builder: (context, child) {
                      return Transform.rotate(
                          angle: _rotateAnimation.value, child: child);
                    },
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _slideFromUp,
                builder: (context, child) => Positioned(
                  top: _slideFromUpAnimation.value + 120,
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _slideFromUp,
                builder: (context, child) => Positioned(
                  top: _slideFromUpAnimation.value + 190,
                  child: Text(
                    "We hope you have a good \ntime using our premium services...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _scaleAnimationController,
                      builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthAnimationController,
                              builder: (context, child) => Container(
                                padding: EdgeInsets.all(10),
                                width: _widthAnimation.value,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[300],
                                    borderRadius: BorderRadius.circular(50)),
                                child: InkWell(
                                  onTap: () {
                                    _scaleAnimationController.forward();
                                  },
                                  child: Stack(
                                    children: <Widget>[
                                      AnimatedBuilder(
                                        animation:
                                            _positionedAnimationController,
                                        builder: (context, child) => Positioned(
                                          left: _positionedAnimation.value,
                                          child: AnimatedBuilder(
                                            animation:
                                                _scaleAnimationController2,
                                            builder: (context, child) =>
                                                Transform.scale(
                                                    scale:
                                                        _scaleAnimation2.value,
                                                    child: Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors
                                                              .deepPurple[400]),
                                                      child: hideIcon
                                                          ? Container()
                                                          : Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              size: 32,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                    )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  replayAnimation(AnimationController animation) {
    animation.reset();
    animation.forward();
  }

  @override
  void dispose() {
    _slideFromUp.dispose();
    super.dispose();
  }
}
