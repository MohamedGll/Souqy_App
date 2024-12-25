import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';

abstract class CategoryRemoteDs {
  Future<CategoryModel> getCategory();
}
