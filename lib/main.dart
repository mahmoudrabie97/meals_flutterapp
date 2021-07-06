import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/meals_details_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meals_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filter_screen.dart';
import './Models/meals.dart';

void main()
{

  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Meal> _favouritesScreen=[];

  void _togglefavourite (String mealId)
  {
    final existingindex=_favouritesScreen.indexWhere((meal) =>meal.id==mealId );
    if( existingindex>=0)
    {
      setState(() {
        _favouritesScreen.removeAt(existingindex);
        
      });


    }
    else
    {
      setState(() {
        _favouritesScreen.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
        
      });
    }



  }
  bool _isfavourite (String id)
  {
    return _favouritesScreen.any((meal) =>meal.id==id );


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delimale',
      theme: ThemeData
      (
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254,229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
           color: Color.fromRGBO(20, 51,51, 1)
          ),
        bodyText2: 

TextStyle(
           color: Color.fromRGBO(20, 51,51, 1)
          ),
         headline6: TextStyle(fontSize: 20,fontFamily: 'RobotoCondensed',fontWeight:FontWeight.bold ),

        ),
        
      ),
    initialRoute:TabsScreen.routename ,
      routes:
      {
        TabsScreen.routename:(ctx)=>TabsScreen(_favouritesScreen),


        CategoryMealsScreen.routename:(ctx)=>CategoryMealsScreen(),
        MealsDetailsScreen.routename:(ctx)=>MealsDetailsScreen(_togglefavourite,_isfavourite),
        FiltersScreen.routename:(ctx)=>FiltersScreen(), 


      } ,
      
    );
  }
}
