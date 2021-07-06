import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';


class Categoryitem extends StatelessWidget {
  final String id;
   final String title;
  final Color color;
  Categoryitem(this.title, this.color,this.id);
  void selectcategory(BuildContext ctx)
  {
   Navigator.of(ctx).pushNamed(CategoryMealsScreen.routename,arguments:
   {
     'id':id,
     'title':title,

     
   } 
   );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>  selectcategory(context),
      splashColor: Theme.of(context).primaryColor,
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: 
            [
              color.withOpacity(.7),
              color,

            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
         borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
