import 'package:firebase_api/modules/collection/view/public_view/public_collections_grid_view_builder.dart';
import 'package:flutter/material.dart';

class PublicCollectionPage extends StatelessWidget {
  const PublicCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PublicCollectionsGridViewBuilder();
  }
}
