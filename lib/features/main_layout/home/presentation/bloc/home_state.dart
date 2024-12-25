part of 'home_bloc.dart';

class HomeState {
  RequestState? requestState;
  CategoryModel? categoryModel;
  String? errorMessage;

  HomeState({this.requestState, this.categoryModel, this.errorMessage});

  HomeState copyWith(
      {RequestState? requestState,
      CategoryModel? categoryModel,
      String? errorMessage}) {
    return HomeState(
      requestState: requestState ?? this.requestState,
      categoryModel: categoryModel ?? this.categoryModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class HomeInitial extends HomeState {
  HomeInitial()
      : super(
          requestState: RequestState.init,
          categoryModel: null,
          errorMessage: '',
        );
}
