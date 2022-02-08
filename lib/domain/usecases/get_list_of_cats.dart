import 'package:cats_app/core/usecases/repository_usecase.dart';
import 'package:cats_app/domain/entities/cat.dart';
import 'package:cats_app/domain/repositories/cats_repository.dart';

class GetListOfCats implements RepositoryUseCase<List<Cat>, NoParams>{
  final CatsRepository catsRepository;

  GetListOfCats(this.catsRepository);

  @override
  Future<List<Cat>> call(NoParams params) async {
    return await catsRepository.getListOfCats();
  }

}

class NoParams{
}