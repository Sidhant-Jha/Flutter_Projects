import 'package:firebase_api/modules/collection/view/collection_page.dart';
import 'package:firebase_api/modules/collection/view/collection_page_provider.dart';
import 'package:firebase_api/modules/explore/view/explore_page.dart';
import 'package:firebase_api/modules/explore/view/explore_page_provider.dart';
import 'package:firebase_api/modules/favorites/view/favourite_page_provider.dart';
import 'package:firebase_api/modules/favorites/view/favourites_page.dart';
import 'package:firebase_api/modules/home/model/bottom_nav_model.dart';
import 'package:firebase_api/modules/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier
{
  final navigationItems = [
    BottomNavModel(icon: Icon(Icons.home), name: "Home", page: ExplorePageProvider()),
    BottomNavModel(icon: Icon(Icons.collections_bookmark_outlined), name: "Collection", page: CollectionPageProvider()),
    BottomNavModel(icon: Icon(Icons.favorite), name: "Favorite", page: FavouritePageProvider()),
  ];

  int selectedIndex = 0;

  void indexChangeIndex(int index)
  {
    selectedIndex = index;
    notifyListeners();
  }

  Widget get selectedPage => navigationItems[selectedIndex].page;


}