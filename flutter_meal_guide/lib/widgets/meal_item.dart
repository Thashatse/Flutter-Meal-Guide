import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../Screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.imageURL,
      required this.duration,
      required this.complexity,
      required this.affordability})
      : super(key: key);

  final String id;
  final String title;
  final String imageURL;
  final int duration;
  final String complexity;
  final String affordability;

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => selectMeal(context)),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Stack(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageURL,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              child: Container(
                width: 300,
                color: Colors.black54,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            )
          ]),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$complexity'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$affordability'),
                    ],
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
