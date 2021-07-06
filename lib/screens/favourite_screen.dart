import 'package:flutter/material.dart';
import '../Models/meals.dart';
import '../widgets/meals_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List <Meal> favouritemeals;
  FavouriteScreen(this.favouritemeals); 


  @override
  Widget build(BuildContext context) {
    if(favouritemeals.isEmpty)
    {
      return Center
    (
      child: Text('you have no favourites yet please Starting adding some favourites'),
      
    );

    }
    else
    {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            title:  favouritemeals[index].title,
            imageurl:  favouritemeals[index].imageUrl,
            duration:  favouritemeals[index].duration,
            complexity: favouritemeals[index].complexity,
            affordability: favouritemeals[index].affordability,
            id: favouritemeals[index].id ,
          );
        },
        itemCount:  favouritemeals.length,
      );
      

    }
    
  }
}