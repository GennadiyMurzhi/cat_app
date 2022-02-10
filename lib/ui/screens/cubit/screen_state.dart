part of 'screen_cubit.dart';

abstract class ScreenState extends Equatable {
  const ScreenState();
}

class ScreenInitial extends ScreenState {
  @override
  List<Object> get props => [];
}

class ScreenLoading extends ScreenState {
  @override
  List<Object> get props => [];
}

@immutable
class ScreenLoaded extends ScreenState {
  List<Cat>? listOfCats;
  CatDetails? catDetails;
  Cat? cat;

  ScreenLoaded({
    this.listOfCats,
    this.cat,
    this.catDetails,
  }) : super();

  @override
  List<Object> get props => [listOfCats ?? listOfCats!, catDetails ?? catDetails!, cat ?? cat!];
}

class APIError extends ScreenState {
  @override
  List<Object> get props => [];
}

class ListEmptyError extends ScreenState {
  @override
  List<Object> get props => [];
}
