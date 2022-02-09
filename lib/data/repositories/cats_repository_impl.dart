import 'package:cats_app/data/datasources/cats_remote_data_source.dart';
import 'package:cats_app/domain/entities/cat.dart';
import 'package:cats_app/domain/entities/cat_details.dart';
import 'package:cats_app/domain/repositories/cats_repository.dart';

class CatsRepositoryImpl extends CatsRepository{
  final CatsRemoteDataSource remoteDataSource;

  CatsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Cat>> getListOfCats() async {
    return await remoteDataSource.getListOfCats();
  }

  @override
  Future<CatDetails> getCatDetails(String id) async {
    return await remoteDataSource.getCatDetails(id);
  }

}