import 'package:flutter/material.dart';
import '../screens/catorgies_Screen.dart';
import '../screens/favourite_screen.dart';
import '../widgets/drawer_item.dart';
import '../Models/meals.dart';

class TabsScreen extends StatefulWidget {
  static const routename='/tabscreen';
  final List<Meal>favouremeals;
   TabsScreen(this.favouremeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String,Object>> _pages; 
  int _selectedpageindex = 0;
  @override
  void initState() {
 _pages= [
    {'page':CatorgiesScreen(),'title':'categeroies'},
    {'page':FavouriteScreen(widget.favouremeals),'title':'Your Favourite'},
  ];
    super.initState();
  }
  void _selectedpage(int index) {
    print(index);
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedpageindex]['title']),
      ),
      body: _pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar
      (
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedpageindex,
        type: BottomNavigationBarType.shifting,
          onTap: _selectedpage,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,

              icon: Icon(Icons.category),
              title: Text('Category'),
            ),
            BottomNavigationBarItem(
               backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favourits'),
            ),
          ]),
    );
  }
}
