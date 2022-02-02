import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
Map<String,bool> _filters={
  'gluten':false,
  'lactose':false,
  'vegan':false,
  'vegetarian':false,
};
List<Meal> _availableMeals = DUMMY_MEALS;
List<Meal> _favoritesMeals = [];

void  _setFilters(Map<String,bool> _filtersData){
setState(() {
  _filters = _filtersData;
  _availableMeals = DUMMY_MEALS.where((meal) {

    if(_filters['gluten'] && meal.isGlutenFree == false){
      return false;
    }
    if(_filters['lactose'] && !meal.isLactoseFree == false){
      return false;
    }
    if(_filters['vegan'] && !meal.isVegan == false){
      return false;
    }
    if(_filters['vegetarian'] && !meal.isVegetarian == false){
      return false;
    }
    return true;

  }).toList();
});

}
void _toggleFavorite(String mealId){
 final existingIndex=  _favoritesMeals.indexWhere((meal) => meal.id ==mealId );
 if(existingIndex>=0){
   setState(() {
     _favoritesMeals.remove(existingIndex);
   });
 }
 else{
   setState(() {
     _favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id ==mealId));
   });
 }
}
bool isMealFavorite(String id){
  return _favoritesMeals.any((meal) => meal.id == id );
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                headline6: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber)),
     // home: MyHomePage(),

      routes: {
        '/' :(context) => TabsScreen(_favoritesMeals),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite,isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters,_setFilters),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}
