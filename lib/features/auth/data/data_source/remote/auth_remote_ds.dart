import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';

abstract class AuthRemoteDs {
  Future<bool> signIn(String email, String password);
  Future<UserModel> signUp(SignupEntity signupEntity);
}
