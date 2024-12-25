import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/enum.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/get_category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetCategoryUsecase getCategoryUsecase;

  CategoryBloc(this.getCategoryUsecase) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      emit(state.copyWith(
        requestState: RequestState.loading,
      ));
      var data = await getCategoryUsecase.call();
      data.fold(
        (l) {
          emit(state.copyWith(
            requestState: RequestState.error,
            errorMessage: l.message,
          ));
        },
        (r) {
          emit(state.copyWith(
            requestState: RequestState.success,
            categoryModel: r,
          ));
        },
      );
    });
  }
}
