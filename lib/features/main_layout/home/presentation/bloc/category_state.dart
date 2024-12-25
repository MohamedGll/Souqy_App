part of 'category_bloc.dart';

class CategoryState {
  RequestState? requestState;
  CategoryModel? categoryModel;
  String? errorMessage;

  CategoryState({this.requestState, this.categoryModel, this.errorMessage});

  CategoryState copyWith(
      {RequestState? requestState,
      CategoryModel? categoryModel,
      String? errorMessage}) {
    return CategoryState(
      requestState: requestState ?? this.requestState,
      categoryModel: categoryModel ?? this.categoryModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class CategoryInitial extends CategoryState {
  CategoryInitial()
      : super(
          requestState: RequestState.init,
          categoryModel: null,
          errorMessage: '',
        );
}
