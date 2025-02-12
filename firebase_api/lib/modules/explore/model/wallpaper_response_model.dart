import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';

class WallpaperResponseModel {
  const WallpaperResponseModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
  });

  factory WallpaperResponseModel.fromMap(Map<String, dynamic> map) {
    return WallpaperResponseModel(
      page: map['page'] as int,
      perPage: map['per_page'] as int,
      photos: (map['photos'] as List)
          .map(
            (e) => WallpaperModel.fromMap(e),
          )
          .toList(),
      totalResults: map['total_results'] as int,
    );
  }

  final int page;
  final int perPage;
  final List<WallpaperModel> photos;
  final int totalResults;
}