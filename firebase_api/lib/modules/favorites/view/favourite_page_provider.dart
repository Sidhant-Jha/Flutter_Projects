import 'package:firebase_api/modules/favorites/view/favourites_page.dart';
import 'package:firebase_api/modules/favorites/view_model/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePageProvider extends StatelessWidget {
  const FavouritePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => FavouriteViewModel(),
    child: FavouritesPage(),);
  }
}