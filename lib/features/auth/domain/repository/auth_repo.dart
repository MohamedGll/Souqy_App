import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failures.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';

abstract class AuthRepo {
  Future<Either<MyFailures, bool>> signIn(String email, String password);
  Future<Either<MyFailures, UserModel>> signUp(SignupEntity signupEntity);
}
