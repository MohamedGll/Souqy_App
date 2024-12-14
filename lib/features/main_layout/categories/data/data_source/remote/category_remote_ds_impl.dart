import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/exceptions/exceptions.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/remote/category_remote_ds.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/category_model.dart';

class CategoryRemoteDsImpl implements CategoryRemoteDs {
  ApiManager apiManager;
  CategoryRemoteDsImpl(this.apiManager);
  @override
  Future<CategoryModel> getCategory() async {
    try {
      var response = await apiManager.getData(endPoint: EndPoints.getCategory);
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      return categoryModel;
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
