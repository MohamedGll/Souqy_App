import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failures.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repo.dart';

class SignupUsecase {
  AuthRepo authRepo;

  SignupUsecase(this.authRepo);

  Future<Either<MyFailures, UserModel>> call(SignupEntity signupEntity) =>
      authRepo.signUp(signupEntity);
}
