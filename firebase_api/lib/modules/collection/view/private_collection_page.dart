import 'package:firebase_api/modules/collection/view/private_view/private_collections_grid_view_builder.dart';
import 'package:flutter/material.dart';

class PrivateCollectionPage extends StatelessWidget {
  const PrivateCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivateCollectionsGridViewBuilder();
  }
}