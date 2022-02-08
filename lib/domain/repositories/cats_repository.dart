import 'package:cats_app/domain/entities/cat.dart';
import 'package:cats_app/domain/entities/cat_details.dart';

abstract class CatsRepository {
  Future<List<Cat>> getListOfCats();
  Future<CatDetails> getCatDetails(String id);
}