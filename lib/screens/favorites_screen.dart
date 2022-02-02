import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoritesMeal;

  const FavoritesScreen( this.favoritesMeal);
  @override
  Widget build(BuildContext context) {

    if(favoritesMeal.isEmpty){
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    }
    else{

     return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritesMeal[index].id,
            imageUrl: favoritesMeal[index].imageUrl,
            title: favoritesMeal[index].title,
            duration: favoritesMeal[index].duration,
            complexity: favoritesMeal[index].complexity,
            affordability: favoritesMeal[index].affordability,

          );
        },
        itemCount: favoritesMeal.length,
      );
    }



  }
}
