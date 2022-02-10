import 'package:bloc/bloc.dart';
import 'package:cats_app/core/error/exception.dart';
import 'package:cats_app/domain/entities/cat.dart';
import 'package:cats_app/domain/entities/cat_details.dart';
import 'package:cats_app/domain/usecases/get_cat_details.dart';
import 'package:cats_app/domain/usecases/get_list_of_cats.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'screen_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  final GetListOfCats getListOfCats;
  final GetCatDetails getCatDetails;

  late List<Cat> _listOfCats;

  ScreenCubit({
    required this.getListOfCats,
    required this.getCatDetails,
  }) : super(ScreenInitial()) {
    loadListOfCat();
  }

  void loadListOfCat() async {
    _setUpEmit(() async {
      _listOfCats = await getListOfCats(NoParams());

      return ScreenLoaded(listOfCats: _listOfCats);
    });
  }

  void loadOfCatDetails(String apiId, int listId) async {
    _setUpEmit(() async {
      final catDetails = await getCatDetails(Params(id: apiId));

      return ScreenLoaded(
        listOfCats: _listOfCats,
        cat: _listOfCats[listId],
        catDetails: catDetails,
      );
    });
  }

  void _setUpEmit(Future<ScreenLoaded> Function() useUseCase) async {
    emit(ScreenLoading());

    try {
      final loaded = await useUseCase();

      if(_listOfCats.isEmpty){
        emit(ListEmptyError());
      } else {
        emit(loaded);
      }
    } on APIException{
      emit(APIError());
    }

  }
}


