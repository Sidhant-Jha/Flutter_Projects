import 'package:flutter/material.dart';
import 'package:namebothpage/first_page.dart';
import 'package:namebothpage/model_view.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => NameModelView(),
    child: MaterialApp(
      home: FirstNameChange(),
    )
    );
  }
  
}