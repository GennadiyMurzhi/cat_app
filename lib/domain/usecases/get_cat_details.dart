import 'package:cats_app/core/usecases/repository_usecase.dart';
import 'package:cats_app/domain/entities/cat_details.dart';
import 'package:cats_app/domain/repositories/cats_repository.dart';

class GetCatDetails implements RepositoryUseCase<CatDetails, Params>{
  final CatsRepository repository;

  GetCatDetails({required this.repository});

  @override
  Future<CatDetails> call(Params params) async {
    return await repository.getCatDetails(params.id);
  }

}

class Params{
  final String id;

  const Params(this.id);
}