import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failures.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_remote_ds.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRemoteDs authRemoteDs;
  AuthRepoImpl(this.authRemoteDs);

  @override
  Future<Either<MyFailures, bool>> signIn(String email, String password) async {
    try {
      bool loggedIn = await authRemoteDs.signIn(email, password);
      if (!loggedIn) {
        return Left(
            InvalidCredentionalFailures('Invalid userName or password'));
      }
      return Right(loggedIn);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<MyFailures, UserModel>> signUp(
      SignupEntity signupEntity) async {
    try {
      final userModel = await authRemoteDs.signUp(signupEntity);
      return Right(userModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
