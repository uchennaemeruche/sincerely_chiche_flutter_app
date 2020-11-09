import 'package:flutter/material.dart';

class GuessYouLike extends StatefulWidget {
  @override
  _GuessYouLikeState createState() => _GuessYouLikeState();
}

class _GuessYouLikeState extends State<GuessYouLike> {
  List foodItems = [
    [
      "Chicken pepper sauce",
      "assets/images/food1.jpg",
      "a really peppery chicken glazed in suya saucee",
      154,
      67,
      23,
      4
    ],
    [
      "Hamburger",
      "assets/images/food2.jpg",
      "Juicy krabby paddy",
      154,
      30,
      15,
      3
    ],
    [
      "French Fries",
      "assets/images/food3.jpg",
      "Fully fried french fries made with love and deeply fried according to the desires of the desire of your heart",
      154,
      64,
      55,
      2
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        for (var i = 0; i < foodItems.length; i++)
          getFoodItem(
              name: foodItems[i][0],
              imgPath: foodItems[i][1],
              desc: foodItems[i][2],
              calInfo: foodItems[i][3],
              distance: foodItems[i][4],
              cookingTime: foodItems[i][5],
              rating: foodItems[i][6]),
      ],
    );
  }

  getFoodItem({name, imgPath, desc, calInfo, distance, cookingTime, rating}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.deepOrange,
                    width: 2,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width - 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.redAccent.withOpacity(0.1),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0)
                            ]),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (var i = 0; i < 5; i++)
                    Icon(
                      Icons.star,
                      color: (i < rating ? Colors.yellowAccent : Colors.grey),
                    ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "(${rating})",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "About dishes",
                style: TextStyle(fontSize: 15, color: Colors.brown[600]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 125,
                  child: Text(
                    desc,
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  getIconWithText(Icons.fastfood, calInfo.toString()),
                  getIconWithText(Icons.location_on, distance.toString()),
                  getIconWithText(Icons.timer, cookingTime.toString())
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 1.0,
                  width: MediaQuery.of(context).size.width - 125,
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  getIconWithText(icon, text) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.grey,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          width: 25,
        )
      ],
    );
  }
}
