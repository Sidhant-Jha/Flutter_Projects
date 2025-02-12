import 'dart:developer';

import 'package:firebase_api/modules/explore/service/explore_remote_service.dart';
import 'package:firebase_api/modules/explore/view/widgets/explore_wallpapers_grid_view_builder.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ExploreWallpapersGridViewBuilder();
  }
}