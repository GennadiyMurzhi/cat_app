import 'package:cats_app/data/datasources/cats_remote_data_source.dart';
import 'package:cats_app/data/repositories/cats_repository_impl.dart';
import 'package:cats_app/domain/repositories/cats_repository.dart';
import 'package:cats_app/domain/usecases/get_cat_details.dart';
import 'package:cats_app/domain/usecases/get_list_of_cats.dart';
import 'package:cats_app/ui/screens/cubit/screen_cubit.dart';
import 'package:dio/dio.dart';

final locator = ServiceLocator();

void init() {
  locator.addService<Dio>(Dio());

  locator.addService<CatsRemoteDataSource>(CatsRemoteDataSourceImpl(client: locator<Dio>()));

  locator.addService<CatsRepository>(CatsRepositoryImpl(remoteDataSource: locator<CatsRemoteDataSource>()));

  locator.addService<GetListOfCats>(GetListOfCats(repository: locator<CatsRepository>()));

  locator.addService<GetCatDetails>(GetCatDetails(repository: locator<CatsRepository>()));

  locator.addService<ScreenCubit>(ScreenCubit(
    getListOfCats: locator<GetListOfCats>(),
    getCatDetails: locator<GetCatDetails>(),
  ));

}

class ServiceLocator{
  Map<Type, Object> services = {};

  static final ServiceLocator _locator = ServiceLocator._in();

  ServiceLocator._in();

  factory ServiceLocator(){
    return _locator;
  }

  void addService<T>(Object object) {
    services.addAll({T: object});
  }

  call<T>() {
    return services[T];
  }

  @override
  String toString(){
    return services.toString();
  }

}

