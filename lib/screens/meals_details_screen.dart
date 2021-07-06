import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routename = '/meals_details';
  final Function togglefavourite;
  final Function isfavourite;

  MealsDetailsScreen(this.togglefavourite, this.isfavourite);

  Widget buildSectiontitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildcontainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealsId = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealsId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectiontitle(context, 'Ingredient'),
            buildcontainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        selectedmeal.ingredients[index],
                      ),
                    ),
                  );
                },
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
            buildSectiontitle(context, 'Steps'),
            buildcontainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(
                          selectedmeal.steps[index],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedmeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        togglefavourite(mealsId);
      
      },
      child: isfavourite(mealsId)?Icon(Icons.star):Icon(Icons.star_border) ,
      ),
    );
  }
}
