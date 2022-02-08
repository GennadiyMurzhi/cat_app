abstract class RepositoryUseCase<Type, Params> {
  Future<Type> call(Params params);
}