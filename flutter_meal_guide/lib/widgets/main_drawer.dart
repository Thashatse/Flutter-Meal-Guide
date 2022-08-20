import 'package:flutter/material.dart';

import '../Screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function()? tapHandeler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: tapHandeler,
    );
  }

  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).primaryColor,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).accentColor),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile(
          'Meals',
          Icons.restaurant,
          () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildListTile(
          'Fillters',
          Icons.filter_list,
          () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
        ),
      ]),
    );
  }
}
