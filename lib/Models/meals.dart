import 'package:flutter/material.dart';



class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients; //المكونات
  final List<String>steps;
  final int  duration; //المده التي يستغرقها
  final Complexity complexity; //مدي التعقيد في تحضير الوجبه
  final Affordability affordability; //هل هذه الوجبه مناسبه للجميع
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

 const Meal(
    {
      @required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
       @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian,
       
      
      });
}
enum Complexity {
  Simple,
  Challenging,
  Hard,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}