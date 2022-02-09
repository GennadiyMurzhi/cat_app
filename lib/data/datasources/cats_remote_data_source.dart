import 'package:cats_app/core/error/exception.dart';
import 'package:cats_app/data/models/cat_details_model.dart';
import 'package:cats_app/data/models/cat_model.dart';
import 'package:cats_app/domain/entities/cat.dart';
import 'package:cats_app/domain/entities/cat_details.dart';
import 'package:dio/dio.dart';

abstract class CatsRemoteDataSource{
  Future<List<Cat>> getListOfCats();
  Future<CatDetails> getCatDetails(String id);
}

class CatsRemoteDataSourceImpl extends CatsRemoteDataSource{
  final Dio client;
  
  CatsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Cat>> getListOfCats() async {
    final response = await client.get('https://api.thecatapi.com/v1/breeds');

    if(response.statusCode == 200) {
      final listFromJson = (response.data as List<dynamic>).map(
              (e) => (e as Map<String, dynamic>)).toList();

      return List.generate(listFromJson.length,
              (index) => CatModel.fromJson(listFromJson[index]));
    } else {
      throw APIException;
    }
  }
  
  @override
  Future<CatDetails> getCatDetails(String id) async {
    final response = await client.get(
        'https://api.thecatapi.com/v1/breeds/search',
        queryParameters: {'q': id}
    );

    if(response.statusCode == 200) {
      return CatDetailsModel.fromJson(response.data[0]);
    } else {
      throw APIException;
    }
  }


}