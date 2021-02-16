import 'package:flutter/material.dart';
import '../models/meal.dart';
import './categoriesScreen.dart';
import './favoritesScreen.dart';
import '../shared_Code/mainDrawer.dart';

class TabScreenView extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabScreenView(this.favoriteMeals);

  @override
  _TabScreenViewState createState() => _TabScreenViewState();
}

class _TabScreenViewState extends State<TabScreenView> {


  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavortiesScreen(widget.favoriteMeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // ============= BOTTOM NAVIGATION BAR ===============

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white24,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        elevation: 8.0,
        //  =======++++  NOT USED IN CASE OF ANIMATION =========
        // backgroundColor: Theme.of(context).primaryColor,

        onTap: _selectedPage,
        // ===== FOR ANIMATION OF BOTTOM NAVIGATION BAR =========
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            //  =======++++  USED IN CASE OF ANIMATION TYPE =========
            backgroundColor: Theme.of(context).primaryColor,

            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
              //  =======++++  USED IN CASE OF ANIMATION TYPE =========
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite_outline),
              label: 'Favorites'),
        ],
      ),
    );

    // ============= TOP NAVIGATION BAR ===============

    // return DefaultTabController(
    //   length: 2,
    //   // =======  BY DEFAULT THE INITIAL INDEX VALUE IS 0 ==============
    //   // ======= IN CASE OF WHATSAPP INTIAL INDEX IS 1  ==============
    //   initialIndex: 0,
    //
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meal Details'),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(icon: Icon(Icons.favorite_outline), text: 'Favorites')
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [CategoriesScreen(), FavortiesScreen()],
    //     ),
    //   ),
    // );
  }
}
