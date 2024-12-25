import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/enum.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/get_category_usecase.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoryUsecase getCategoryUsecase;

  HomeBloc(this.getCategoryUsecase) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
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
