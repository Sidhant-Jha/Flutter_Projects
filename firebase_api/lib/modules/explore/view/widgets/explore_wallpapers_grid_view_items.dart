import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/wallpaper/view/wallpaper_screen.dart';
import 'package:firebase_api/modules/wallpaper/view/wallpaper_screen_provider.dart';
import 'package:flutter/material.dart';

class ExploreWallpapersGridViewItems extends StatelessWidget {
  const ExploreWallpapersGridViewItems({
    super.key,
    required this.wallpaper,
  });

  final WallpaperModel wallpaper;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WallpaperScreenProvider(model: wallpaper)));
      },
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(),
          image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(wallpaper.src.medium)),
          borderRadius: BorderRadius.circular(12)
        ),
          alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12), 
            ),
            color: Colors.black45
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                wallpaper.photographer,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white
                )
                
              ),
              SizedBox(height: 5,),
              Text(wallpaper.alt,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white
                ))
            ],
          ),
        ),
      ),
    );
  }
}