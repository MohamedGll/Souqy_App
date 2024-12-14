import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/api/status_codes.dart';
import 'package:ecommerce_app/core/cache/shared_pref.dart';
import 'package:ecommerce_app/core/exceptions/exceptions.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_remote_ds.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';

class AuthRemoteDsImpl implements AuthRemoteDs {
  ApiManager apiManager;
  AuthRemoteDsImpl(this.apiManager);
  @override
  Future<bool> signIn(String email, String password) async {
    // call api
    try {
      final response = await apiManager.postData(
        endPoint: EndPoints.signIn,
        body: {
          "email": email,
          "password": password,
        },
      );

      // print(response.statusCode);
      // print(response.data);
      if (response.statusCode == StatusCodes.success) {
        await CacheHelper.saveData<String>('token', response.data['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }

  @override
  Future<UserModel> signUp(SignupEntity signupEntity) async {
    try {
      final response = await apiManager.postData(
        endPoint: EndPoints.signUp,
        body: signupEntity.toJson(),
      );
      UserModel userModel = UserModel.fromJson(response.data);
      return userModel;
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
