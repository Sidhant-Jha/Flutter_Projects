import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_api/core/env_service.dart';
import 'package:firebase_api/modules/explore/model/wallpaper_response_model.dart';

class ExploreRemoteService
{
  final _client = Dio(
    BaseOptions(
      baseUrl: 'https://api.pexels.com',
    )
  );

  Future<Either<String, WallpaperResponseModel>> getWallpapers()
  async {
    try
    {
      final response = await _client.get('/v1/curated',
      queryParameters: {
        'page' : 1,
        'per_page' : 5
      },
      
      options: Options(
        headers: {
          'Authorization' : EnvService.apiKey,
        }
      ));

      log(response.statusCode.toString());

      final result = WallpaperResponseModel.fromMap(response.data);
      // log(result.photos.first.photographer);
      // log('${result}');
      return Right(result);

    }
    on DioException catch(e)
    {
      return Left(e.message ?? "Something went wrong!");
    }
  }
}