import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}


class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String,Widget>> _pages= [
    {
      'page':CategoriesScreen(),
      'title':Text('Categories'),

    },
    {
    'page':FavoritesScreen(),
    'title':Text('Your Favorites')
    }

  ];


  int _selectPageIndex =0;

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
        selectedItemColor: Theme.of(context).accentColor,
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
