import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/enum.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthLoginState> {
  LoginUsecase loginUsecase;
  SignupUsecase signupUsecase;
  AuthBloc(this.loginUsecase, this.signupUsecase) : super(AuthLoginInit()) {
    on<AuthEvent>((event, emit) {});

    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(
        requestState: RequestState.loading,
      ));
      var data = await loginUsecase.call(event.email, event.password);

      data.fold(
        (l) {
          emit(state.copyWith(
            requestState: RequestState.error,
            loggedIn: false,
            errorMessage: l.message,
          ));
        },
        (r) {
          emit(state.copyWith(
            requestState: RequestState.success,
            loggedIn: r,
          ));
        },
      );
    });

    on<SignUpEvent>((event, emit) async {
      emit(
        state.copyWith(
          requestState: RequestState.loading,
        ),
      );
      var data = await signupUsecase.call(event.signupEntity);

      data.fold(
        (l) {
          emit(state.copyWith(
            errorMessage: l.message,
            requestState: RequestState.error,
          ));
        },
        (r) {
          emit(
            state.copyWith(
              requestState: RequestState.success,
            ),
          );
        },
      );
    });
  }
}
