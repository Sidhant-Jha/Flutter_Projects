import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_type.dart';
import 'package:firebase_api/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WallpaperCollectionTypeBuilder extends StatelessWidget {
  const WallpaperCollectionTypeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WallpaperViewModel, WallpaperCollectionType>(
          selector: (_, viewModel) => viewModel.category,
          builder: (context, selectedCategory , child) {
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Collection Type",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  ...WallpaperCollectionType.values.map((category)
                  {
                    return
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InputChip(
                            label: Text(category.name),
                            selected: selectedCategory == category,
                            onSelected: (value) 
                            {
                              _onSelectedEvent(value, context, category);
                            }
                          ),
                        );
                  }).toList()
                ],
              )
            ]
          );
          },
        );
  }

  void _onSelectedEvent(bool value, BuildContext context, WallpaperCollectionType category) {
    if(value)
    {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<WallpaperViewModel>().changeCollectionTypeEvent(category);
        });
    }
  }
  }
