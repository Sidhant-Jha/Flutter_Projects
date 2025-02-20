import 'package:firebase_api/modules/collection/view/collection_page.dart';
import 'package:firebase_api/modules/collection/view_model/collection_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionPageProvider extends StatelessWidget {
  const CollectionPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CollectionViewModel(),
    child: CollectionPage(),);
  }
}