import 'package:flutter/material.dart';
import '../widgets/drawer_item.dart';

class FiltersScreen extends StatefulWidget {
  static const routename = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _vegtarian = false;
  bool _vegan = false;
  bool _lactosefree = false;
  Widget buildlisttile(String title, String description, bool currentvalue,
      Function updatevalue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentvalue,
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('filter'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Addjust your meal selection ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildlisttile(
                  'Gluten_ gree',
                  'only include Glutten_free meals',
                  _glutenfree,
                  (newval) {
                    setState(() {
                      _glutenfree = newval;
                    });
                  },
                ),
                buildlisttile('Lactose_free', 'only include_lactose free', _lactosefree, (newval)
                {
                  setState(() {
                    _lactosefree=newval;
                  });

                }),
                buildlisttile('vegaterian', 'only include vegaterian meals', _vegtarian, 
                (
                  newval

                )
                {
                  setState(() {
                    _vegtarian=newval;
                    
                  });

                })

                
              ],
              
            ),
          )
        ],
      ),
    );
  }
}
/*SwitchListTile(
                  title: Text('Gluten_ gree'),
                  subtitle: Text('only include Glutten_free meals '),
                  value: _glutenfree,
                  onChanged: (newvalue) {
                    setState(() {
                      _glutenfree = newvalue;
                    });
                    _glutenfree = newvalue;
                  },
                ),*/
