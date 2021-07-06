import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListtile(String title, IconData icon, Function selecthandler) {
    return ListTile(
      onTap: selecthandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListtile(
            'Meal',
            Icons.restaurant,
            () 
            {
               Navigator.of(context).pushReplacementNamed(TabsScreen.routename );

            },
          ),
          buildListtile(
            'Filters',
            Icons.settings,
            ()
            {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routename );
            },
          ),
        ],
      ),
    );
  }
}
