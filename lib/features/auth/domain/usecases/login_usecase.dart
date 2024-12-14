import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failures.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repo.dart';

class LoginUsecase {
  AuthRepo authRepo;

  LoginUsecase(this.authRepo);

  Future<Either<MyFailures, bool>> call(String email, String password) =>
      authRepo.signIn(email, password);
}
