import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/category_model.dart';

abstract class CategoryRepo {
  Future<Either<RemoteFailures, CategoryModel>> getCategory();
}
