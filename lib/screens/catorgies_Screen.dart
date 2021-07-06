import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_items.dart';

class CatorgiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map(
          (catdata) {
            return Categoryitem(catdata.title, catdata.color,catdata.id);
          },
        ).toList(),
        
      
    );
  }
}
