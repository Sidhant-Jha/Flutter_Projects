import 'package:firebase_api/modules/home/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, Widget>(
      selector: (HomeViewModel, viewModel) => viewModel.selectedPage,
      builder: (context, selectedPage, child){
        return selectedPage;
      }
    );
  }
}