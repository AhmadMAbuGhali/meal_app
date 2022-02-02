import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoritesMeal;

  const TabsScreen( this.favoritesMeal);


  @override
  _TabsScreenState createState() => _TabsScreenState();
}


class _TabsScreenState extends State<TabsScreen> {

   List<Map<String,Widget>> _pages;

  int _selectPageIndex =0;

  @override
  void initState() {
  _pages =  [
      {
        'page':CategoriesScreen(),
        'title':Text('Categories'),

      },
      {
        'page':FavoritesScreen(widget.favoritesMeal),
        'title':Text('Your Favorites')
      }

    ];

    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectPageIndex]['title'],
      ),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites"
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

}
