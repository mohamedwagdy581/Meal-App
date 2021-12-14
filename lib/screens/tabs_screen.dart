import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TapsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  TapsScreen(this.favoriteMeal);
  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {




  late List _pages ;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page' : CategoriesScreen(),
        'title' : 'Categories',
      },
      {
        'page' : FavoritesScreen(widget.favoriteMeal),
        'title' : 'Favorites',
      }
    ];

    super.initState();
  }

  void _selectPage (int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // The AppBar of Scaffold
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),

        // The Drawer of Scaffold
        drawer: MainDrawer(),
        
        // The Body of Scaffold
        body: _pages[_selectedPageIndex]['page'],

      // The BottomNavigationBar of Scaffold
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
