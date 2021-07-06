import 'package:flutter/material.dart';
import '../widgets/meals_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  //final String categoryid;
  //final String categorytitle;
//CategoryMealsScreen(this.categorytitle,this.categoryid);
  static const routename = '/category_meals';

  @override
  Widget build(BuildContext context) {
    final routargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categorytitle = routargs['title'];
    final categoryid = routargs['id'];
    final categorymeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            title: categorymeals[index].title,
            imageurl: categorymeals[index].imageUrl,
            duration: categorymeals[index].duration,
            complexity:categorymeals[index].complexity,
            affordability:categorymeals[index].affordability,
            id:categorymeals[index].id ,
          );
        },
        itemCount: categorymeals.length,
      ),
    );
  }
}
