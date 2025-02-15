import 'package:firebase_api/modules/collection/view/private_collection_page.dart';
import 'package:firebase_api/modules/collection/view/public_collection_page.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
     child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Text("Public"),
              ),
        
              Tab(
                icon: Text("Private"),
              )
            ]
          ),
        ),
      ),
      body: TabBarView(
        children: [
          PublicCollectionPage(),
          PrivateCollectionPage()
        ]
      ),
     )
    );
  }
}