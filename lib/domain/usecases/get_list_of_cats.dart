import 'package:cats_app/core/usecases/repository_usecase.dart';
import 'package:cats_app/domain/entities/cat.dart';
import 'package:cats_app/domain/repositories/cats_repository.dart';

class GetListOfCats implements RepositoryUseCase<List<Cat>, NoParams>{
  final CatsRepository repository;

  GetListOfCats({required this.repository});

  @override
  Future<List<Cat>> call(NoParams params) async {
    return await repository.getListOfCats();
  }

}

class NoParams{
}