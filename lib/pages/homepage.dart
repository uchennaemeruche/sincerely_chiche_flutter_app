import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/guess_you_like.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _page = 0;
  GlobalKey navKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            key: navKey,
            color: Colors.deepOrange,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            index: 2,
            height: 50,
            animationCurve: Curves.bounceInOut,
            animationDuration: Duration(milliseconds: 300),
            items: [
              Icon(
                Icons.settings,
                size: 24,
                color: _page == 0 ? Colors.deepOrange : Colors.white,
              ),
              Icon(
                Icons.ac_unit,
                size: 24,
                color: _page == 1 ? Colors.deepOrange : Colors.white,
              ),
              Icon(
                Icons.camera_alt,
                size: 24,
                color: _page == 2 ? Colors.deepOrange : Colors.white,
              ),
              Icon(
                Icons.account_balance_wallet,
                size: 24,
                color: _page == 3 ? Colors.deepOrange : Colors.white,
              ),
              Icon(
                Icons.add_call,
                size: 24,
                color: _page == 4 ? Colors.deepOrange : Colors.white,
              )
            ]),
        body: ListView(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: 250.0,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 7.0,
                      blurRadius: 7.0)
                ]),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.settings,
                      color: Colors.black.withOpacity(0.7)),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 50,
                left: 15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 125.0,
                      width: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(62.5),
                          image: DecorationImage(
                              image: AssetImage("assets/images/profile.jpg"),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chinyere Peace",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.green,
                            ),
                            Text(
                              "No3 sdfsf off the southwest\ncorrdor of the \nheights and foofered\nto gothere",
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 16.0),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 200),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.deepOrange,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorWeight: 7.0,
                  labelColor: Colors.deepOrange,
                  unselectedLabelColor: Colors.grey,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        "Guess you like",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Coupon",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Tab(
                        child: Text(
                      "News",
                      style: TextStyle(fontSize: 20),
                    ))
                  ],
                ),
              )
            ]),
            Container(
              height: MediaQuery.of(context).size.height - 275,
              color: Colors.white,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  GuessYouLike(),
                  GuessYouLike(),
                  GuessYouLike(),
                ],
              ),
            )
          ],
        ));
  }
}
